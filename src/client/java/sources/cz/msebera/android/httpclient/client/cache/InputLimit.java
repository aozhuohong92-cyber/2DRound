package cz.msebera.android.httpclient.client.cache;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class InputLimit {
    private boolean reached = false;
    private final long value;

    public InputLimit(long value) {
        this.value = value;
    }

    public long getValue() {
        return this.value;
    }

    public void reached() {
        this.reached = true;
    }

    public boolean isReached() {
        return this.reached;
    }
}
