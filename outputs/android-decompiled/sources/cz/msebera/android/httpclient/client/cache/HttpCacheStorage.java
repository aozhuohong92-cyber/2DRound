package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpCacheStorage {
    HttpCacheEntry getEntry(String str) throws IOException;

    void putEntry(String str, HttpCacheEntry httpCacheEntry) throws IOException;

    void removeEntry(String str) throws IOException;

    void updateEntry(String str, HttpCacheUpdateCallback httpCacheUpdateCallback) throws IOException, HttpCacheUpdateException;
}
