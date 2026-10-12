package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.conn.HttpClientConnectionManager;
import cz.msebera.android.httpclient.util.Args;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class IdleConnectionEvictor {
    private final HttpClientConnectionManager connectionManager;
    private volatile Exception exception;
    private final long maxIdleTimeMs;
    private final long sleepTimeMs;
    private final Thread thread;
    private final ThreadFactory threadFactory;

    public IdleConnectionEvictor(final HttpClientConnectionManager connectionManager, ThreadFactory threadFactory, long sleepTime, TimeUnit sleepTimeUnit, long maxIdleTime, TimeUnit maxIdleTimeUnit) {
        this.connectionManager = (HttpClientConnectionManager) Args.notNull(connectionManager, "Connection manager");
        this.threadFactory = threadFactory == null ? new DefaultThreadFactory() : threadFactory;
        this.sleepTimeMs = sleepTimeUnit != null ? sleepTimeUnit.toMillis(sleepTime) : sleepTime;
        this.maxIdleTimeMs = maxIdleTimeUnit != null ? maxIdleTimeUnit.toMillis(maxIdleTime) : maxIdleTime;
        this.thread = this.threadFactory.newThread(new Runnable() { // from class: cz.msebera.android.httpclient.impl.client.IdleConnectionEvictor.1
            @Override // java.lang.Runnable
            public void run() throws InterruptedException {
                while (!Thread.currentThread().isInterrupted()) {
                    try {
                        Thread.sleep(IdleConnectionEvictor.this.sleepTimeMs);
                        connectionManager.closeExpiredConnections();
                        if (IdleConnectionEvictor.this.maxIdleTimeMs > 0) {
                            connectionManager.closeIdleConnections(IdleConnectionEvictor.this.maxIdleTimeMs, TimeUnit.MILLISECONDS);
                        }
                    } catch (Exception ex) {
                        IdleConnectionEvictor.this.exception = ex;
                        return;
                    }
                }
            }
        });
    }

    public IdleConnectionEvictor(HttpClientConnectionManager connectionManager, long sleepTime, TimeUnit sleepTimeUnit, long maxIdleTime, TimeUnit maxIdleTimeUnit) {
        this(connectionManager, null, sleepTime, sleepTimeUnit, maxIdleTime, maxIdleTimeUnit);
    }

    public IdleConnectionEvictor(HttpClientConnectionManager connectionManager, long maxIdleTime, TimeUnit maxIdleTimeUnit) {
        this(connectionManager, null, maxIdleTime > 0 ? maxIdleTime : 5L, maxIdleTimeUnit != null ? maxIdleTimeUnit : TimeUnit.SECONDS, maxIdleTime, maxIdleTimeUnit);
    }

    public void start() {
        this.thread.start();
    }

    public void shutdown() {
        this.thread.interrupt();
    }

    public boolean isRunning() {
        return this.thread.isAlive();
    }

    public void awaitTermination(long time, TimeUnit tunit) throws InterruptedException {
        Thread thread = this.thread;
        if (tunit == null) {
            tunit = TimeUnit.MILLISECONDS;
        }
        thread.join(tunit.toMillis(time));
    }

    static class DefaultThreadFactory implements ThreadFactory {
        DefaultThreadFactory() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            Thread t = new Thread(r, "Connection evictor");
            t.setDaemon(true);
            return t;
        }
    }
}
