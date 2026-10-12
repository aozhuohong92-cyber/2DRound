package cz.msebera.android.httpclient.client.cache;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpCacheUpdateException extends Exception {
    private static final long serialVersionUID = 823573584868632876L;

    public HttpCacheUpdateException(String message) {
        super(message);
    }

    public HttpCacheUpdateException(String message, Throwable cause) {
        super(message);
        initCause(cause);
    }
}
