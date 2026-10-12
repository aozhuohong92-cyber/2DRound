package org.apache.http.pool;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.pool.PoolEntry;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Contract(threading = ThreadingBehavior.SAFE_CONDITIONAL)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractConnPool<T, C, E extends PoolEntry<T, C>> implements ConnPool<T, E>, ConnPoolControl<T> {
    private final ConnFactory<T, C> connFactory;
    private volatile int defaultMaxPerRoute;
    private volatile boolean isShutDown;
    private volatile int maxTotal;
    private volatile int validateAfterInactivity;
    private final Lock lock = new ReentrantLock();
    private final Condition condition = this.lock.newCondition();
    private final Map<T, RouteSpecificPool<T, C, E>> routeToPool = new HashMap();
    private final Set<E> leased = new HashSet();
    private final LinkedList<E> available = new LinkedList<>();
    private final LinkedList<Future<E>> pending = new LinkedList<>();
    private final Map<T, Integer> maxPerRoute = new HashMap();

    protected abstract E createEntry(T t, C c);

    public AbstractConnPool(ConnFactory<T, C> connFactory, int defaultMaxPerRoute, int maxTotal) {
        this.connFactory = (ConnFactory) Args.notNull(connFactory, "Connection factory");
        this.defaultMaxPerRoute = Args.positive(defaultMaxPerRoute, "Max per route value");
        this.maxTotal = Args.positive(maxTotal, "Max total value");
    }

    protected void onLease(E entry) {
    }

    protected void onRelease(E entry) {
    }

    protected void onReuse(E entry) {
    }

    protected boolean validate(E entry) {
        return true;
    }

    public boolean isShutdown() {
        return this.isShutDown;
    }

    public void shutdown() throws IOException {
        if (!this.isShutDown) {
            this.isShutDown = true;
            this.lock.lock();
            try {
                Iterator i$ = this.available.iterator();
                while (i$.hasNext()) {
                    E entry = i$.next();
                    entry.close();
                }
                for (E entry2 : this.leased) {
                    entry2.close();
                }
                for (RouteSpecificPool<T, C, E> pool : this.routeToPool.values()) {
                    pool.shutdown();
                }
                this.routeToPool.clear();
                this.leased.clear();
                this.available.clear();
            } finally {
                this.lock.unlock();
            }
        }
    }

    private RouteSpecificPool<T, C, E> getPool(final T t) {
        RouteSpecificPool<T, C, E> routeSpecificPool = this.routeToPool.get(t);
        if (routeSpecificPool == null) {
            RouteSpecificPool<T, C, E> routeSpecificPool2 = (RouteSpecificPool<T, C, E>) new RouteSpecificPool<T, C, E>(t) { // from class: org.apache.http.pool.AbstractConnPool.1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // org.apache.http.pool.RouteSpecificPool
                protected E createEntry(C c) {
                    return (E) AbstractConnPool.this.createEntry(t, c);
                }
            };
            this.routeToPool.put(t, routeSpecificPool2);
            return routeSpecificPool2;
        }
        return routeSpecificPool;
    }

    @Override // org.apache.http.pool.ConnPool
    public Future<E> lease(final T t, final Object obj, final FutureCallback<E> futureCallback) {
        Args.notNull(t, "Route");
        Asserts.check(!this.isShutDown, "Connection pool shut down");
        return (Future<E>) new Future<E>() { // from class: org.apache.http.pool.AbstractConnPool.2
            private final AtomicBoolean cancelled = new AtomicBoolean(false);
            private final AtomicBoolean done = new AtomicBoolean(false);
            private final AtomicReference<E> entryRef = new AtomicReference<>(null);

            @Override // java.util.concurrent.Future
            public boolean cancel(boolean mayInterruptIfRunning) {
                if (!this.cancelled.compareAndSet(false, true)) {
                    return false;
                }
                this.done.set(true);
                AbstractConnPool.this.lock.lock();
                try {
                    AbstractConnPool.this.condition.signalAll();
                    AbstractConnPool.this.lock.unlock();
                    if (futureCallback == null) {
                        return true;
                    }
                    futureCallback.cancelled();
                    return true;
                } catch (Throwable th) {
                    AbstractConnPool.this.lock.unlock();
                    throw th;
                }
            }

            @Override // java.util.concurrent.Future
            public boolean isCancelled() {
                return this.cancelled.get();
            }

            @Override // java.util.concurrent.Future
            public boolean isDone() {
                return this.done.get();
            }

            @Override // java.util.concurrent.Future
            public E get() throws ExecutionException, InterruptedException {
                try {
                    return (E) get(0L, TimeUnit.MILLISECONDS);
                } catch (TimeoutException e) {
                    throw new ExecutionException(e);
                }
            }

            @Override // java.util.concurrent.Future
            public E get(long j, TimeUnit timeUnit) throws ExecutionException, InterruptedException, TimeoutException {
                E e;
                E e2 = this.entryRef.get();
                if (e2 == null) {
                    synchronized (this) {
                        while (true) {
                            try {
                                e = (E) AbstractConnPool.this.getPoolEntryBlocking(t, obj, j, timeUnit, this);
                                if (AbstractConnPool.this.validateAfterInactivity <= 0 || e.getUpdated() + AbstractConnPool.this.validateAfterInactivity > System.currentTimeMillis() || AbstractConnPool.this.validate(e)) {
                                    break;
                                }
                                e.close();
                                AbstractConnPool.this.release((AbstractConnPool) e, false);
                            } catch (IOException e3) {
                                this.done.set(true);
                                if (futureCallback != null) {
                                    futureCallback.failed(e3);
                                }
                                throw new ExecutionException(e3);
                            }
                        }
                        this.entryRef.set(e);
                        this.done.set(true);
                        AbstractConnPool.this.onLease(e);
                        if (futureCallback != null) {
                            futureCallback.completed(e);
                        }
                    }
                    return e;
                }
                return e2;
            }
        };
    }

    public Future<E> lease(T route, Object state) {
        return lease(route, state, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public E getPoolEntryBlocking(T t, Object obj, long j, TimeUnit timeUnit, Future<E> future) throws InterruptedException, TimeoutException, IOException {
        E e;
        boolean zAwaitUntil;
        Date date = null;
        if (j > 0) {
            date = new Date(System.currentTimeMillis() + timeUnit.toMillis(j));
        }
        this.lock.lock();
        try {
            RouteSpecificPool pool = getPool(t);
            while (true) {
                Asserts.check(!this.isShutDown, "Connection pool shut down");
                while (true) {
                    e = (E) pool.getFree(obj);
                    if (e == null) {
                        break;
                    }
                    if (e.isExpired(System.currentTimeMillis())) {
                        e.close();
                    }
                    if (!e.isClosed()) {
                        break;
                    }
                    this.available.remove(e);
                    pool.free(e, false);
                }
                if (e != null) {
                    this.available.remove(e);
                    this.leased.add(e);
                    onReuse(e);
                    return e;
                }
                int max = getMax(t);
                int iMax = Math.max(0, (pool.getAllocatedCount() + 1) - max);
                if (iMax > 0) {
                    for (int i = 0; i < iMax; i++) {
                        PoolEntry lastUsed = pool.getLastUsed();
                        if (lastUsed == null) {
                            break;
                        }
                        lastUsed.close();
                        this.available.remove(lastUsed);
                        pool.remove(lastUsed);
                    }
                }
                if (pool.getAllocatedCount() < max) {
                    int iMax2 = Math.max(this.maxTotal - this.leased.size(), 0);
                    if (iMax2 > 0) {
                        if (this.available.size() > iMax2 - 1 && !this.available.isEmpty()) {
                            E eRemoveLast = this.available.removeLast();
                            eRemoveLast.close();
                            getPool(eRemoveLast.getRoute()).remove(eRemoveLast);
                        }
                        E e2 = (E) pool.add(this.connFactory.create(t));
                        this.leased.add(e2);
                        return e2;
                    }
                }
                try {
                    if (future.isCancelled()) {
                        throw new InterruptedException("Operation interrupted");
                    }
                    pool.queue(future);
                    this.pending.add(future);
                    if (date != null) {
                        zAwaitUntil = this.condition.awaitUntil(date);
                    } else {
                        this.condition.await();
                        zAwaitUntil = true;
                    }
                    if (future.isCancelled()) {
                        throw new InterruptedException("Operation interrupted");
                    }
                    if (!zAwaitUntil && date != null && date.getTime() <= System.currentTimeMillis()) {
                        throw new TimeoutException("Timeout waiting for connection");
                    }
                } finally {
                    pool.unqueue(future);
                    this.pending.remove(future);
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.apache.http.pool.ConnPool
    public void release(E entry, boolean reusable) {
        this.lock.lock();
        try {
            if (this.leased.remove(entry)) {
                RouteSpecificPool<T, C, E> pool = getPool(entry.getRoute());
                pool.free(entry, reusable);
                if (reusable && !this.isShutDown) {
                    this.available.addFirst(entry);
                } else {
                    entry.close();
                }
                onRelease(entry);
                Future<E> future = pool.nextPending();
                if (future != null) {
                    this.pending.remove(future);
                } else {
                    future = this.pending.poll();
                }
                if (future != null) {
                    this.condition.signalAll();
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    private int getMax(T route) {
        Integer v = this.maxPerRoute.get(route);
        return v != null ? v.intValue() : this.defaultMaxPerRoute;
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setMaxTotal(int max) {
        Args.positive(max, "Max value");
        this.lock.lock();
        try {
            this.maxTotal = max;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getMaxTotal() {
        this.lock.lock();
        try {
            return this.maxTotal;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setDefaultMaxPerRoute(int max) {
        Args.positive(max, "Max per route value");
        this.lock.lock();
        try {
            this.defaultMaxPerRoute = max;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getDefaultMaxPerRoute() {
        this.lock.lock();
        try {
            return this.defaultMaxPerRoute;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public void setMaxPerRoute(T route, int max) {
        Args.notNull(route, "Route");
        this.lock.lock();
        try {
            if (max > -1) {
                this.maxPerRoute.put(route, Integer.valueOf(max));
            } else {
                this.maxPerRoute.remove(route);
            }
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public int getMaxPerRoute(T route) {
        Args.notNull(route, "Route");
        this.lock.lock();
        try {
            return getMax(route);
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public PoolStats getTotalStats() {
        this.lock.lock();
        try {
            return new PoolStats(this.leased.size(), this.pending.size(), this.available.size(), this.maxTotal);
        } finally {
            this.lock.unlock();
        }
    }

    @Override // org.apache.http.pool.ConnPoolControl
    public PoolStats getStats(T route) {
        Args.notNull(route, "Route");
        this.lock.lock();
        try {
            RouteSpecificPool<T, C, E> pool = getPool(route);
            return new PoolStats(pool.getLeasedCount(), pool.getPendingCount(), pool.getAvailableCount(), getMax(route));
        } finally {
            this.lock.unlock();
        }
    }

    public Set<T> getRoutes() {
        this.lock.lock();
        try {
            return new HashSet(this.routeToPool.keySet());
        } finally {
            this.lock.unlock();
        }
    }

    protected void enumAvailable(PoolEntryCallback<T, C> callback) {
        this.lock.lock();
        try {
            Iterator<E> it2 = this.available.iterator();
            while (it2.hasNext()) {
                E entry = it2.next();
                callback.process(entry);
                if (entry.isClosed()) {
                    RouteSpecificPool<T, C, E> pool = getPool(entry.getRoute());
                    pool.remove(entry);
                    it2.remove();
                }
            }
            purgePoolMap();
        } finally {
            this.lock.unlock();
        }
    }

    protected void enumLeased(PoolEntryCallback<T, C> callback) {
        this.lock.lock();
        try {
            for (E entry : this.leased) {
                callback.process(entry);
            }
        } finally {
            this.lock.unlock();
        }
    }

    private void purgePoolMap() {
        Iterator<Map.Entry<T, RouteSpecificPool<T, C, E>>> it2 = this.routeToPool.entrySet().iterator();
        while (it2.hasNext()) {
            Map.Entry<T, RouteSpecificPool<T, C, E>> entry = it2.next();
            RouteSpecificPool<T, C, E> pool = entry.getValue();
            if (pool.getPendingCount() + pool.getAllocatedCount() == 0) {
                it2.remove();
            }
        }
    }

    public void closeIdle(long idletime, TimeUnit timeUnit) {
        Args.notNull(timeUnit, "Time unit");
        long time = timeUnit.toMillis(idletime);
        if (time < 0) {
            time = 0;
        }
        final long deadline = System.currentTimeMillis() - time;
        enumAvailable(new PoolEntryCallback<T, C>() { // from class: org.apache.http.pool.AbstractConnPool.3
            @Override // org.apache.http.pool.PoolEntryCallback
            public void process(PoolEntry<T, C> entry) {
                if (entry.getUpdated() <= deadline) {
                    entry.close();
                }
            }
        });
    }

    public void closeExpired() {
        final long now = System.currentTimeMillis();
        enumAvailable(new PoolEntryCallback<T, C>() { // from class: org.apache.http.pool.AbstractConnPool.4
            @Override // org.apache.http.pool.PoolEntryCallback
            public void process(PoolEntry<T, C> entry) {
                if (entry.isExpired(now)) {
                    entry.close();
                }
            }
        });
    }

    public int getValidateAfterInactivity() {
        return this.validateAfterInactivity;
    }

    public void setValidateAfterInactivity(int ms) {
        this.validateAfterInactivity = ms;
    }

    public String toString() {
        this.lock.lock();
        try {
            return "[leased: " + this.leased + "][available: " + this.available + "][pending: " + this.pending + "]";
        } finally {
            this.lock.unlock();
        }
    }
}
