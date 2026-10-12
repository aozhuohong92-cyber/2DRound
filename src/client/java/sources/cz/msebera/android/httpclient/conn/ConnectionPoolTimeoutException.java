package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ConnectionPoolTimeoutException extends ConnectTimeoutException {
    private static final long serialVersionUID = -7898874842020245128L;

    public ConnectionPoolTimeoutException() {
    }

    public ConnectionPoolTimeoutException(String message) {
        super(message);
    }
}
