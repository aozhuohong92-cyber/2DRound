package com.tencent.bugly.proguard;

import android.support.v7.internal.widget.ActivityChooserView;
import android.util.Log;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class v {
    private static v a;
    private ScheduledExecutorService b;
    private ThreadPoolExecutor c;
    private ThreadPoolExecutor d;

    protected v() {
        this.b = null;
        this.c = null;
        this.d = null;
        ThreadFactory threadFactory = new ThreadFactory(this) { // from class: com.tencent.bugly.proguard.v.1
            @Override // java.util.concurrent.ThreadFactory
            public final Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable);
                thread.setName("BUGLY_THREAD");
                return thread;
            }
        };
        this.b = Executors.newScheduledThreadPool(3, threadFactory);
        this.c = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.SECONDS, new LinkedBlockingQueue(100), threadFactory);
        this.d = new ThreadPoolExecutor(2, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED, 10L, TimeUnit.SECONDS, new LinkedBlockingQueue(), threadFactory);
        if (this.b == null || this.b.isShutdown()) {
            w.d("ScheduledExecutorService is not valiable!", new Object[0]);
        }
        if (this.c == null || this.c.isShutdown()) {
            w.d("QueueExecutorService is not valiable!", new Object[0]);
        }
        if (this.d == null || this.d.isShutdown()) {
            w.d("ploadExecutorService is not valiable!", new Object[0]);
        }
    }

    public static synchronized v a() {
        if (a == null) {
            a = new v();
        }
        return a;
    }

    public final synchronized boolean a(Runnable runnable) {
        boolean z = false;
        synchronized (this) {
            if (!c()) {
                if (com.tencent.bugly.b.b) {
                    Log.w(w.a, "queue handler was closed , should not post task!");
                }
            } else if (runnable == null) {
                if (com.tencent.bugly.b.b) {
                    Log.w(w.a, "queue task is null");
                }
            } else {
                try {
                    this.c.submit(runnable);
                    z = true;
                } catch (Throwable th) {
                    if (com.tencent.bugly.b.b) {
                        th.printStackTrace();
                    }
                }
            }
        }
        return z;
    }

    public final synchronized boolean a(Runnable runnable, long j) {
        boolean z = false;
        synchronized (this) {
            if (!c()) {
                w.d("async handler was closed , should not post task!", new Object[0]);
            } else if (runnable == null) {
                w.d("async task == null", new Object[0]);
            } else {
                if (j <= 0) {
                    j = 0;
                }
                w.c("delay %d task %s", Long.valueOf(j), runnable.getClass().getName());
                try {
                    this.b.schedule(runnable, j, TimeUnit.MILLISECONDS);
                    z = true;
                } catch (Throwable th) {
                    if (com.tencent.bugly.b.b) {
                        th.printStackTrace();
                    }
                }
            }
        }
        return z;
    }

    public final synchronized boolean b(Runnable runnable) {
        boolean z = false;
        synchronized (this) {
            if (!c()) {
                w.d("async handler was closed , should not post task!", new Object[0]);
            } else if (runnable == null) {
                w.d("async task == null", new Object[0]);
            } else {
                w.c("normal task %s", runnable.getClass().getName());
                try {
                    this.b.execute(runnable);
                    z = true;
                } catch (Throwable th) {
                    if (com.tencent.bugly.b.b) {
                        th.printStackTrace();
                    }
                }
            }
        }
        return z;
    }

    public final synchronized boolean c(Runnable runnable) {
        boolean z = false;
        synchronized (this) {
            if (!c()) {
                if (com.tencent.bugly.b.b) {
                    Log.w(w.a, "queue handler was closed , should not post task!");
                }
            } else if (runnable == null) {
                if (com.tencent.bugly.b.b) {
                    Log.w(w.a, "queue task is null");
                }
            } else {
                try {
                    this.d.submit(runnable);
                    z = true;
                } catch (Throwable th) {
                    if (com.tencent.bugly.b.b) {
                        th.printStackTrace();
                    }
                }
            }
        }
        return z;
    }

    public final synchronized void b() {
        if (this.b != null && !this.b.isShutdown()) {
            w.c("close async handler", new Object[0]);
            this.b.shutdownNow();
        }
        if (this.c != null && !this.c.isShutdown()) {
            w.c("close async queue handler", new Object[0]);
            this.c.shutdownNow();
        }
        if (this.d != null && !this.d.isShutdown()) {
            w.c("close async upload handler", new Object[0]);
            this.d.shutdownNow();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized boolean c() {
        /*
            r1 = this;
            monitor-enter(r1)
            java.util.concurrent.ScheduledExecutorService r0 = r1.b     // Catch: java.lang.Throwable -> L2a
            if (r0 == 0) goto L28
            java.util.concurrent.ScheduledExecutorService r0 = r1.b     // Catch: java.lang.Throwable -> L2a
            boolean r0 = r0.isShutdown()     // Catch: java.lang.Throwable -> L2a
            if (r0 != 0) goto L28
            java.util.concurrent.ThreadPoolExecutor r0 = r1.c     // Catch: java.lang.Throwable -> L2a
            if (r0 == 0) goto L28
            java.util.concurrent.ThreadPoolExecutor r0 = r1.c     // Catch: java.lang.Throwable -> L2a
            boolean r0 = r0.isShutdown()     // Catch: java.lang.Throwable -> L2a
            if (r0 != 0) goto L28
            java.util.concurrent.ThreadPoolExecutor r0 = r1.d     // Catch: java.lang.Throwable -> L2a
            if (r0 == 0) goto L28
            java.util.concurrent.ThreadPoolExecutor r0 = r1.d     // Catch: java.lang.Throwable -> L2a
            boolean r0 = r0.isShutdown()     // Catch: java.lang.Throwable -> L2a
            if (r0 != 0) goto L28
            r0 = 1
        L26:
            monitor-exit(r1)
            return r0
        L28:
            r0 = 0
            goto L26
        L2a:
            r0 = move-exception
            monitor-exit(r1)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.v.c():boolean");
    }
}
