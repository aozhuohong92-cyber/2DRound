package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.conn.OperatedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.routing.RouteTracker;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.pool.PoolEntry;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class HttpPoolEntry extends PoolEntry<HttpRoute, OperatedClientConnection> {
    public HttpClientAndroidLog log;
    private final RouteTracker tracker;

    public HttpPoolEntry(HttpClientAndroidLog log, String id, HttpRoute route, OperatedClientConnection conn, long timeToLive, TimeUnit tunit) {
        super(id, route, conn, timeToLive, tunit);
        this.log = log;
        this.tracker = new RouteTracker(route);
    }

    @Override // cz.msebera.android.httpclient.pool.PoolEntry
    public boolean isExpired(long now) {
        boolean expired = super.isExpired(now);
        if (expired && this.log.isDebugEnabled()) {
            this.log.debug("Connection " + this + " expired @ " + new Date(getExpiry()));
        }
        return expired;
    }

    RouteTracker getTracker() {
        return this.tracker;
    }

    HttpRoute getPlannedRoute() {
        return getRoute();
    }

    HttpRoute getEffectiveRoute() {
        return this.tracker.toRoute();
    }

    @Override // cz.msebera.android.httpclient.pool.PoolEntry
    public boolean isClosed() {
        OperatedClientConnection conn = getConnection();
        return !conn.isOpen();
    }

    @Override // cz.msebera.android.httpclient.pool.PoolEntry
    public void close() {
        OperatedClientConnection conn = getConnection();
        try {
            conn.close();
        } catch (IOException ex) {
            this.log.debug("I/O error closing connection", ex);
        }
    }
}
