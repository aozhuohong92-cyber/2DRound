package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.CookieStore;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.config.Lookup;
import cz.msebera.android.httpclient.conn.routing.RouteInfo;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.CookieSpecProvider;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.TextUtils;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.httpclient.ConnectMethod;
import org.apache.commons.httpclient.cookie.CookieSpec;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RequestAddCookies implements HttpRequestInterceptor {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    @Override // cz.msebera.android.httpclient.HttpRequestInterceptor
    public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
        Header header;
        Args.notNull(request, "HTTP request");
        Args.notNull(context, "HTTP context");
        String method = request.getRequestLine().getMethod();
        if (!method.equalsIgnoreCase(ConnectMethod.NAME)) {
            HttpClientContext clientContext = HttpClientContext.adapt(context);
            CookieStore cookieStore = clientContext.getCookieStore();
            if (cookieStore == null) {
                this.log.debug("Cookie store not specified in HTTP context");
                return;
            }
            Lookup<CookieSpecProvider> registry = clientContext.getCookieSpecRegistry();
            if (registry == null) {
                this.log.debug("CookieSpec registry not specified in HTTP context");
                return;
            }
            HttpHost targetHost = clientContext.getTargetHost();
            if (targetHost == null) {
                this.log.debug("Target host not set in the context");
                return;
            }
            RouteInfo route = clientContext.getHttpRoute();
            if (route == null) {
                this.log.debug("Connection route not set in the context");
                return;
            }
            RequestConfig config = clientContext.getRequestConfig();
            String policy = config.getCookieSpec();
            if (policy == null) {
                policy = "default";
            }
            if (this.log.isDebugEnabled()) {
                this.log.debug("CookieSpec selected: " + policy);
            }
            URI requestURI = null;
            if (request instanceof HttpUriRequest) {
                requestURI = ((HttpUriRequest) request).getURI();
            } else {
                try {
                    URI requestURI2 = new URI(request.getRequestLine().getUri());
                    requestURI = requestURI2;
                } catch (URISyntaxException e) {
                }
            }
            String path = requestURI != null ? requestURI.getPath() : null;
            String hostName = targetHost.getHostName();
            int port = targetHost.getPort();
            if (port < 0) {
                port = route.getTargetHost().getPort();
            }
            if (port < 0) {
                port = 0;
            }
            if (TextUtils.isEmpty(path)) {
                path = CookieSpec.PATH_DELIM;
            }
            CookieOrigin cookieOrigin = new CookieOrigin(hostName, port, path, route.isSecure());
            CookieSpecProvider provider = registry.lookup(policy);
            if (provider == null) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Unsupported cookie policy: " + policy);
                    return;
                }
                return;
            }
            cz.msebera.android.httpclient.cookie.CookieSpec cookieSpec = provider.create(clientContext);
            List<Cookie> cookies = cookieStore.getCookies();
            List<Cookie> matchedCookies = new ArrayList<>();
            Date now = new Date();
            boolean expired = false;
            for (Cookie cookie : cookies) {
                if (!cookie.isExpired(now)) {
                    if (cookieSpec.match(cookie, cookieOrigin)) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Cookie " + cookie + " match " + cookieOrigin);
                        }
                        matchedCookies.add(cookie);
                    }
                } else {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Cookie " + cookie + " expired");
                    }
                    expired = true;
                }
            }
            if (expired) {
                cookieStore.clearExpired(now);
            }
            if (!matchedCookies.isEmpty()) {
                List<Header> headers = cookieSpec.formatCookies(matchedCookies);
                Iterator<Header> it2 = headers.iterator();
                while (it2.hasNext()) {
                    request.addHeader(it2.next());
                }
            }
            int ver = cookieSpec.getVersion();
            if (ver > 0 && (header = cookieSpec.getVersionHeader()) != null) {
                request.addHeader(header);
            }
            context.setAttribute("http.cookie-spec", cookieSpec);
            context.setAttribute("http.cookie-origin", cookieOrigin);
        }
    }
}
