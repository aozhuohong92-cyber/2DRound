package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.conn.EofSensorInputStream;
import cz.msebera.android.httpclient.conn.EofSensorWatcher;
import cz.msebera.android.httpclient.entity.HttpEntityWrapper;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ResponseEntityProxy extends HttpEntityWrapper implements EofSensorWatcher {
    private final ConnectionHolder connHolder;

    public static void enchance(HttpResponse response, ConnectionHolder connHolder) {
        HttpEntity entity = response.getEntity();
        if (entity != null && entity.isStreaming() && connHolder != null) {
            response.setEntity(new ResponseEntityProxy(entity, connHolder));
        }
    }

    ResponseEntityProxy(HttpEntity entity, ConnectionHolder connHolder) {
        super(entity);
        this.connHolder = connHolder;
    }

    private void cleanup() {
        if (this.connHolder != null) {
            this.connHolder.abortConnection();
        }
    }

    public void releaseConnection() throws IOException {
        if (this.connHolder != null) {
            try {
                if (this.connHolder.isReusable()) {
                    this.connHolder.releaseConnection();
                }
            } finally {
                cleanup();
            }
        }
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return false;
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        return new EofSensorInputStream(this.wrappedEntity.getContent(), this);
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    @Deprecated
    public void consumeContent() throws IOException {
        releaseConnection();
    }

    @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        try {
            this.wrappedEntity.writeTo(outstream);
            releaseConnection();
        } finally {
            cleanup();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean eofDetected(InputStream wrapped) throws IOException {
        try {
            wrapped.close();
            releaseConnection();
            cleanup();
            return false;
        } catch (Throwable th) {
            cleanup();
            throw th;
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamClosed(InputStream wrapped) throws IOException {
        try {
            boolean open = (this.connHolder == null || this.connHolder.isReleased()) ? false : true;
            try {
                wrapped.close();
                releaseConnection();
            } catch (SocketException ex) {
                if (open) {
                    throw ex;
                }
            }
            return false;
        } finally {
            cleanup();
        }
    }

    @Override // cz.msebera.android.httpclient.conn.EofSensorWatcher
    public boolean streamAbort(InputStream wrapped) throws IOException {
        cleanup();
        return false;
    }

    public String toString() {
        return "ResponseEntityProxy{" + this.wrappedEntity + '}';
    }
}
