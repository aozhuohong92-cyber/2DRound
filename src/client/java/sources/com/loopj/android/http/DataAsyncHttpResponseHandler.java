package com.loopj.android.http;

import android.os.Message;
import android.support.v4.media.session.PlaybackStateCompat;
import java.io.IOException;
import java.io.InputStream;
import org.apache.http.HttpEntity;
import org.apache.http.util.ByteArrayBuffer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class DataAsyncHttpResponseHandler extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "DataAsyncHttpRH";
    protected static final int PROGRESS_DATA_MESSAGE = 7;

    public void onProgressData(byte[] responseBody) {
        AsyncHttpClient.log.d(LOG_TAG, "onProgressData(byte[]) was not overriden, but callback was received");
    }

    public final void sendProgressDataMessage(byte[] responseBytes) {
        sendMessage(obtainMessage(7, new Object[]{responseBytes}));
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    protected void handleMessage(Message message) {
        super.handleMessage(message);
        switch (message.what) {
            case 7:
                Object[] response = (Object[]) message.obj;
                if (response != null && response.length >= 1) {
                    try {
                        onProgressData((byte[]) response[0]);
                        break;
                    } catch (Throwable t) {
                        AsyncHttpClient.log.e(LOG_TAG, "custom onProgressData contains an error", t);
                        return;
                    }
                } else {
                    AsyncHttpClient.log.e(LOG_TAG, "PROGRESS_DATA_MESSAGE didn't got enough params");
                    break;
                }
                break;
        }
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    byte[] getResponseData(HttpEntity entity) throws IOException {
        InputStream instream;
        if (entity == null || (instream = entity.getContent()) == null) {
            return null;
        }
        long contentLength = entity.getContentLength();
        if (contentLength > 2147483647L) {
            throw new IllegalArgumentException("HTTP entity too large to be buffered in memory");
        }
        if (contentLength < 0) {
            contentLength = PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM;
        }
        try {
            ByteArrayBuffer buffer = new ByteArrayBuffer((int) contentLength);
            try {
                byte[] tmp = new byte[4096];
                while (true) {
                    int l = instream.read(tmp);
                    if (l == -1 || Thread.currentThread().isInterrupted()) {
                        break;
                    }
                    buffer.append(tmp, 0, l);
                    sendProgressDataMessage(copyOfRange(tmp, 0, l));
                    sendProgressMessage(0, contentLength);
                }
                AsyncHttpClient.silentCloseInputStream(instream);
                byte[] responseBody = buffer.toByteArray();
                return responseBody;
            } catch (Throwable th) {
                AsyncHttpClient.silentCloseInputStream(instream);
                throw th;
            }
        } catch (OutOfMemoryError e) {
            System.gc();
            throw new IOException("File too large to fit into available memory");
        }
    }

    public static byte[] copyOfRange(byte[] original, int start, int end) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NullPointerException {
        if (start > end) {
            throw new IllegalArgumentException();
        }
        int originalLength = original.length;
        if (start < 0 || start > originalLength) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int resultLength = end - start;
        int copyLength = Math.min(resultLength, originalLength - start);
        byte[] result = new byte[resultLength];
        System.arraycopy(original, start, result, 0, copyLength);
        return result;
    }
}
