package com.loopj.android.http;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.URI;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpResponseException;
import org.apache.http.util.ByteArrayBuffer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AsyncHttpResponseHandler implements ResponseHandlerInterface {
    protected static final int BUFFER_SIZE = 4096;
    protected static final int CANCEL_MESSAGE = 6;
    public static final String DEFAULT_CHARSET = "UTF-8";
    protected static final int FAILURE_MESSAGE = 1;
    protected static final int FINISH_MESSAGE = 3;
    private static final String LOG_TAG = "AsyncHttpRH";
    protected static final int PROGRESS_MESSAGE = 4;
    protected static final int RETRY_MESSAGE = 5;
    protected static final int START_MESSAGE = 2;
    protected static final int SUCCESS_MESSAGE = 0;
    public static final String UTF8_BOM = "\ufeff";
    private WeakReference<Object> TAG;
    private Handler handler;
    private Looper looper;
    private Header[] requestHeaders;
    private URI requestURI;
    private String responseCharset;
    private boolean usePoolThread;
    private boolean useSynchronousMode;

    public abstract void onFailure(int i, Header[] headerArr, byte[] bArr, Throwable th);

    public abstract void onSuccess(int i, Header[] headerArr, byte[] bArr);

    public AsyncHttpResponseHandler() {
        this((Looper) null);
    }

    public AsyncHttpResponseHandler(Looper looper) {
        this.responseCharset = "UTF-8";
        this.requestURI = null;
        this.requestHeaders = null;
        this.looper = null;
        this.TAG = new WeakReference<>(null);
        this.looper = looper == null ? Looper.myLooper() : looper;
        setUseSynchronousMode(false);
        setUsePoolThread(false);
    }

    public AsyncHttpResponseHandler(boolean usePoolThread) {
        this.responseCharset = "UTF-8";
        this.requestURI = null;
        this.requestHeaders = null;
        this.looper = null;
        this.TAG = new WeakReference<>(null);
        setUsePoolThread(usePoolThread);
        if (!getUsePoolThread()) {
            this.looper = Looper.myLooper();
            setUseSynchronousMode(false);
        }
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void setTag(Object TAG) {
        this.TAG = new WeakReference<>(TAG);
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public Object getTag() {
        return this.TAG.get();
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public URI getRequestURI() {
        return this.requestURI;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public Header[] getRequestHeaders() {
        return this.requestHeaders;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void setRequestURI(URI requestURI) {
        this.requestURI = requestURI;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void setRequestHeaders(Header[] requestHeaders) {
        this.requestHeaders = requestHeaders;
    }

    private static class ResponderHandler extends Handler {
        private final AsyncHttpResponseHandler mResponder;

        ResponderHandler(AsyncHttpResponseHandler mResponder, Looper looper) {
            super(looper);
            this.mResponder = mResponder;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            this.mResponder.handleMessage(msg);
        }
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public boolean getUseSynchronousMode() {
        return this.useSynchronousMode;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void setUseSynchronousMode(boolean sync) {
        if (!sync && this.looper == null) {
            sync = true;
            AsyncHttpClient.log.w(LOG_TAG, "Current thread has not called Looper.prepare(). Forcing synchronous mode.");
        }
        if (!sync && this.handler == null) {
            this.handler = new ResponderHandler(this, this.looper);
        } else if (sync && this.handler != null) {
            this.handler = null;
        }
        this.useSynchronousMode = sync;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public boolean getUsePoolThread() {
        return this.usePoolThread;
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void setUsePoolThread(boolean pool) {
        if (pool) {
            this.looper = null;
            this.handler = null;
        }
        this.usePoolThread = pool;
    }

    public void setCharset(String charset) {
        this.responseCharset = charset;
    }

    public String getCharset() {
        return this.responseCharset == null ? "UTF-8" : this.responseCharset;
    }

    public void onProgress(long bytesWritten, long totalSize) {
        LogInterface logInterface = AsyncHttpClient.log;
        Object[] objArr = new Object[3];
        objArr[0] = Long.valueOf(bytesWritten);
        objArr[1] = Long.valueOf(totalSize);
        objArr[2] = Double.valueOf(totalSize > 0 ? ((bytesWritten * 1.0d) / totalSize) * 100.0d : -1.0d);
        logInterface.v(LOG_TAG, String.format("Progress %d from %d (%2.0f%%)", objArr));
    }

    public void onStart() {
    }

    public void onFinish() {
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void onPreProcessResponse(ResponseHandlerInterface instance, HttpResponse response) {
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void onPostProcessResponse(ResponseHandlerInterface instance, HttpResponse response) {
    }

    public void onRetry(int retryNo) {
        AsyncHttpClient.log.d(LOG_TAG, String.format("Request retry no. %d", Integer.valueOf(retryNo)));
    }

    public void onCancel() {
        AsyncHttpClient.log.d(LOG_TAG, "Request got cancelled");
    }

    public void onUserException(Throwable error) {
        AsyncHttpClient.log.e(LOG_TAG, "User-space exception detected!", error);
        throw new RuntimeException(error);
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendProgressMessage(long bytesWritten, long bytesTotal) {
        sendMessage(obtainMessage(4, new Object[]{Long.valueOf(bytesWritten), Long.valueOf(bytesTotal)}));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendSuccessMessage(int statusCode, Header[] headers, byte[] responseBytes) {
        sendMessage(obtainMessage(0, new Object[]{Integer.valueOf(statusCode), headers, responseBytes}));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendFailureMessage(int statusCode, Header[] headers, byte[] responseBody, Throwable throwable) {
        sendMessage(obtainMessage(1, new Object[]{Integer.valueOf(statusCode), headers, responseBody, throwable}));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendStartMessage() {
        sendMessage(obtainMessage(2, null));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendFinishMessage() {
        sendMessage(obtainMessage(3, null));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendRetryMessage(int retryNo) {
        sendMessage(obtainMessage(5, new Object[]{Integer.valueOf(retryNo)}));
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public final void sendCancelMessage() {
        sendMessage(obtainMessage(6, null));
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    protected void handleMessage(Message message) {
        try {
            switch (message.what) {
                case 0:
                    Object[] response = (Object[]) message.obj;
                    if (response != null && response.length >= 3) {
                        onSuccess(((Integer) response[0]).intValue(), (Header[]) response[1], (byte[]) response[2]);
                    } else {
                        AsyncHttpClient.log.e(LOG_TAG, "SUCCESS_MESSAGE didn't got enough params");
                    }
                    return;
                case 1:
                    Object[] response2 = (Object[]) message.obj;
                    if (response2 != null && response2.length >= 4) {
                        onFailure(((Integer) response2[0]).intValue(), (Header[]) response2[1], (byte[]) response2[2], (Throwable) response2[3]);
                    } else {
                        AsyncHttpClient.log.e(LOG_TAG, "FAILURE_MESSAGE didn't got enough params");
                    }
                    return;
                case 2:
                    onStart();
                    return;
                case 3:
                    onFinish();
                    return;
                case 4:
                    Object[] response3 = (Object[]) message.obj;
                    if (response3 != null && response3.length >= 2) {
                        try {
                            onProgress(((Long) response3[0]).longValue(), ((Long) response3[1]).longValue());
                        } catch (Throwable t) {
                            AsyncHttpClient.log.e(LOG_TAG, "custom onProgress contains an error", t);
                        }
                    } else {
                        AsyncHttpClient.log.e(LOG_TAG, "PROGRESS_MESSAGE didn't got enough params");
                    }
                    return;
                case 5:
                    Object[] response4 = (Object[]) message.obj;
                    if (response4 != null && response4.length == 1) {
                        onRetry(((Integer) response4[0]).intValue());
                    } else {
                        AsyncHttpClient.log.e(LOG_TAG, "RETRY_MESSAGE didn't get enough params");
                    }
                    return;
                case 6:
                    onCancel();
                    return;
                default:
                    return;
            }
        } catch (Throwable error) {
            onUserException(error);
        }
        onUserException(error);
    }

    protected void sendMessage(Message msg) {
        if (getUseSynchronousMode() || this.handler == null) {
            handleMessage(msg);
        } else if (!Thread.currentThread().isInterrupted()) {
            Utils.asserts(this.handler != null, "handler should not be null!");
            this.handler.sendMessage(msg);
        }
    }

    protected void postRunnable(Runnable runnable) {
        if (runnable != null) {
            if (getUseSynchronousMode() || this.handler == null) {
                runnable.run();
            } else {
                this.handler.post(runnable);
            }
        }
    }

    protected Message obtainMessage(int responseMessageId, Object responseMessageData) {
        return Message.obtain(this.handler, responseMessageId, responseMessageData);
    }

    @Override // com.loopj.android.http.ResponseHandlerInterface
    public void sendResponseMessage(HttpResponse response) throws IOException {
        if (!Thread.currentThread().isInterrupted()) {
            StatusLine status = response.getStatusLine();
            byte[] responseBody = getResponseData(response.getEntity());
            if (!Thread.currentThread().isInterrupted()) {
                if (status.getStatusCode() >= 300) {
                    sendFailureMessage(status.getStatusCode(), response.getAllHeaders(), responseBody, new HttpResponseException(status.getStatusCode(), status.getReasonPhrase()));
                } else {
                    sendSuccessMessage(status.getStatusCode(), response.getAllHeaders(), responseBody);
                }
            }
        }
    }

    byte[] getResponseData(HttpEntity entity) throws IOException {
        InputStream instream;
        if (entity == null || (instream = entity.getContent()) == null) {
            return null;
        }
        long contentLength = entity.getContentLength();
        if (contentLength > 2147483647L) {
            throw new IllegalArgumentException("HTTP entity too large to be buffered in memory");
        }
        int buffersize = contentLength <= 0 ? 4096 : (int) contentLength;
        try {
            ByteArrayBuffer buffer = new ByteArrayBuffer(buffersize);
            try {
                byte[] tmp = new byte[4096];
                long count = 0;
                while (true) {
                    int l = instream.read(tmp);
                    if (l == -1 || Thread.currentThread().isInterrupted()) {
                        break;
                    }
                    count += l;
                    buffer.append(tmp, 0, l);
                    sendProgressMessage(count, contentLength <= 0 ? 1L : contentLength);
                }
                AsyncHttpClient.silentCloseInputStream(instream);
                AsyncHttpClient.endEntityViaReflection(entity);
                byte[] responseBody = buffer.toByteArray();
                return responseBody;
            } catch (Throwable th) {
                AsyncHttpClient.silentCloseInputStream(instream);
                AsyncHttpClient.endEntityViaReflection(entity);
                throw th;
            }
        } catch (OutOfMemoryError e) {
            System.gc();
            throw new IOException("File too large to fit into available memory");
        }
    }
}
