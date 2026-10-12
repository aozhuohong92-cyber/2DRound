package org.apache.http.impl.pool;

import java.io.IOException;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.pool.PoolEntry;

@Contract(threading = ThreadingBehavior.SAFE_CONDITIONAL)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicPoolEntry extends PoolEntry<HttpHost, HttpClientConnection> {
    public BasicPoolEntry(String id, HttpHost route, HttpClientConnection conn) {
        super(id, route, conn);
    }

    @Override // org.apache.http.pool.PoolEntry
    public void close() {
        try {
            getConnection().close();
        } catch (IOException e) {
        }
    }

    @Override // org.apache.http.pool.PoolEntry
    public boolean isClosed() {
        return !getConnection().isOpen();
    }
}
