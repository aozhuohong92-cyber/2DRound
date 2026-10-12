package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HeaderConstants;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.apache.commons.httpclient.cookie.CookieSpec;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ResponseCachingPolicy {
    private static final String[] AUTH_CACHEABLE_PARAMS = {"s-maxage", HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE, HeaderConstants.PUBLIC};
    private static final Set<Integer> cacheableStatuses = new HashSet(Arrays.asList(200, 203, 300, 301, 410));
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final long maxObjectSizeBytes;
    private final boolean neverCache1_0ResponsesWithQueryString;
    private final boolean sharedCache;
    private final Set<Integer> uncacheableStatuses;

    public ResponseCachingPolicy(long maxObjectSizeBytes, boolean sharedCache, boolean neverCache1_0ResponsesWithQueryString, boolean allow303Caching) {
        this.maxObjectSizeBytes = maxObjectSizeBytes;
        this.sharedCache = sharedCache;
        this.neverCache1_0ResponsesWithQueryString = neverCache1_0ResponsesWithQueryString;
        if (allow303Caching) {
            this.uncacheableStatuses = new HashSet(Arrays.asList(206));
        } else {
            this.uncacheableStatuses = new HashSet(Arrays.asList(206, 303));
        }
    }

    public boolean isResponseCacheable(String httpMethod, HttpResponse response) throws ParseException, NumberFormatException {
        boolean cacheable = false;
        if (!"GET".equals(httpMethod) && !"HEAD".equals(httpMethod)) {
            this.log.debug("Response was not cacheable.");
            return false;
        }
        int status = response.getStatusLine().getStatusCode();
        if (cacheableStatuses.contains(Integer.valueOf(status))) {
            cacheable = true;
        } else if (this.uncacheableStatuses.contains(Integer.valueOf(status)) || unknownStatusCode(status)) {
            return false;
        }
        Header contentLength = response.getFirstHeader("Content-Length");
        if (contentLength != null) {
            int contentLengthValue = Integer.parseInt(contentLength.getValue());
            if (contentLengthValue > this.maxObjectSizeBytes) {
                return false;
            }
        }
        Header[] ageHeaders = response.getHeaders("Age");
        if (ageHeaders.length > 1) {
            return false;
        }
        Header[] expiresHeaders = response.getHeaders("Expires");
        if (expiresHeaders.length > 1) {
            return false;
        }
        Header[] dateHeaders = response.getHeaders("Date");
        if (dateHeaders.length != 1) {
            return false;
        }
        Date date = DateUtils.parseDate(dateHeaders[0].getValue());
        if (date == null) {
            return false;
        }
        for (Header varyHdr : response.getHeaders("Vary")) {
            for (HeaderElement elem : varyHdr.getElements()) {
                if ("*".equals(elem.getName())) {
                    return false;
                }
            }
        }
        if (isExplicitlyNonCacheable(response)) {
            return false;
        }
        return cacheable || isExplicitlyCacheable(response);
    }

    private boolean unknownStatusCode(int status) {
        if (status >= 100 && status <= 101) {
            return false;
        }
        if (status >= 200 && status <= 206) {
            return false;
        }
        if (status >= 300 && status <= 307) {
            return false;
        }
        if (status < 400 || status > 417) {
            return status < 500 || status > 505;
        }
        return false;
    }

    protected boolean isExplicitlyNonCacheable(HttpResponse response) throws ParseException {
        Header[] cacheControlHeaders = response.getHeaders("Cache-Control");
        for (Header header : cacheControlHeaders) {
            for (HeaderElement elem : header.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_NO_STORE.equals(elem.getName()) || HeaderConstants.CACHE_CONTROL_NO_CACHE.equals(elem.getName()) || (this.sharedCache && HeaderConstants.PRIVATE.equals(elem.getName()))) {
                    return true;
                }
            }
        }
        return false;
    }

    protected boolean hasCacheControlParameterFrom(HttpMessage msg, String[] params) throws ParseException {
        Header[] cacheControlHeaders = msg.getHeaders("Cache-Control");
        for (Header header : cacheControlHeaders) {
            for (HeaderElement elem : header.getElements()) {
                for (String param : params) {
                    if (param.equalsIgnoreCase(elem.getName())) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    protected boolean isExplicitlyCacheable(HttpResponse response) {
        if (response.getFirstHeader("Expires") != null) {
            return true;
        }
        String[] cacheableParams = {"max-age", "s-maxage", HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE, HeaderConstants.CACHE_CONTROL_PROXY_REVALIDATE, HeaderConstants.PUBLIC};
        return hasCacheControlParameterFrom(response, cacheableParams);
    }

    public boolean isResponseCacheable(HttpRequest request, HttpResponse response) {
        Header[] authNHeaders;
        if (requestProtocolGreaterThanAccepted(request)) {
            this.log.debug("Response was not cacheable.");
            return false;
        }
        String[] uncacheableRequestDirectives = {HeaderConstants.CACHE_CONTROL_NO_STORE};
        if (hasCacheControlParameterFrom(request, uncacheableRequestDirectives)) {
            return false;
        }
        if (request.getRequestLine().getUri().contains("?")) {
            if (this.neverCache1_0ResponsesWithQueryString && from1_0Origin(response)) {
                this.log.debug("Response was not cacheable as it had a query string.");
                return false;
            }
            if (!isExplicitlyCacheable(response)) {
                this.log.debug("Response was not cacheable as it is missing explicit caching headers.");
                return false;
            }
        }
        if (expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(response)) {
            return false;
        }
        if (this.sharedCache && (authNHeaders = request.getHeaders("Authorization")) != null && authNHeaders.length > 0 && !hasCacheControlParameterFrom(response, AUTH_CACHEABLE_PARAMS)) {
            return false;
        }
        String method = request.getRequestLine().getMethod();
        return isResponseCacheable(method, response);
    }

    private boolean expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(HttpResponse response) {
        if (response.getFirstHeader("Cache-Control") != null) {
            return false;
        }
        Header expiresHdr = response.getFirstHeader("Expires");
        Header dateHdr = response.getFirstHeader("Date");
        if (expiresHdr == null || dateHdr == null) {
            return false;
        }
        Date expires = DateUtils.parseDate(expiresHdr.getValue());
        Date date = DateUtils.parseDate(dateHdr.getValue());
        if (expires == null || date == null) {
            return false;
        }
        return expires.equals(date) || expires.before(date);
    }

    private boolean from1_0Origin(HttpResponse response) throws ParseException {
        Header via = response.getFirstHeader("Via");
        if (via != null) {
            HeaderElement[] elements = via.getElements();
            if (0 < elements.length) {
                HeaderElement elt = elements[0];
                String proto = elt.toString().split("\\s")[0];
                if (proto.contains(CookieSpec.PATH_DELIM)) {
                    return proto.equals("HTTP/1.0");
                }
                return proto.equals("1.0");
            }
        }
        return HttpVersion.HTTP_1_0.equals(response.getProtocolVersion());
    }

    private boolean requestProtocolGreaterThanAccepted(HttpRequest req) {
        return req.getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) > 0;
    }
}
