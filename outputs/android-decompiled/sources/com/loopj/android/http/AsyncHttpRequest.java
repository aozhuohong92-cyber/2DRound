package com.loopj.android.http;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.concurrent.atomic.AtomicBoolean;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.protocol.HttpContext;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class AsyncHttpRequest implements Runnable {
    private boolean cancelIsNotified;
    private final AbstractHttpClient client;
    private final HttpContext context;
    private int executionCount;
    private final AtomicBoolean isCancelled = new AtomicBoolean();
    private volatile boolean isFinished;
    private boolean isRequestPreProcessed;
    private final HttpUriRequest request;
    private final ResponseHandlerInterface responseHandler;

    public AsyncHttpRequest(AbstractHttpClient client, HttpContext context, HttpUriRequest request, ResponseHandlerInterface responseHandler) {
        this.client = (AbstractHttpClient) Utils.notNull(client, "client");
        this.context = (HttpContext) Utils.notNull(context, "context");
        this.request = (HttpUriRequest) Utils.notNull(request, "request");
        this.responseHandler = (ResponseHandlerInterface) Utils.notNull(responseHandler, "responseHandler");
    }

    public void onPreProcessRequest(AsyncHttpRequest request) {
    }

    public void onPostProcessRequest(AsyncHttpRequest request) {
    }

    @Override // java.lang.Runnable
    public void run() {
        if (!isCancelled()) {
            if (!this.isRequestPreProcessed) {
                this.isRequestPreProcessed = true;
                onPreProcessRequest(this);
            }
            if (!isCancelled()) {
                this.responseHandler.sendStartMessage();
                if (!isCancelled()) {
                    try {
                        makeRequestWithRetries();
                    } catch (IOException e) {
                        if (!isCancelled()) {
                            this.responseHandler.sendFailureMessage(0, null, null, e);
                        } else {
                            AsyncHttpClient.log.e("AsyncHttpRequest", "makeRequestWithRetries returned error", e);
                        }
                    }
                    if (!isCancelled()) {
                        this.responseHandler.sendFinishMessage();
                        if (!isCancelled()) {
                            onPostProcessRequest(this);
                            this.isFinished = true;
                        }
                    }
                }
            }
        }
    }

    private void makeRequest() throws IOException {
        if (!isCancelled()) {
            if (this.request.getURI().getScheme() == null) {
                throw new MalformedURLException("No valid URI scheme was provided");
            }
            if (this.responseHandler instanceof RangeFileAsyncHttpResponseHandler) {
                ((RangeFileAsyncHttpResponseHandler) this.responseHandler).updateRequestHeaders(this.request);
            }
            HttpResponse response = this.client.execute(this.request, this.context);
            if (!isCancelled()) {
                this.responseHandler.onPreProcessResponse(this.responseHandler, response);
                if (!isCancelled()) {
                    this.responseHandler.sendResponseMessage(response);
                    if (!isCancelled()) {
                        this.responseHandler.onPostProcessResponse(this.responseHandler, response);
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00b7 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0041 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void makeRequestWithRetries() throws java.io.IOException {
        /*
            r8 = this;
            r3 = 1
            r0 = 0
            org.apache.http.impl.client.AbstractHttpClient r5 = r8.client
            org.apache.http.client.HttpRequestRetryHandler r4 = r5.getHttpRequestRetryHandler()
            r1 = r0
        L9:
            if (r3 == 0) goto L8b
            r8.makeRequest()     // Catch: java.net.UnknownHostException -> Lf java.lang.NullPointerException -> L4c java.io.IOException -> L76 java.lang.Exception -> L8d
        Le:
            return
        Lf:
            r2 = move-exception
            java.io.IOException r0 = new java.io.IOException     // Catch: java.lang.Exception -> L8d
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L8d
            r5.<init>()     // Catch: java.lang.Exception -> L8d
            java.lang.String r6 = "UnknownHostException exception: "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Exception -> L8d
            java.lang.String r6 = r2.getMessage()     // Catch: java.lang.Exception -> L8d
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Exception -> L8d
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Exception -> L8d
            r0.<init>(r5)     // Catch: java.lang.Exception -> L8d
            int r5 = r8.executionCount     // Catch: java.lang.Exception -> Lb5
            if (r5 <= 0) goto L4a
            int r5 = r8.executionCount     // Catch: java.lang.Exception -> Lb5
            int r5 = r5 + 1
            r8.executionCount = r5     // Catch: java.lang.Exception -> Lb5
            org.apache.http.protocol.HttpContext r6 = r8.context     // Catch: java.lang.Exception -> Lb5
            boolean r5 = r4.retryRequest(r2, r5, r6)     // Catch: java.lang.Exception -> Lb5
            if (r5 == 0) goto L4a
            r3 = 1
        L3f:
            if (r3 == 0) goto Lb7
            com.loopj.android.http.ResponseHandlerInterface r5 = r8.responseHandler     // Catch: java.lang.Exception -> Lb5
            int r6 = r8.executionCount     // Catch: java.lang.Exception -> Lb5
            r5.sendRetryMessage(r6)     // Catch: java.lang.Exception -> Lb5
            r1 = r0
            goto L9
        L4a:
            r3 = 0
            goto L3f
        L4c:
            r2 = move-exception
            java.io.IOException r0 = new java.io.IOException     // Catch: java.lang.Exception -> L8d
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L8d
            r5.<init>()     // Catch: java.lang.Exception -> L8d
            java.lang.String r6 = "NPE in HttpClient: "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Exception -> L8d
            java.lang.String r6 = r2.getMessage()     // Catch: java.lang.Exception -> L8d
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Exception -> L8d
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Exception -> L8d
            r0.<init>(r5)     // Catch: java.lang.Exception -> L8d
            int r5 = r8.executionCount     // Catch: java.lang.Exception -> Lb5
            int r5 = r5 + 1
            r8.executionCount = r5     // Catch: java.lang.Exception -> Lb5
            org.apache.http.protocol.HttpContext r6 = r8.context     // Catch: java.lang.Exception -> Lb5
            boolean r3 = r4.retryRequest(r0, r5, r6)     // Catch: java.lang.Exception -> Lb5
            goto L3f
        L76:
            r2 = move-exception
            boolean r5 = r8.isCancelled()     // Catch: java.lang.Exception -> L8d
            if (r5 != 0) goto Le
            r0 = r2
            int r5 = r8.executionCount     // Catch: java.lang.Exception -> Lb5
            int r5 = r5 + 1
            r8.executionCount = r5     // Catch: java.lang.Exception -> Lb5
            org.apache.http.protocol.HttpContext r6 = r8.context     // Catch: java.lang.Exception -> Lb5
            boolean r3 = r4.retryRequest(r0, r5, r6)     // Catch: java.lang.Exception -> Lb5
            goto L3f
        L8b:
            r0 = r1
        L8c:
            throw r0
        L8d:
            r2 = move-exception
            r0 = r1
        L8f:
            com.loopj.android.http.LogInterface r5 = com.loopj.android.http.AsyncHttpClient.log
            java.lang.String r6 = "AsyncHttpRequest"
            java.lang.String r7 = "Unhandled exception origin cause"
            r5.e(r6, r7, r2)
            java.io.IOException r0 = new java.io.IOException
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            r5.<init>()
            java.lang.String r6 = "Unhandled exception: "
            java.lang.StringBuilder r5 = r5.append(r6)
            java.lang.String r6 = r2.getMessage()
            java.lang.StringBuilder r5 = r5.append(r6)
            java.lang.String r5 = r5.toString()
            r0.<init>(r5)
            goto L8c
        Lb5:
            r2 = move-exception
            goto L8f
        Lb7:
            r1 = r0
            goto L9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.loopj.android.http.AsyncHttpRequest.makeRequestWithRetries():void");
    }

    public boolean isCancelled() {
        boolean cancelled = this.isCancelled.get();
        if (cancelled) {
            sendCancelNotification();
        }
        return cancelled;
    }

    private synchronized void sendCancelNotification() {
        if (!this.isFinished && this.isCancelled.get() && !this.cancelIsNotified) {
            this.cancelIsNotified = true;
            this.responseHandler.sendCancelMessage();
        }
    }

    public boolean isDone() {
        return isCancelled() || this.isFinished;
    }

    public boolean cancel(boolean mayInterruptIfRunning) throws UnsupportedOperationException {
        this.isCancelled.set(true);
        this.request.abort();
        return isCancelled();
    }

    public AsyncHttpRequest setRequestTag(Object TAG) {
        this.responseHandler.setTag(TAG);
        return this;
    }

    public Object getTag() {
        return this.responseHandler.getTag();
    }
}
