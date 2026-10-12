package cz.msebera.android.httpclient.client.utils;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.routing.RouteInfo;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.TextUtils;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Stack;
import org.apache.commons.httpclient.cookie.CookieSpec;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class URIUtils {
    @Deprecated
    public static URI createURI(String scheme, String host, int port, String path, String query, String fragment) throws URISyntaxException {
        StringBuilder buffer = new StringBuilder();
        if (host != null) {
            if (scheme != null) {
                buffer.append(scheme);
                buffer.append("://");
            }
            buffer.append(host);
            if (port > 0) {
                buffer.append(':');
                buffer.append(port);
            }
        }
        if (path == null || !path.startsWith(CookieSpec.PATH_DELIM)) {
            buffer.append('/');
        }
        if (path != null) {
            buffer.append(path);
        }
        if (query != null) {
            buffer.append('?');
            buffer.append(query);
        }
        if (fragment != null) {
            buffer.append('#');
            buffer.append(fragment);
        }
        return new URI(buffer.toString());
    }

    public static URI rewriteURI(URI uri, HttpHost target, boolean dropFragment) throws URISyntaxException {
        Args.notNull(uri, "URI");
        if (!uri.isOpaque()) {
            URIBuilder uribuilder = new URIBuilder(uri);
            if (target != null) {
                uribuilder.setScheme(target.getSchemeName());
                uribuilder.setHost(target.getHostName());
                uribuilder.setPort(target.getPort());
            } else {
                uribuilder.setScheme(null);
                uribuilder.setHost(null);
                uribuilder.setPort(-1);
            }
            if (dropFragment) {
                uribuilder.setFragment(null);
            }
            if (TextUtils.isEmpty(uribuilder.getPath())) {
                uribuilder.setPath(CookieSpec.PATH_DELIM);
            }
            return uribuilder.build();
        }
        return uri;
    }

    public static URI rewriteURI(URI uri, HttpHost target) throws URISyntaxException {
        return rewriteURI(uri, target, false);
    }

    public static URI rewriteURI(URI uri) throws URISyntaxException {
        Args.notNull(uri, "URI");
        if (!uri.isOpaque()) {
            URIBuilder uribuilder = new URIBuilder(uri);
            if (uribuilder.getUserInfo() != null) {
                uribuilder.setUserInfo(null);
            }
            if (TextUtils.isEmpty(uribuilder.getPath())) {
                uribuilder.setPath(CookieSpec.PATH_DELIM);
            }
            if (uribuilder.getHost() != null) {
                uribuilder.setHost(uribuilder.getHost().toLowerCase(Locale.ROOT));
            }
            uribuilder.setFragment(null);
            return uribuilder.build();
        }
        return uri;
    }

    public static URI rewriteURIForRoute(URI uri, RouteInfo route) throws URISyntaxException {
        if (uri == null) {
            return null;
        }
        if (route.getProxyHost() != null && !route.isTunnelled()) {
            if (!uri.isAbsolute()) {
                HttpHost target = route.getTargetHost();
                return rewriteURI(uri, target, true);
            }
            return rewriteURI(uri);
        }
        if (uri.isAbsolute()) {
            return rewriteURI(uri, null, true);
        }
        return rewriteURI(uri);
    }

    public static URI resolve(URI baseURI, String reference) {
        return resolve(baseURI, URI.create(reference));
    }

    public static URI resolve(URI baseURI, URI reference) {
        Args.notNull(baseURI, "Base URI");
        Args.notNull(reference, "Reference URI");
        URI ref = reference;
        String s = ref.toString();
        if (s.startsWith("?")) {
            return resolveReferenceStartingWithQueryString(baseURI, ref);
        }
        boolean emptyReference = s.isEmpty();
        if (emptyReference) {
            ref = URI.create("#");
        }
        URI resolved = baseURI.resolve(ref);
        if (emptyReference) {
            String resolvedString = resolved.toString();
            resolved = URI.create(resolvedString.substring(0, resolvedString.indexOf(35)));
        }
        return normalizeSyntax(resolved);
    }

    private static URI resolveReferenceStartingWithQueryString(URI baseURI, URI reference) {
        String baseUri = baseURI.toString();
        if (baseUri.indexOf(63) > -1) {
            baseUri = baseUri.substring(0, baseUri.indexOf(63));
        }
        return URI.create(baseUri + reference.toString());
    }

    private static URI normalizeSyntax(URI uri) {
        if (uri.isOpaque() || uri.getAuthority() == null) {
            return uri;
        }
        Args.check(uri.isAbsolute(), "Base URI must be absolute");
        String path = uri.getPath() == null ? "" : uri.getPath();
        String[] inputSegments = path.split(CookieSpec.PATH_DELIM);
        Stack<String> outputSegments = new Stack<>();
        for (String inputSegment : inputSegments) {
            if (!inputSegment.isEmpty() && !".".equals(inputSegment)) {
                if ("..".equals(inputSegment)) {
                    if (!outputSegments.isEmpty()) {
                        outputSegments.pop();
                    }
                } else {
                    outputSegments.push(inputSegment);
                }
            }
        }
        StringBuilder outputBuffer = new StringBuilder();
        Iterator<String> it2 = outputSegments.iterator();
        while (it2.hasNext()) {
            String outputSegment = it2.next();
            outputBuffer.append('/').append(outputSegment);
        }
        if (path.lastIndexOf(47) == path.length() - 1) {
            outputBuffer.append('/');
        }
        try {
            String scheme = uri.getScheme().toLowerCase(Locale.ROOT);
            String auth = uri.getAuthority().toLowerCase(Locale.ROOT);
            URI ref = new URI(scheme, auth, outputBuffer.toString(), null, null);
            if (uri.getQuery() != null || uri.getFragment() != null) {
                StringBuilder normalized = new StringBuilder(ref.toASCIIString());
                if (uri.getQuery() != null) {
                    normalized.append('?').append(uri.getRawQuery());
                }
                if (uri.getFragment() != null) {
                    normalized.append('#').append(uri.getRawFragment());
                }
                return URI.create(normalized.toString());
            }
            return ref;
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static HttpHost extractHost(URI uri) throws NumberFormatException {
        int colon;
        if (uri == null || !uri.isAbsolute()) {
            return null;
        }
        int port = uri.getPort();
        String host = uri.getHost();
        if (host == null && (host = uri.getAuthority()) != null) {
            int at = host.indexOf(64);
            if (at >= 0) {
                if (host.length() > at + 1) {
                    host = host.substring(at + 1);
                } else {
                    host = null;
                }
            }
            if (host != null && (colon = host.indexOf(58)) >= 0) {
                int pos = colon + 1;
                int len = 0;
                for (int i = pos; i < host.length() && Character.isDigit(host.charAt(i)); i++) {
                    len++;
                }
                if (len > 0) {
                    try {
                        port = Integer.parseInt(host.substring(pos, pos + len));
                    } catch (NumberFormatException e) {
                    }
                }
                host = host.substring(0, colon);
            }
        }
        String scheme = uri.getScheme();
        if (TextUtils.isBlank(host)) {
            return null;
        }
        try {
            HttpHost target = new HttpHost(host, port, scheme);
            return target;
        } catch (IllegalArgumentException e2) {
            return null;
        }
    }

    public static URI resolve(URI originalURI, HttpHost target, List<URI> redirects) throws URISyntaxException {
        URIBuilder uribuilder;
        Args.notNull(originalURI, "Request URI");
        if (redirects == null || redirects.isEmpty()) {
            uribuilder = new URIBuilder(originalURI);
        } else {
            uribuilder = new URIBuilder(redirects.get(redirects.size() - 1));
            String frag = uribuilder.getFragment();
            for (int i = redirects.size() - 1; frag == null && i >= 0; i--) {
                frag = redirects.get(i).getFragment();
            }
            uribuilder.setFragment(frag);
        }
        if (uribuilder.getFragment() == null) {
            uribuilder.setFragment(originalURI.getFragment());
        }
        if (target != null && !uribuilder.isAbsolute()) {
            uribuilder.setScheme(target.getSchemeName());
            uribuilder.setHost(target.getHostName());
            uribuilder.setPort(target.getPort());
        }
        return uribuilder.build();
    }

    private URIUtils() {
    }
}
