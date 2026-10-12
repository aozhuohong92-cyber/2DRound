package com.loopj.android.http;

import java.io.UnsupportedEncodingException;
import org.apache.http.Header;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class TextHttpResponseHandler extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "TextHttpRH";

    public abstract void onFailure(int i, Header[] headerArr, String str, Throwable th);

    public abstract void onSuccess(int i, Header[] headerArr, String str);

    public TextHttpResponseHandler() {
        this("UTF-8");
    }

    public TextHttpResponseHandler(String encoding) {
        setCharset(encoding);
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, byte[] responseBytes) {
        onSuccess(statusCode, headers, getResponseString(responseBytes, getCharset()));
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, byte[] responseBytes, Throwable throwable) {
        onFailure(statusCode, headers, getResponseString(responseBytes, getCharset()), throwable);
    }

    public static String getResponseString(byte[] stringBytes, String charset) {
        String toReturn;
        if (stringBytes == null) {
            toReturn = null;
        } else {
            try {
                toReturn = new String(stringBytes, charset);
            } catch (UnsupportedEncodingException e) {
                AsyncHttpClient.log.e(LOG_TAG, "Encoding response into string failed", e);
                return null;
            }
        }
        if (toReturn != null && toReturn.startsWith(AsyncHttpResponseHandler.UTF8_BOM)) {
            return toReturn.substring(1);
        }
        return toReturn;
    }
}
