package cz.msebera.android.httpclient.client.cache;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.protocol.BasicHttpContext;
import cz.msebera.android.httpclient.protocol.HttpContext;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpCacheContext extends HttpClientContext {
    public static final String CACHE_RESPONSE_STATUS = "http.cache.response.status";

    public static HttpCacheContext adapt(HttpContext context) {
        return context instanceof HttpCacheContext ? (HttpCacheContext) context : new HttpCacheContext(context);
    }

    public static HttpCacheContext create() {
        return new HttpCacheContext(new BasicHttpContext());
    }

    public HttpCacheContext(HttpContext context) {
        super(context);
    }

    public HttpCacheContext() {
    }

    public CacheResponseStatus getCacheResponseStatus() {
        return (CacheResponseStatus) getAttribute(CACHE_RESPONSE_STATUS, CacheResponseStatus.class);
    }
}
