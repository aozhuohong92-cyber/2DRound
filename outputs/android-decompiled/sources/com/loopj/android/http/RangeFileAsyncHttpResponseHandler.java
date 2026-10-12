package com.loopj.android.http;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpUriRequest;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class RangeFileAsyncHttpResponseHandler extends FileAsyncHttpResponseHandler {
    private static final String LOG_TAG = "RangeFileAsyncHttpRH";
    private boolean append;
    private long current;

    public RangeFileAsyncHttpResponseHandler(File file) {
        super(file);
        this.current = 0L;
        this.append = false;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler, com.loopj.android.http.ResponseHandlerInterface
    public void sendResponseMessage(HttpResponse response) throws IOException {
        if (!Thread.currentThread().isInterrupted()) {
            StatusLine status = response.getStatusLine();
            if (status.getStatusCode() == 416) {
                if (!Thread.currentThread().isInterrupted()) {
                    sendSuccessMessage(status.getStatusCode(), response.getAllHeaders(), null);
                }
            } else if (status.getStatusCode() >= 300) {
                if (!Thread.currentThread().isInterrupted()) {
                    sendFailureMessage(status.getStatusCode(), response.getAllHeaders(), null, new HttpResponseException(status.getStatusCode(), status.getReasonPhrase()));
                }
            } else if (!Thread.currentThread().isInterrupted()) {
                Header header = response.getFirstHeader("Content-Range");
                if (header == null) {
                    this.append = false;
                    this.current = 0L;
                } else {
                    AsyncHttpClient.log.v(LOG_TAG, "Content-Range: " + header.getValue());
                }
                sendSuccessMessage(status.getStatusCode(), response.getAllHeaders(), getResponseData(response.getEntity()));
            }
        }
    }

    @Override // com.loopj.android.http.FileAsyncHttpResponseHandler, com.loopj.android.http.AsyncHttpResponseHandler
    protected byte[] getResponseData(HttpEntity entity) throws UnsupportedOperationException, IOException {
        int l;
        if (entity != null) {
            InputStream instream = entity.getContent();
            long contentLength = entity.getContentLength() + this.current;
            FileOutputStream buffer = new FileOutputStream(getTargetFile(), this.append);
            if (instream != null) {
                try {
                    byte[] tmp = new byte[4096];
                    while (this.current < contentLength && (l = instream.read(tmp)) != -1 && !Thread.currentThread().isInterrupted()) {
                        this.current += l;
                        buffer.write(tmp, 0, l);
                        sendProgressMessage(this.current, contentLength);
                    }
                    return null;
                } finally {
                    instream.close();
                    buffer.flush();
                    buffer.close();
                }
            }
            return null;
        }
        return null;
    }

    public void updateRequestHeaders(HttpUriRequest uriRequest) {
        if (this.file.exists() && this.file.canWrite()) {
            this.current = this.file.length();
        }
        if (this.current > 0) {
            this.append = true;
            uriRequest.setHeader("Range", "bytes=" + this.current + "-");
        }
    }
}
