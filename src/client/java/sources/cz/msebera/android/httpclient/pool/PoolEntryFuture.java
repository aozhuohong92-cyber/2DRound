package cz.msebera.android.httpclient.pool;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.concurrent.FutureCallback;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
abstract class PoolEntryFuture<T> implements Future<T> {
    private final FutureCallback<T> callback;
    private volatile boolean cancelled;
    private volatile boolean completed;
    private final Condition condition;
    private final Lock lock;
    private T result;

    protected abstract T getPoolEntry(long j, TimeUnit timeUnit) throws InterruptedException, TimeoutException, IOException;

    PoolEntryFuture(Lock lock, FutureCallback<T> callback) {
        this.lock = lock;
        this.condition = lock.newCondition();
        this.callback = callback;
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        this.lock.lock();
        try {
            if (!this.completed) {
                this.completed = true;
                this.cancelled = true;
                if (this.callback != null) {
                    this.callback.cancelled();
                }
                this.condition.signalAll();
                return true;
            }
            return false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        return this.cancelled;
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return this.completed;
    }

    @Override // java.util.concurrent.Future
    public T get() throws ExecutionException, InterruptedException {
        try {
            return get(0L, TimeUnit.MILLISECONDS);
        } catch (TimeoutException ex) {
            throw new ExecutionException(ex);
        }
    }

    @Override // java.util.concurrent.Future
    public T get(long timeout, TimeUnit unit) throws ExecutionException, InterruptedException, TimeoutException {
        T t;
        Args.notNull(unit, "Time unit");
        this.lock.lock();
        try {
            try {
                if (this.completed) {
                    t = this.result;
                } else {
                    this.result = getPoolEntry(timeout, unit);
                    this.completed = true;
                    if (this.callback != null) {
                        this.callback.completed(this.result);
                    }
                    t = this.result;
                }
                return t;
            } catch (IOException ex) {
                this.completed = true;
                this.result = null;
                if (this.callback != null) {
                    this.callback.failed(ex);
                }
                throw new ExecutionException(ex);
            }
        } finally {
            this.lock.unlock();
        }
    }

    public boolean await(Date deadline) throws InterruptedException {
        boolean success;
        this.lock.lock();
        try {
            if (this.cancelled) {
                throw new InterruptedException("Operation interrupted");
            }
            if (deadline != null) {
                success = this.condition.awaitUntil(deadline);
            } else {
                this.condition.await();
                success = true;
            }
            if (this.cancelled) {
                throw new InterruptedException("Operation interrupted");
            }
            return success;
        } finally {
            this.lock.unlock();
        }
    }

    public void wakeup() {
        this.lock.lock();
        try {
            this.condition.signalAll();
        } finally {
            this.lock.unlock();
        }
    }
}
