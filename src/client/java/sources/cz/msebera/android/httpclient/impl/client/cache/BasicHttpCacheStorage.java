package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.cache.HttpCacheStorage;
import cz.msebera.android.httpclient.client.cache.HttpCacheUpdateCallback;
import java.io.IOException;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHttpCacheStorage implements HttpCacheStorage {
    private final CacheMap entries;

    public BasicHttpCacheStorage(CacheConfig config) {
        this.entries = new CacheMap(config.getMaxCacheEntries());
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public synchronized void putEntry(String url, HttpCacheEntry entry) throws IOException {
        this.entries.put(url, entry);
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public synchronized HttpCacheEntry getEntry(String url) throws IOException {
        return this.entries.get(url);
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public synchronized void removeEntry(String url) throws IOException {
        this.entries.remove(url);
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public synchronized void updateEntry(String url, HttpCacheUpdateCallback callback) throws IOException {
        HttpCacheEntry existingEntry = this.entries.get(url);
        this.entries.put(url, callback.update(existingEntry));
    }
}
