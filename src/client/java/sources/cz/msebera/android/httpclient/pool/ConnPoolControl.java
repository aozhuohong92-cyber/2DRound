package cz.msebera.android.httpclient.pool;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ConnPoolControl<T> {
    int getDefaultMaxPerRoute();

    int getMaxPerRoute(T t);

    int getMaxTotal();

    PoolStats getStats(T t);

    PoolStats getTotalStats();

    void setDefaultMaxPerRoute(int i);

    void setMaxPerRoute(T t, int i);

    void setMaxTotal(int i);
}
