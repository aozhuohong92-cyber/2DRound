package cz.msebera.android.httpclient.impl.client.cache;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface FailureCache {
    int getErrorCount(String str);

    void increaseErrorCount(String str);

    void resetErrorCount(String str);
}
