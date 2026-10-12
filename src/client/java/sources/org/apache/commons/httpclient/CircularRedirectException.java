package org.apache.commons.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class CircularRedirectException extends RedirectException {
    public CircularRedirectException() {
    }

    public CircularRedirectException(String message) {
        super(message);
    }

    public CircularRedirectException(String message, Throwable cause) {
        super(message, cause);
    }
}
