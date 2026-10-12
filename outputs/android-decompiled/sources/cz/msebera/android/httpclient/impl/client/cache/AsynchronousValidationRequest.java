package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.methods.HttpExecutionAware;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class AsynchronousValidationRequest implements Runnable {
    private final HttpCacheEntry cacheEntry;
    private final CachingExec cachingExec;
    private final int consecutiveFailedAttempts;
    private final HttpClientContext context;
    private final HttpExecutionAware execAware;
    private final String identifier;
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final AsynchronousValidator parent;
    private final HttpRequestWrapper request;
    private final HttpRoute route;

    AsynchronousValidationRequest(AsynchronousValidator parent, CachingExec cachingExec, HttpRoute route, HttpRequestWrapper request, HttpClientContext context, HttpExecutionAware execAware, HttpCacheEntry cacheEntry, String identifier, int consecutiveFailedAttempts) {
        this.parent = parent;
        this.cachingExec = cachingExec;
        this.route = route;
        this.request = request;
        this.context = context;
        this.execAware = execAware;
        this.cacheEntry = cacheEntry;
        this.identifier = identifier;
        this.consecutiveFailedAttempts = consecutiveFailedAttempts;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (revalidateCacheEntry()) {
                this.parent.jobSuccessful(this.identifier);
            } else {
                this.parent.jobFailed(this.identifier);
            }
        } finally {
            this.parent.markComplete(this.identifier);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean revalidateCacheEntry() {
        /*
            r12 = this;
            r11 = 0
            cz.msebera.android.httpclient.impl.client.cache.CachingExec r0 = r12.cachingExec     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.conn.routing.HttpRoute r1 = r12.route     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.client.methods.HttpRequestWrapper r2 = r12.request     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.client.protocol.HttpClientContext r3 = r12.context     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.client.methods.HttpExecutionAware r4 = r12.execAware     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.client.cache.HttpCacheEntry r5 = r12.cacheEntry     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.client.methods.CloseableHttpResponse r6 = r0.revalidateCacheEntry(r1, r2, r3, r4, r5)     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            cz.msebera.android.httpclient.StatusLine r0 = r6.getStatusLine()     // Catch: java.lang.Throwable -> L2d
            int r10 = r0.getStatusCode()     // Catch: java.lang.Throwable -> L2d
            boolean r0 = r12.isNotServerError(r10)     // Catch: java.lang.Throwable -> L2d
            if (r0 == 0) goto L2b
            boolean r0 = r12.isNotStale(r6)     // Catch: java.lang.Throwable -> L2d
            if (r0 == 0) goto L2b
            r0 = 1
        L26:
            r6.close()     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            r11 = r0
        L2a:
            return r11
        L2b:
            r0 = r11
            goto L26
        L2d:
            r0 = move-exception
            r6.close()     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
            throw r0     // Catch: java.io.IOException -> L32 cz.msebera.android.httpclient.HttpException -> L3b java.lang.RuntimeException -> L44
        L32:
            r7 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r12.log
            java.lang.String r1 = "Asynchronous revalidation failed due to I/O error"
            r0.debug(r1, r7)
            goto L2a
        L3b:
            r8 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r12.log
            java.lang.String r1 = "HTTP protocol exception during asynchronous revalidation"
            r0.error(r1, r8)
            goto L2a
        L44:
            r9 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r12.log
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "RuntimeException thrown during asynchronous revalidation: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r9)
            java.lang.String r1 = r1.toString()
            r0.error(r1)
            goto L2a
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.client.cache.AsynchronousValidationRequest.revalidateCacheEntry():boolean");
    }

    private boolean isNotServerError(int statusCode) {
        return statusCode < 500;
    }

    private boolean isNotStale(HttpResponse httpResponse) {
        Header[] warnings = httpResponse.getHeaders("Warning");
        if (warnings != null) {
            for (Header warning : warnings) {
                String warningValue = warning.getValue();
                if (warningValue.startsWith("110") || warningValue.startsWith("111")) {
                    return false;
                }
            }
        }
        return true;
    }

    public String getIdentifier() {
        return this.identifier;
    }

    public int getConsecutiveFailedAttempts() {
        return this.consecutiveFailedAttempts;
    }
}
