package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.ServiceUnavailableRetryStrategy;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultServiceUnavailableRetryStrategy implements ServiceUnavailableRetryStrategy {
    private final int maxRetries;
    private final long retryInterval;

    public DefaultServiceUnavailableRetryStrategy(int maxRetries, int retryInterval) {
        Args.positive(maxRetries, "Max retries");
        Args.positive(retryInterval, "Retry interval");
        this.maxRetries = maxRetries;
        this.retryInterval = retryInterval;
    }

    public DefaultServiceUnavailableRetryStrategy() {
        this(1, 1000);
    }

    @Override // cz.msebera.android.httpclient.client.ServiceUnavailableRetryStrategy
    public boolean retryRequest(HttpResponse response, int executionCount, HttpContext context) {
        return executionCount <= this.maxRetries && response.getStatusLine().getStatusCode() == 503;
    }

    @Override // cz.msebera.android.httpclient.client.ServiceUnavailableRetryStrategy
    public long getRetryInterval() {
        return this.retryInterval;
    }
}
