package org.apache.http;

import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ConnectionClosedException extends IOException {
    private static final long serialVersionUID = 617550366255636674L;

    public ConnectionClosedException() {
        super("Connection is closed");
    }

    public ConnectionClosedException(String message) {
        super(HttpException.clean(message));
    }

    public ConnectionClosedException(String format, Object... args) {
        super(HttpException.clean(String.format(format, args)));
    }
}
