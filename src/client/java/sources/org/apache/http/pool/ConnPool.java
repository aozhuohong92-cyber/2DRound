package org.apache.http.pool;

import java.util.concurrent.Future;
import org.apache.http.concurrent.FutureCallback;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ConnPool<T, E> {
    Future<E> lease(T t, Object obj, FutureCallback<E> futureCallback);

    void release(E e, boolean z);
}
