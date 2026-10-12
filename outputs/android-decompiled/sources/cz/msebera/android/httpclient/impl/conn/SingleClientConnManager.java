package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.annotation.GuardedBy;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ClientConnectionOperator;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@ThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SingleClientConnManager implements ClientConnectionManager {
    public static final String MISUSE_MESSAGE = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
    protected final boolean alwaysShutDown;
    protected final ClientConnectionOperator connOperator;

    @GuardedBy("this")
    protected volatile long connectionExpiresTime;
    protected volatile boolean isShutDown;

    @GuardedBy("this")
    protected volatile long lastReleaseTime;
    public HttpClientAndroidLog log;

    @GuardedBy("this")
    protected volatile ConnAdapter managedConn;
    protected final SchemeRegistry schemeRegistry;

    @GuardedBy("this")
    protected volatile PoolEntry uniquePoolEntry;

    @Deprecated
    public SingleClientConnManager(HttpParams params, SchemeRegistry schreg) {
        this(schreg);
    }

    public SingleClientConnManager(SchemeRegistry schreg) {
        this.log = new HttpClientAndroidLog(getClass());
        Args.notNull(schreg, "Scheme registry");
        this.schemeRegistry = schreg;
        this.connOperator = createConnectionOperator(schreg);
        this.uniquePoolEntry = new PoolEntry();
        this.managedConn = null;
        this.lastReleaseTime = -1L;
        this.alwaysShutDown = false;
        this.isShutDown = false;
    }

    public SingleClientConnManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    protected void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
        return new DefaultClientConnectionOperator(schreg);
    }

    protected final void assertStillUp() throws IllegalStateException {
        Asserts.check(!this.isShutDown, "Manager is shut down");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public final ClientConnectionRequest requestConnection(final HttpRoute route, final Object state) {
        return new ClientConnectionRequest() { // from class: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.1
            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public void abortRequest() {
            }

            @Override // cz.msebera.android.httpclient.conn.ClientConnectionRequest
            public ManagedClientConnection getConnection(long timeout, TimeUnit tunit) {
                return SingleClientConnManager.this.getConnection(route, state);
            }
        };
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005f A[Catch: all -> 0x0082, TRY_ENTER, TryCatch #1 {, blocks: (B:6:0x002b, B:9:0x0030, B:11:0x0044, B:13:0x004a, B:18:0x0058, B:28:0x007a, B:20:0x005f, B:21:0x0066, B:22:0x0071), top: B:34:0x002b, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.conn.ManagedClientConnection getConnection(cz.msebera.android.httpclient.conn.routing.HttpRoute r10, java.lang.Object r11) throws java.lang.IllegalStateException {
        /*
            r9 = this;
            r5 = 1
            r4 = 0
            java.lang.String r6 = "Route"
            cz.msebera.android.httpclient.util.Args.notNull(r10, r6)
            r9.assertStillUp()
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r6 = r9.log
            boolean r6 = r6.isDebugEnabled()
            if (r6 == 0) goto L2a
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r6 = r9.log
            java.lang.StringBuilder r7 = new java.lang.StringBuilder
            r7.<init>()
            java.lang.String r8 = "Get connection for route "
            java.lang.StringBuilder r7 = r7.append(r8)
            java.lang.StringBuilder r7 = r7.append(r10)
            java.lang.String r7 = r7.toString()
            r6.debug(r7)
        L2a:
            monitor-enter(r9)
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter r6 = r9.managedConn     // Catch: java.lang.Throwable -> L82
            if (r6 != 0) goto L73
            r6 = r5
        L30:
            java.lang.String r7 = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one."
            cz.msebera.android.httpclient.util.Asserts.check(r6, r7)     // Catch: java.lang.Throwable -> L82
            r1 = 0
            r2 = 0
            r9.closeExpiredConnections()     // Catch: java.lang.Throwable -> L82
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r6 = r9.uniquePoolEntry     // Catch: java.lang.Throwable -> L82
            cz.msebera.android.httpclient.conn.OperatedClientConnection r6 = r6.connection     // Catch: java.lang.Throwable -> L82
            boolean r6 = r6.isOpen()     // Catch: java.lang.Throwable -> L82
            if (r6 == 0) goto L77
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r6 = r9.uniquePoolEntry     // Catch: java.lang.Throwable -> L82
            cz.msebera.android.httpclient.conn.routing.RouteTracker r3 = r6.tracker     // Catch: java.lang.Throwable -> L82
            if (r3 == 0) goto L54
            cz.msebera.android.httpclient.conn.routing.HttpRoute r6 = r3.toRoute()     // Catch: java.lang.Throwable -> L82
            boolean r6 = r6.equals(r10)     // Catch: java.lang.Throwable -> L82
            if (r6 != 0) goto L75
        L54:
            r2 = r5
        L55:
            if (r2 == 0) goto L5d
            r1 = 1
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r4 = r9.uniquePoolEntry     // Catch: java.io.IOException -> L79 java.lang.Throwable -> L82
            r4.shutdown()     // Catch: java.io.IOException -> L79 java.lang.Throwable -> L82
        L5d:
            if (r1 == 0) goto L66
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r4 = new cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry     // Catch: java.lang.Throwable -> L82
            r4.<init>()     // Catch: java.lang.Throwable -> L82
            r9.uniquePoolEntry = r4     // Catch: java.lang.Throwable -> L82
        L66:
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter r4 = new cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter     // Catch: java.lang.Throwable -> L82
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r5 = r9.uniquePoolEntry     // Catch: java.lang.Throwable -> L82
            r4.<init>(r5, r10)     // Catch: java.lang.Throwable -> L82
            r9.managedConn = r4     // Catch: java.lang.Throwable -> L82
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter r4 = r9.managedConn     // Catch: java.lang.Throwable -> L82
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L82
            return r4
        L73:
            r6 = r4
            goto L30
        L75:
            r2 = r4
            goto L55
        L77:
            r1 = 1
            goto L55
        L79:
            r0 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r4 = r9.log     // Catch: java.lang.Throwable -> L82
            java.lang.String r5 = "Problem shutting down connection."
            r4.debug(r5, r0)     // Catch: java.lang.Throwable -> L82
            goto L5d
        L82:
            r4 = move-exception
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L82
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.getConnection(cz.msebera.android.httpclient.conn.routing.HttpRoute, java.lang.Object):cz.msebera.android.httpclient.conn.ManagedClientConnection");
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void releaseConnection(ManagedClientConnection conn, long validDuration, TimeUnit timeUnit) throws IllegalStateException {
        Args.check(conn instanceof ConnAdapter, "Connection class mismatch, connection not obtained from this manager");
        assertStillUp();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Releasing connection " + conn);
        }
        ConnAdapter sca = (ConnAdapter) conn;
        synchronized (sca) {
            if (sca.poolEntry == null) {
                return;
            }
            ClientConnectionManager manager = sca.getManager();
            Asserts.check(manager == this, "Connection not obtained from this manager");
            try {
                try {
                    if (sca.isOpen() && (this.alwaysShutDown || !sca.isMarkedReusable())) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Released connection open but not reusable.");
                        }
                        sca.shutdown();
                    }
                    sca.detach();
                    synchronized (this) {
                        this.managedConn = null;
                        this.lastReleaseTime = System.currentTimeMillis();
                        if (validDuration > 0) {
                            this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                        } else {
                            this.connectionExpiresTime = Long.MAX_VALUE;
                        }
                    }
                } catch (Throwable th) {
                    sca.detach();
                    synchronized (this) {
                        this.managedConn = null;
                        this.lastReleaseTime = System.currentTimeMillis();
                        if (validDuration > 0) {
                            this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                        } else {
                            this.connectionExpiresTime = Long.MAX_VALUE;
                        }
                        throw th;
                    }
                }
            } catch (IOException iox) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Exception shutting down released connection.", iox);
                }
                sca.detach();
                synchronized (this) {
                    this.managedConn = null;
                    this.lastReleaseTime = System.currentTimeMillis();
                    if (validDuration > 0) {
                        this.connectionExpiresTime = timeUnit.toMillis(validDuration) + this.lastReleaseTime;
                    } else {
                        this.connectionExpiresTime = Long.MAX_VALUE;
                    }
                }
            }
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void closeExpiredConnections() throws IllegalStateException {
        long time = this.connectionExpiresTime;
        if (System.currentTimeMillis() >= time) {
            closeIdleConnections(0L, TimeUnit.MILLISECONDS);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002c A[Catch: all -> 0x0037, DONT_GENERATE, TRY_ENTER, TryCatch #0 {, blocks: (B:4:0x0009, B:6:0x000d, B:8:0x0017, B:11:0x0027, B:15:0x002f, B:12:0x002c), top: B:19:0x0009, inners: #1 }] */
    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void closeIdleConnections(long r10, java.util.concurrent.TimeUnit r12) throws java.lang.IllegalStateException {
        /*
            r9 = this;
            r9.assertStillUp()
            java.lang.String r3 = "Time unit"
            cz.msebera.android.httpclient.util.Args.notNull(r12, r3)
            monitor-enter(r9)
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$ConnAdapter r3 = r9.managedConn     // Catch: java.lang.Throwable -> L37
            if (r3 != 0) goto L2c
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r3 = r9.uniquePoolEntry     // Catch: java.lang.Throwable -> L37
            cz.msebera.android.httpclient.conn.OperatedClientConnection r3 = r3.connection     // Catch: java.lang.Throwable -> L37
            boolean r3 = r3.isOpen()     // Catch: java.lang.Throwable -> L37
            if (r3 == 0) goto L2c
            long r4 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L37
            long r6 = r12.toMillis(r10)     // Catch: java.lang.Throwable -> L37
            long r0 = r4 - r6
            long r4 = r9.lastReleaseTime     // Catch: java.lang.Throwable -> L37
            int r3 = (r4 > r0 ? 1 : (r4 == r0 ? 0 : -1))
            if (r3 > 0) goto L2c
            cz.msebera.android.httpclient.impl.conn.SingleClientConnManager$PoolEntry r3 = r9.uniquePoolEntry     // Catch: java.io.IOException -> L2e java.lang.Throwable -> L37
            r3.close()     // Catch: java.io.IOException -> L2e java.lang.Throwable -> L37
        L2c:
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L37
            return
        L2e:
            r2 = move-exception
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r3 = r9.log     // Catch: java.lang.Throwable -> L37
            java.lang.String r4 = "Problem closing idle connection."
            r3.debug(r4, r2)     // Catch: java.lang.Throwable -> L37
            goto L2c
        L37:
            r3 = move-exception
            monitor-exit(r9)     // Catch: java.lang.Throwable -> L37
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.SingleClientConnManager.closeIdleConnections(long, java.util.concurrent.TimeUnit):void");
    }

    /* JADX WARN: Finally extract failed */
    @Override // cz.msebera.android.httpclient.conn.ClientConnectionManager
    public void shutdown() {
        this.isShutDown = true;
        synchronized (this) {
            try {
                try {
                    if (this.uniquePoolEntry != null) {
                        this.uniquePoolEntry.shutdown();
                    }
                    this.uniquePoolEntry = null;
                    this.managedConn = null;
                } catch (IOException iox) {
                    this.log.debug("Problem while shutting down manager.", iox);
                    this.uniquePoolEntry = null;
                    this.managedConn = null;
                }
            } catch (Throwable th) {
                this.uniquePoolEntry = null;
                this.managedConn = null;
                throw th;
            }
        }
    }

    protected void revokeConnection() {
        ConnAdapter conn = this.managedConn;
        if (conn != null) {
            conn.detach();
            synchronized (this) {
                try {
                    this.uniquePoolEntry.shutdown();
                } catch (IOException iox) {
                    this.log.debug("Problem while shutting down connection.", iox);
                }
            }
        }
    }

    protected class PoolEntry extends AbstractPoolEntry {
        protected PoolEntry() {
            super(SingleClientConnManager.this.connOperator, null);
        }

        protected void close() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.close();
            }
        }

        protected void shutdown() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.shutdown();
            }
        }
    }

    protected class ConnAdapter extends AbstractPooledConnAdapter {
        protected ConnAdapter(PoolEntry entry, HttpRoute route) {
            super(SingleClientConnManager.this, entry);
            markReusable();
            entry.route = route;
        }
    }
}
