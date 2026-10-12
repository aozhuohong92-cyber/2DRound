package org.apache.http.pool;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface PoolEntryCallback<T, C> {
    void process(PoolEntry<T, C> poolEntry);
}
