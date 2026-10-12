package com.loopj.android.http;

import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class JsonHttpResponseHandler extends TextHttpResponseHandler {
    private static final String LOG_TAG = "JsonHttpRH";
    private boolean useRFC5179CompatibilityMode;

    public JsonHttpResponseHandler() {
        super("UTF-8");
        this.useRFC5179CompatibilityMode = true;
    }

    public JsonHttpResponseHandler(String encoding) {
        super(encoding);
        this.useRFC5179CompatibilityMode = true;
    }

    public JsonHttpResponseHandler(boolean useRFC5179CompatibilityMode) {
        super("UTF-8");
        this.useRFC5179CompatibilityMode = true;
        this.useRFC5179CompatibilityMode = useRFC5179CompatibilityMode;
    }

    public JsonHttpResponseHandler(String encoding, boolean useRFC5179CompatibilityMode) {
        super(encoding);
        this.useRFC5179CompatibilityMode = true;
        this.useRFC5179CompatibilityMode = useRFC5179CompatibilityMode;
    }

    public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
        AsyncHttpClient.log.w(LOG_TAG, "onSuccess(int, Header[], JSONObject) was not overriden, but callback was received");
    }

    public void onSuccess(int statusCode, Header[] headers, JSONArray response) {
        AsyncHttpClient.log.w(LOG_TAG, "onSuccess(int, Header[], JSONArray) was not overriden, but callback was received");
    }

    public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
        AsyncHttpClient.log.w(LOG_TAG, "onFailure(int, Header[], Throwable, JSONObject) was not overriden, but callback was received", throwable);
    }

    public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONArray errorResponse) {
        AsyncHttpClient.log.w(LOG_TAG, "onFailure(int, Header[], Throwable, JSONArray) was not overriden, but callback was received", throwable);
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
        AsyncHttpClient.log.w(LOG_TAG, "onFailure(int, Header[], String, Throwable) was not overriden, but callback was received", throwable);
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, String responseString) {
        AsyncHttpClient.log.w(LOG_TAG, "onSuccess(int, Header[], String) was not overriden, but callback was received");
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler, com.loopj.android.http.AsyncHttpResponseHandler
    public final void onSuccess(final int statusCode, final Header[] headers, final byte[] responseBytes) {
        if (statusCode != 204) {
            Runnable parser = new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        final Object jsonResponse = JsonHttpResponseHandler.this.parseResponse(responseBytes);
                        JsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (!JsonHttpResponseHandler.this.useRFC5179CompatibilityMode && jsonResponse == null) {
                                    JsonHttpResponseHandler.this.onSuccess(statusCode, headers, (String) null);
                                    return;
                                }
                                if (jsonResponse instanceof JSONObject) {
                                    JsonHttpResponseHandler.this.onSuccess(statusCode, headers, (JSONObject) jsonResponse);
                                    return;
                                }
                                if (jsonResponse instanceof JSONArray) {
                                    JsonHttpResponseHandler.this.onSuccess(statusCode, headers, (JSONArray) jsonResponse);
                                    return;
                                }
                                if (jsonResponse instanceof String) {
                                    if (JsonHttpResponseHandler.this.useRFC5179CompatibilityMode) {
                                        JsonHttpResponseHandler.this.onFailure(statusCode, headers, (String) jsonResponse, new JSONException("Response cannot be parsed as JSON data"));
                                        return;
                                    } else {
                                        JsonHttpResponseHandler.this.onSuccess(statusCode, headers, (String) jsonResponse);
                                        return;
                                    }
                                }
                                JsonHttpResponseHandler.this.onFailure(statusCode, headers, new JSONException("Unexpected response type " + jsonResponse.getClass().getName()), (JSONObject) null);
                            }
                        });
                    } catch (JSONException ex) {
                        JsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.1.2
                            @Override // java.lang.Runnable
                            public void run() {
                                JsonHttpResponseHandler.this.onFailure(statusCode, headers, ex, (JSONObject) null);
                            }
                        });
                    }
                }
            };
            if (!getUseSynchronousMode() && !getUsePoolThread()) {
                new Thread(parser).start();
                return;
            } else {
                parser.run();
                return;
            }
        }
        onSuccess(statusCode, headers, new JSONObject());
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler, com.loopj.android.http.AsyncHttpResponseHandler
    public final void onFailure(final int statusCode, final Header[] headers, final byte[] responseBytes, final Throwable throwable) {
        if (responseBytes != null) {
            Runnable parser = new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        final Object jsonResponse = JsonHttpResponseHandler.this.parseResponse(responseBytes);
                        JsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (!JsonHttpResponseHandler.this.useRFC5179CompatibilityMode && jsonResponse == null) {
                                    JsonHttpResponseHandler.this.onFailure(statusCode, headers, (String) null, throwable);
                                    return;
                                }
                                if (jsonResponse instanceof JSONObject) {
                                    JsonHttpResponseHandler.this.onFailure(statusCode, headers, throwable, (JSONObject) jsonResponse);
                                    return;
                                }
                                if (jsonResponse instanceof JSONArray) {
                                    JsonHttpResponseHandler.this.onFailure(statusCode, headers, throwable, (JSONArray) jsonResponse);
                                } else if (jsonResponse instanceof String) {
                                    JsonHttpResponseHandler.this.onFailure(statusCode, headers, (String) jsonResponse, throwable);
                                } else {
                                    JsonHttpResponseHandler.this.onFailure(statusCode, headers, new JSONException("Unexpected response type " + jsonResponse.getClass().getName()), (JSONObject) null);
                                }
                            }
                        });
                    } catch (JSONException ex) {
                        JsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.JsonHttpResponseHandler.2.2
                            @Override // java.lang.Runnable
                            public void run() {
                                JsonHttpResponseHandler.this.onFailure(statusCode, headers, ex, (JSONObject) null);
                            }
                        });
                    }
                }
            };
            if (!getUseSynchronousMode() && !getUsePoolThread()) {
                new Thread(parser).start();
                return;
            } else {
                parser.run();
                return;
            }
        }
        AsyncHttpClient.log.v(LOG_TAG, "response body is null, calling onFailure(Throwable, JSONObject)");
        onFailure(statusCode, headers, throwable, (JSONObject) null);
    }

    protected Object parseResponse(byte[] responseBody) throws JSONException {
        if (responseBody == null) {
            return null;
        }
        Object result = null;
        String jsonString = getResponseString(responseBody, getCharset());
        if (jsonString != null) {
            jsonString = jsonString.trim();
            if (this.useRFC5179CompatibilityMode) {
                if (jsonString.startsWith("{") || jsonString.startsWith("[")) {
                    result = new JSONTokener(jsonString).nextValue();
                }
            } else if ((jsonString.startsWith("{") && jsonString.endsWith("}")) || (jsonString.startsWith("[") && jsonString.endsWith("]"))) {
                result = new JSONTokener(jsonString).nextValue();
            } else if (jsonString.startsWith("\"") && jsonString.endsWith("\"")) {
                result = jsonString.substring(1, jsonString.length() - 1);
            }
        }
        if (result == null) {
            return jsonString;
        }
        return result;
    }

    public boolean isUseRFC5179CompatibilityMode() {
        return this.useRFC5179CompatibilityMode;
    }

    public void setUseRFC5179CompatibilityMode(boolean useRFC5179CompatibilityMode) {
        this.useRFC5179CompatibilityMode = useRFC5179CompatibilityMode;
    }
}
