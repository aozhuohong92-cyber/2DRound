package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ClientConnectionOperator;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ConnectionPoolTimeoutException;
import cz.msebera.android.httpclient.conn.DnsResolver;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.pool.ConnPoolControl;
import cz.msebera.android.httpclient.pool.PoolStats;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@ThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class PoolingClientConnectionManager implements ClientConnectionManager, ConnPoolControl<HttpRoute> {
    private final DnsResolver dnsResolver;
    public HttpClientAndroidLog log;
    private final ClientConnectionOperator operator;
    private final HttpConnPool pool;
    private final SchemeRegistry schemeRegistry;

    public PoolingClientConnectionManager(SchemeRegistry schreg) {
        this(schreg, -1L, TimeUnit.MILLISECONDS);
    }

    public PoolingClientConnectionManager(SchemeRegistry schreg, DnsResolver dnsResolver) {
        this(schreg, -1L, TimeUnit.MILLISECONDS, dnsResolver);
    }

    public PoolingClientConnectionManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry, long timeToLive, TimeUnit tunit) {
        this(schemeRegistry, timeToLive, tunit, new SystemDefaultDnsResolver());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry, long timeToLive, TimeUnit tunit, DnsResolver dnsResolver) {
        this.log = new HttpClientAndroidLog(getClass());
        Args.notNull(schemeRegistry, "Scheme registry");
        Args.notNull(dnsResolver, "DNS resolver");
        this.schemeRegistry = schemeRegistry;
        this.dnsResolver = dnsResolver;
        this.operator = createConnectionOperator(schemeRegistry);
        this.pool = new HttpConnPool(this.log, this.operator, 2, 20, timeToLive, tunit);
    }

    protected void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
        return new DefaultClientConnectionOperator(schreg, this.dnsResolver);
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    private String format(HttpRoute route, Object state) {
        StringBuilder buf = new StringBuilder();
        buf.append("[route: ").append(route).append("]");
        if (state != null) {
            buf.append("[state: ").append(state).append("]");
        }
        return buf.toString();
    }

    private String formatStats(HttpRoute route) {
        StringBuilder buf = new StringBuilder();
        PoolStats totals = this.pool.getTotalStats();
        PoolStats stats = this.pool.getStats(route);
        buf.append("[total kept alive: ").append(totals.getAvailable()).append("; ");
        buf.append("route allocated: ").append(stats.getLeased() + stats.getAvailable());
        buf.append(" of ").append(stats.getMax()).append("; ");
        buf.append("total allocated: ").append(totals.getLeased() + totals.getAvailable());
        buf.append(" of ").append(totals.getMax()).append("]");
        return buf.toString();
    }

    private String format(HttpPoolEntry entry) {
        StringBuilder buf = new StringBuilder();
        buf.append("[id: ").append(entry.getId()).append("]");
        buf.append("[route: ").append(entry.getRoute()).append("]");
        Object state = entry.getState();
        if (state != null) {
            buf.append("[state: ").append(state).append("]");
        }
        return buf.toString();
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public ClientConnectionRequest requestConnection(HttpRoute route, Object state) {
        Args.notNull(route, "HTTP route");
        if (this.log.isDebugEnabled()) {
            this.log.debug("Connection request: " + format(route, state) + formatStats(route));
        }
        final Future<HttpPoolEntry> future = this.pool.lease(route, state);
        return new ClientConnectionRequest() { // from class: cz.msebera.android.httpclient.impl.conn.PoolingClientConnectionManager.1
            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public void abortRequest() {
                future.cancel(true);
            }

            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public ManagedClientConnection getConnection(long timeout, TimeUnit tunit) throws InterruptedException, ConnectionPoolTimeoutException {
                return PoolingClientConnectionManager.this.leaseConnection(future, timeout, tunit);
            }
        };
    }

    ManagedClientConnection leaseConnection(Future<HttpPoolEntry> future, long timeout, TimeUnit tunit) throws ExecutionException, InterruptedException, ConnectionPoolTimeoutException, TimeoutException {
        try {
            HttpPoolEntry entry = future.get(timeout, tunit);
            if (entry == null || future.isCancelled()) {
                throw new InterruptedException();
            }
            Asserts.check(entry.getConnection() != null, "Pool entry with no connection");
            if (this.log.isDebugEnabled()) {
                this.log.debug("Connection leased: " + format(entry) + formatStats(entry.getRoute()));
            }
            return new ManagedClientConnectionImpl(this, this.operator, entry);
        } catch (ExecutionException ex) {
            Throwable cause = ex.getCause();
            if (cause == null) {
                cause = ex;
            }
            this.log.error("Unexpected exception leasing connection from pool", cause);
            throw new InterruptedException();
        } catch (TimeoutException e) {
            throw new ConnectionPoolTimeoutException("Timeout waiting for connection from pool");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009e A[Catch: all -> 0x00cb, TryCatch #1 {, blocks: (B:7:0x0017, B:9:0x001d, B:27:0x008d, B:29:0x009e, B:30:0x00c8, B:41:0x00e1, B:42:0x00ea, B:12:0x0021, B:14:0x0027, B:16:0x002d, B:36:0x00cf, B:38:0x00d7, B:17:0x0030, B:21:0x0039, B:25:0x004a, B:26:0x0067, B:43:0x00eb), top: B:48:0x0017, inners: #0 }] */
    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void releaseConnection(cz.msebera.android.httpclient.conn.ManagedClientConnection r9, long r10, java.util.concurrent.TimeUnit r12) {
        /*
            r8 = this;
            boolean r4 = r9 instanceof cz.msebera.android.httpclient.impl.conn.ManagedClientConnectionImpl
            java.lang.String r5 = "Connection class mismatch, connection not obtained from this manager"
            cz.msebera.android.httpclient.util.Args.check(r4, r5)
            r2 = r9
            cz.msebera.android.httpclient.impl.conn.ManagedClientConnectionImpl r2 = (cz.msebera.android.httpclient.impl.conn.ManagedClientConnectionImpl) r2
            cz.msebera.android.httpclient.conn.ClientConnectionManager r4 = r2.getManager()
            if (r4 != r8) goto L1f
            r4 = 1
        L11:
            java.lang.String r5 = "Connection not obtained from this manager"
            cz.msebera.android.httpclient.util.Asserts.check(r4, r5)
            monitor-enter(r2)
            cz.msebera.android.httpclient.impl.conn.HttpPoolEntry r0 = r2.detach()     // Catch: java.lang.Throwable -> Lcb
            if (r0 != 0) goto L21
            monitor-exit(r2)     // Catch: java.lang.Throwable -> Lcb
        L1e:
            return
        L1f:
            r4 = 0
            goto L11
        L21:
            boolean r4 = r2.isOpen()     // Catch: java.lang.Throwable -> Le0
            if (r4 == 0) goto L30
            boolean r4 = r2.isMarkedReusable()     // Catch: java.lang.Throwable -> Le0
            if (r4 != 0) goto L30
            r2.shutdown()     // Catch: java.io.IOException -> Lce java.lang.Throwable -> Le0
        L30:
            boolean r4 = r2.isMarkedReusable()     // Catch: java.lang.Throwable -> Le0
            if (r4 == 0) goto L8d
            if (r12 == 0) goto Leb
            r4 = r12
        L39:
            r0.updateExpiry(r10, r4)     // Catch: java.lang.Throwable -> Le0
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r8.log     // Catch: java.lang.Throwable -> Le0
            boolean r4 = r4.isDebugEnabled()     // Catch: java.lang.Throwable -> Le0
            if (r4 == 0) goto L8d
            r4 = 0
            int r4 = (r10 > r4 ? 1 : (r10 == r4 ? 0 : -1))
            if (r4 <= 0) goto Lef
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Le0
            r4.<init>()     // Catch: java.lang.Throwable -> Le0
            java.lang.String r5 = "for "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> Le0
            java.lang.StringBuilder r4 = r4.append(r10)     // Catch: java.lang.Throwable -> Le0
            java.lang.String r5 = " "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> Le0
            java.lang.StringBuilder r4 = r4.append(r12)     // Catch: java.lang.Throwable -> Le0
            java.lang.String r3 = r4.toString()     // Catch: java.lang.Throwable -> Le0
        L67:
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r8.log     // Catch: java.lang.Throwable -> Le0
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Le0
            r5.<init>()     // Catch: java.lang.Throwable -> Le0
            java.lang.String r6 = "Connection "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> Le0
            java.lang.String r6 = r8.format(r0)     // Catch: java.lang.Throwable -> Le0
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> Le0
            java.lang.String r6 = " can be kept alive "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> Le0
            java.lang.StringBuilder r5 = r5.append(r3)     // Catch: java.lang.Throwable -> Le0
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> Le0
            r4.debug(r5)     // Catch: java.lang.Throwable -> Le0
        L8d:
            cz.msebera.android.httpclient.impl.conn.HttpConnPool r4 = r8.pool     // Catch: java.lang.Throwable -> Lcb
            boolean r5 = r2.isMarkedReusable()     // Catch: java.lang.Throwable -> Lcb
            r4.release(r0, r5)     // Catch: java.lang.Throwable -> Lcb
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r8.log     // Catch: java.lang.Throwable -> Lcb
            boolean r4 = r4.isDebugEnabled()     // Catch: java.lang.Throwable -> Lcb
            if (r4 == 0) goto Lc8
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r5 = r8.log     // Catch: java.lang.Throwable -> Lcb
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lcb
            r4.<init>()     // Catch: java.lang.Throwable -> Lcb
            java.lang.String r6 = "Connection released: "
            java.lang.StringBuilder r4 = r4.append(r6)     // Catch: java.lang.Throwable -> Lcb
            java.lang.String r6 = r8.format(r0)     // Catch: java.lang.Throwable -> Lcb
            java.lang.StringBuilder r6 = r4.append(r6)     // Catch: java.lang.Throwable -> Lcb
            java.lang.Object r4 = r0.getRoute()     // Catch: java.lang.Throwable -> Lcb
            cz.msebera.android.httpclient.conn.routing.HttpRoute r4 = (cz.msebera.android.httpclient.conn.routing.HttpRoute) r4     // Catch: java.lang.Throwable -> Lcb
            java.lang.String r4 = r8.formatStats(r4)     // Catch: java.lang.Throwable -> Lcb
            java.lang.StringBuilder r4 = r6.append(r4)     // Catch: java.lang.Throwable -> Lcb
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> Lcb
            r5.debug(r4)     // Catch: java.lang.Throwable -> Lcb
        Lc8:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> Lcb
            goto L1e
        Lcb:
            r4 = move-exception
            monitor-exit(r2)     // Catch: java.lang.Throwable -> Lcb
            throw r4
        Lce:
            r1 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r8.log     // Catch: java.lang.Throwable -> Le0
            boolean r4 = r4.isDebugEnabled()     // Catch: java.lang.Throwable -> Le0
            if (r4 == 0) goto L30
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r8.log     // Catch: java.lang.Throwable -> Le0
            java.lang.String r5 = "I/O exception shutting down released connection"
            r4.debug(r5, r1)     // Catch: java.lang.Throwable -> Le0
            goto L30
        Le0:
            r4 = move-exception
            cz.msebera.android.httpclient.impl.conn.HttpConnPool r5 = r8.pool     // Catch: java.lang.Throwable -> Lcb
            boolean r6 = r2.isMarkedReusable()     // Catch: java.lang.Throwable -> Lcb
            r5.release(r0, r6)     // Catch: java.lang.Throwable -> Lcb
            throw r4     // Catch: java.lang.Throwable -> Lcb
        Leb:
            java.util.concurrent.TimeUnit r4 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch: java.lang.Throwable -> Le0
            goto L39
        Lef:
            java.lang.String r3 = "indefinitely"
            goto L67
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.PoolingClientConnectionManager.releaseConnection(cz.msebera.android.httpclient.conn.ManagedClientConnection, long, java.util.concurrent.TimeUnit):void");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void shutdown() {
        this.log.debug("Connection manager is shutting down");
        try {
            this.pool.shutdown();
        } catch (IOException ex) {
            this.log.debug("I/O exception shutting down connection manager", ex);
        }
        this.log.debug("Connection manager shut down");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeIdleConnections(long idleTimeout, TimeUnit tunit) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Closing connections idle longer than " + idleTimeout + " " + tunit);
        }
        this.pool.closeIdle(idleTimeout, tunit);
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeExpiredConnections() {
        this.log.debug("Closing expired connections");
        this.pool.closeExpired();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getMaxTotal() {
        return this.pool.getMaxTotal();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setMaxTotal(int max) {
        this.pool.setMaxTotal(max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getDefaultMaxPerRoute() {
        return this.pool.getDefaultMaxPerRoute();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setDefaultMaxPerRoute(int max) {
        this.pool.setDefaultMaxPerRoute(max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public int getMaxPerRoute(HttpRoute route) {
        return this.pool.getMaxPerRoute(route);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public void setMaxPerRoute(HttpRoute route, int max) {
        this.pool.setMaxPerRoute(route, max);
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public PoolStats getTotalStats() {
        return this.pool.getTotalStats();
    }

    @Override // cz.msebera.android.httpclient.pool.ConnPoolControl
    public PoolStats getStats(HttpRoute route) {
        return this.pool.getStats(route);
    }
}
