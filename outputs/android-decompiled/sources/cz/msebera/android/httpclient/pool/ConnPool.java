package cz.msebera.android.httpclient.pool;

import cz.msebera.android.httpclient.concurrent.FutureCallback;
import java.util.concurrent.Future;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ConnPool<T, E> {
    Future<E> lease(T t, Object obj, FutureCallback<E> futureCallback);

    void release(E e, boolean z);
}
