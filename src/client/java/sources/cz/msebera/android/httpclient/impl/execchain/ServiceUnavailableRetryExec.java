package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.ServiceUnavailableRetryStrategy;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.client.methods.HttpExecutionAware;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InterruptedIOException;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ServiceUnavailableRetryExec implements ClientExecChain {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final ClientExecChain requestExecutor;
    private final ServiceUnavailableRetryStrategy retryStrategy;

    public ServiceUnavailableRetryExec(ClientExecChain requestExecutor, ServiceUnavailableRetryStrategy retryStrategy) {
        Args.notNull(requestExecutor, "HTTP request executor");
        Args.notNull(retryStrategy, "Retry strategy");
        this.requestExecutor = requestExecutor;
        this.retryStrategy = retryStrategy;
    }

    @Override // cz.msebera.android.httpclient.impl.execchain.ClientExecChain
    public CloseableHttpResponse execute(HttpRoute route, HttpRequestWrapper request, HttpClientContext context, HttpExecutionAware execAware) throws InterruptedException, IOException, HttpException {
        Header[] origheaders = request.getAllHeaders();
        int c = 1;
        while (true) {
            CloseableHttpResponse response = this.requestExecutor.execute(route, request, context, execAware);
            try {
                if (this.retryStrategy.retryRequest(response, c, context)) {
                    response.close();
                    long nextInterval = this.retryStrategy.getRetryInterval();
                    if (nextInterval > 0) {
                        try {
                            this.log.trace("Wait for " + nextInterval);
                            Thread.sleep(nextInterval);
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                            throw new InterruptedIOException();
                        }
                    }
                    request.setHeaders(origheaders);
                    c++;
                } else {
                    return response;
                }
            } catch (RuntimeException ex) {
                response.close();
                throw ex;
            }
        }
    }
}
