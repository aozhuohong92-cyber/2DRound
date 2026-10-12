package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HeaderConstants;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CacheableRequestPolicy {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    CacheableRequestPolicy() {
    }

    public boolean isServableFromCache(HttpRequest request) throws ParseException {
        String method = request.getRequestLine().getMethod();
        ProtocolVersion pv = request.getRequestLine().getProtocolVersion();
        if (HttpVersion.HTTP_1_1.compareToVersion(pv) != 0) {
            this.log.trace("non-HTTP/1.1 request was not serveable from cache");
            return false;
        }
        if (!method.equals("GET") && !method.equals("HEAD")) {
            this.log.trace("non-GET or non-HEAD request was not serveable from cache");
            return false;
        }
        if (request.getHeaders("Pragma").length > 0) {
            this.log.trace("request with Pragma header was not serveable from cache");
            return false;
        }
        Header[] cacheControlHeaders = request.getHeaders("Cache-Control");
        for (Header cacheControl : cacheControlHeaders) {
            for (HeaderElement cacheControlElement : cacheControl.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_NO_STORE.equalsIgnoreCase(cacheControlElement.getName())) {
                    this.log.trace("Request with no-store was not serveable from cache");
                    return false;
                }
                if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equalsIgnoreCase(cacheControlElement.getName())) {
                    this.log.trace("Request with no-cache was not serveable from cache");
                    return false;
                }
            }
        }
        this.log.trace("Request was serveable from cache");
        return true;
    }
}
