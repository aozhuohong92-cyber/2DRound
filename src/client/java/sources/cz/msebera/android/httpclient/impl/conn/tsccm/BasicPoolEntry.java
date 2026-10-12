package cz.msebera.android.httpclient.impl.conn.tsccm;

import cz.msebera.android.httpclient.conn.ClientConnectionOperator;
import cz.msebera.android.httpclient.conn.OperatedClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.impl.conn.AbstractPoolEntry;
import cz.msebera.android.httpclient.util.Args;
import java.lang.ref.ReferenceQueue;
import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicPoolEntry extends AbstractPoolEntry {
    private final long created;
    private long expiry;
    private long updated;
    private final long validUntil;

    public BasicPoolEntry(ClientConnectionOperator op, HttpRoute route, ReferenceQueue<Object> queue) {
        super(op, route);
        Args.notNull(route, "HTTP route");
        this.created = System.currentTimeMillis();
        this.validUntil = Long.MAX_VALUE;
        this.expiry = this.validUntil;
    }

    public BasicPoolEntry(ClientConnectionOperator op, HttpRoute route) {
        this(op, route, -1L, TimeUnit.MILLISECONDS);
    }

    public BasicPoolEntry(ClientConnectionOperator op, HttpRoute route, long connTTL, TimeUnit timeunit) {
        super(op, route);
        Args.notNull(route, "HTTP route");
        this.created = System.currentTimeMillis();
        if (connTTL > 0) {
            this.validUntil = this.created + timeunit.toMillis(connTTL);
        } else {
            this.validUntil = Long.MAX_VALUE;
        }
        this.expiry = this.validUntil;
    }

    protected final OperatedClientConnection getConnection() {
        return this.connection;
    }

    protected final HttpRoute getPlannedRoute() {
        return this.route;
    }

    protected final BasicPoolEntryRef getWeakRef() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.impl.conn.AbstractPoolEntry
    protected void shutdownEntry() {
        super.shutdownEntry();
    }

    public long getCreated() {
        return this.created;
    }

    public long getUpdated() {
        return this.updated;
    }

    public long getExpiry() {
        return this.expiry;
    }

    public long getValidUntil() {
        return this.validUntil;
    }

    public void updateExpiry(long time, TimeUnit timeunit) {
        long newExpiry;
        this.updated = System.currentTimeMillis();
        if (time > 0) {
            newExpiry = this.updated + timeunit.toMillis(time);
        } else {
            newExpiry = Long.MAX_VALUE;
        }
        this.expiry = Math.min(this.validUntil, newExpiry);
    }

    public boolean isExpired(long now) {
        return now >= this.expiry;
    }
}
