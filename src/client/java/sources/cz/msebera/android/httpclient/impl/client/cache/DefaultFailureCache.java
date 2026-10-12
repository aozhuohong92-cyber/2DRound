package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultFailureCache implements FailureCache {
    static final int DEFAULT_MAX_SIZE = 1000;
    static final int MAX_UPDATE_TRIES = 10;
    private final int maxSize;
    private final ConcurrentMap<String, FailureCacheValue> storage;

    public DefaultFailureCache() {
        this(1000);
    }

    public DefaultFailureCache(int maxSize) {
        this.maxSize = maxSize;
        this.storage = new ConcurrentHashMap();
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.FailureCache
    public int getErrorCount(String identifier) {
        if (identifier == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        FailureCacheValue storedErrorCode = this.storage.get(identifier);
        if (storedErrorCode != null) {
            return storedErrorCode.getErrorCount();
        }
        return 0;
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.FailureCache
    public void resetErrorCount(String identifier) {
        if (identifier == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        this.storage.remove(identifier);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.FailureCache
    public void increaseErrorCount(String identifier) {
        if (identifier == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        updateValue(identifier);
        removeOldestEntryIfMapSizeExceeded();
    }

    private void updateValue(String identifier) {
        for (int i = 0; i < 10; i++) {
            FailureCacheValue oldValue = this.storage.get(identifier);
            if (oldValue == null) {
                FailureCacheValue newValue = new FailureCacheValue(identifier, 1);
                if (this.storage.putIfAbsent(identifier, newValue) == null) {
                    return;
                }
            } else {
                int errorCount = oldValue.getErrorCount();
                if (errorCount != Integer.MAX_VALUE) {
                    FailureCacheValue newValue2 = new FailureCacheValue(identifier, errorCount + 1);
                    if (this.storage.replace(identifier, oldValue, newValue2)) {
                        return;
                    }
                } else {
                    return;
                }
            }
        }
    }

    private void removeOldestEntryIfMapSizeExceeded() {
        FailureCacheValue valueWithOldestTimestamp;
        if (this.storage.size() > this.maxSize && (valueWithOldestTimestamp = findValueWithOldestTimestamp()) != null) {
            this.storage.remove(valueWithOldestTimestamp.getKey(), valueWithOldestTimestamp);
        }
    }

    private FailureCacheValue findValueWithOldestTimestamp() {
        long oldestTimestamp = Long.MAX_VALUE;
        FailureCacheValue oldestValue = null;
        for (Map.Entry<String, FailureCacheValue> storageEntry : this.storage.entrySet()) {
            FailureCacheValue value = storageEntry.getValue();
            long creationTimeInNanos = value.getCreationTimeInNanos();
            if (creationTimeInNanos < oldestTimestamp) {
                oldestTimestamp = creationTimeInNanos;
                FailureCacheValue oldestValue2 = storageEntry.getValue();
                oldestValue = oldestValue2;
            }
        }
        return oldestValue;
    }
}
