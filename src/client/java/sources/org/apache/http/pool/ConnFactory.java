package org.apache.http.pool;

import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ConnFactory<T, C> {
    C create(T t) throws IOException;
}
