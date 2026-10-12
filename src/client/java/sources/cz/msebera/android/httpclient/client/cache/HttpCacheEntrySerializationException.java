package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpCacheEntrySerializationException extends IOException {
    private static final long serialVersionUID = 9219188365878433519L;

    public HttpCacheEntrySerializationException(String message) {
    }

    public HttpCacheEntrySerializationException(String message, Throwable cause) {
        super(message);
        initCause(cause);
    }
}
