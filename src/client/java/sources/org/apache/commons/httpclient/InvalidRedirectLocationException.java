package org.apache.commons.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class InvalidRedirectLocationException extends RedirectException {
    private final String location;

    public InvalidRedirectLocationException(String message, String location) {
        super(message);
        this.location = location;
    }

    public InvalidRedirectLocationException(String message, String location, Throwable cause) {
        super(message, cause);
        this.location = location;
    }

    public String getLocation() {
        return this.location;
    }
}
