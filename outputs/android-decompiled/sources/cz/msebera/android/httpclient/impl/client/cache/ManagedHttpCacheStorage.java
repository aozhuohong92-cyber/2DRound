package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.cache.HttpCacheStorage;
import cz.msebera.android.httpclient.client.cache.HttpCacheUpdateCallback;
import cz.msebera.android.httpclient.client.cache.Resource;
import cz.msebera.android.httpclient.util.Args;
import java.io.Closeable;
import java.io.IOException;
import java.lang.ref.ReferenceQueue;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ManagedHttpCacheStorage implements HttpCacheStorage, Closeable {
    private final CacheMap entries;
    private final ReferenceQueue<HttpCacheEntry> morque = new ReferenceQueue<>();
    private final Set<ResourceReference> resources = new HashSet();
    private final AtomicBoolean active = new AtomicBoolean(true);

    public ManagedHttpCacheStorage(CacheConfig config) {
        this.entries = new CacheMap(config.getMaxCacheEntries());
    }

    private void ensureValidState() throws IllegalStateException {
        if (!this.active.get()) {
            throw new IllegalStateException("Cache has been shut down");
        }
    }

    private void keepResourceReference(HttpCacheEntry entry) {
        Resource resource = entry.getResource();
        if (resource != null) {
            ResourceReference ref = new ResourceReference(entry, this.morque);
            this.resources.add(ref);
        }
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public void putEntry(String url, HttpCacheEntry entry) throws IllegalStateException, IOException {
        Args.notNull(url, "URL");
        Args.notNull(entry, "Cache entry");
        ensureValidState();
        synchronized (this) {
            this.entries.put(url, entry);
            keepResourceReference(entry);
        }
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public HttpCacheEntry getEntry(String url) throws IllegalStateException, IOException {
        HttpCacheEntry httpCacheEntry;
        Args.notNull(url, "URL");
        ensureValidState();
        synchronized (this) {
            httpCacheEntry = this.entries.get(url);
        }
        return httpCacheEntry;
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public void removeEntry(String url) throws IllegalStateException, IOException {
        Args.notNull(url, "URL");
        ensureValidState();
        synchronized (this) {
            this.entries.remove(url);
        }
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheStorage
    public void updateEntry(String url, HttpCacheUpdateCallback callback) throws IllegalStateException, IOException {
        Args.notNull(url, "URL");
        Args.notNull(callback, "Callback");
        ensureValidState();
        synchronized (this) {
            HttpCacheEntry existing = this.entries.get(url);
            HttpCacheEntry updated = callback.update(existing);
            this.entries.put(url, updated);
            if (existing != updated) {
                keepResourceReference(updated);
            }
        }
    }

    public void cleanResources() {
        if (!this.active.get()) {
            return;
        }
        while (true) {
            ResourceReference ref = (ResourceReference) this.morque.poll();
            if (ref != null) {
                synchronized (this) {
                    this.resources.remove(ref);
                }
                ref.getResource().dispose();
            } else {
                return;
            }
        }
    }

    public void shutdown() {
        if (this.active.compareAndSet(true, false)) {
            synchronized (this) {
                this.entries.clear();
                for (ResourceReference ref : this.resources) {
                    ref.getResource().dispose();
                }
                this.resources.clear();
                while (this.morque.poll() != null) {
                }
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.active.compareAndSet(true, false)) {
            synchronized (this) {
                while (true) {
                    ResourceReference ref = (ResourceReference) this.morque.poll();
                    if (ref != null) {
                        this.resources.remove(ref);
                        ref.getResource().dispose();
                    }
                }
            }
        }
    }
}
