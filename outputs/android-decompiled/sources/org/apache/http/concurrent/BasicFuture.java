package org.apache.http.concurrent;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.apache.http.util.Args;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicFuture<T> implements Future<T>, Cancellable {
    private final FutureCallback<T> callback;
    private volatile boolean cancelled;
    private volatile boolean completed;
    private volatile Exception ex;
    private volatile T result;

    public BasicFuture(FutureCallback<T> callback) {
        this.callback = callback;
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        return this.cancelled;
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return this.completed;
    }

    private T getResult() throws ExecutionException {
        if (this.ex != null) {
            throw new ExecutionException(this.ex);
        }
        if (this.cancelled) {
            throw new CancellationException();
        }
        return this.result;
    }

    @Override // java.util.concurrent.Future
    public synchronized T get() throws ExecutionException, InterruptedException {
        while (!this.completed) {
            wait();
        }
        return getResult();
    }

    @Override // java.util.concurrent.Future
    public synchronized T get(long timeout, TimeUnit unit) throws ExecutionException, InterruptedException, TimeoutException {
        T result;
        Args.notNull(unit, "Time unit");
        long msecs = unit.toMillis(timeout);
        long startTime = msecs <= 0 ? 0L : System.currentTimeMillis();
        long waitTime = msecs;
        if (!this.completed) {
            if (waitTime <= 0) {
                throw new TimeoutException();
            }
            do {
                wait(waitTime);
                if (this.completed) {
                    result = getResult();
                } else {
                    waitTime = msecs - (System.currentTimeMillis() - startTime);
                }
            } while (waitTime > 0);
            throw new TimeoutException();
        }
        result = getResult();
        return result;
    }

    public boolean completed(T result) {
        boolean z = true;
        synchronized (this) {
            if (this.completed) {
                z = false;
            } else {
                this.completed = true;
                this.result = result;
                notifyAll();
                if (this.callback != null) {
                    this.callback.completed(result);
                }
            }
        }
        return z;
    }

    public boolean failed(Exception exception) {
        boolean z = true;
        synchronized (this) {
            if (this.completed) {
                z = false;
            } else {
                this.completed = true;
                this.ex = exception;
                notifyAll();
                if (this.callback != null) {
                    this.callback.failed(exception);
                }
            }
        }
        return z;
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        boolean z = true;
        synchronized (this) {
            if (this.completed) {
                z = false;
            } else {
                this.completed = true;
                this.cancelled = true;
                notifyAll();
                if (this.callback != null) {
                    this.callback.cancelled();
                }
            }
        }
        return z;
    }

    @Override // org.apache.http.concurrent.Cancellable
    public boolean cancel() {
        return cancel(true);
    }
}
