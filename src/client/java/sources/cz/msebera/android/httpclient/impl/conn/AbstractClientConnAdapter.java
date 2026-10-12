package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.HttpConnectionMetrics;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.OperatedClientConnection;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

@NotThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractClientConnAdapter implements ManagedClientConnection, HttpContext {
    private final ClientConnectionManager connManager;
    private volatile OperatedClientConnection wrappedConnection;
    private volatile boolean markedReusable = false;
    private volatile boolean released = false;
    private volatile long duration = Long.MAX_VALUE;

    protected AbstractClientConnAdapter(ClientConnectionManager mgr, OperatedClientConnection conn) {
        this.connManager = mgr;
        this.wrappedConnection = conn;
    }

    protected synchronized void detach() {
        this.wrappedConnection = null;
        this.duration = Long.MAX_VALUE;
    }

    protected OperatedClientConnection getWrappedConnection() {
        return this.wrappedConnection;
    }

    protected ClientConnectionManager getManager() {
        return this.connManager;
    }

    @Deprecated
    protected final void assertNotAborted() throws InterruptedIOException {
        if (isReleased()) {
            throw new InterruptedIOException("Connection has been shut down");
        }
    }

    protected boolean isReleased() {
        return this.released;
    }

    protected final void assertValid(OperatedClientConnection wrappedConn) throws ConnectionShutdownException {
        if (isReleased() || wrappedConn == null) {
            throw new ConnectionShutdownException();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public boolean isOpen() {
        OperatedClientConnection conn = getWrappedConnection();
        if (conn == null) {
            return false;
        }
        return conn.isOpen();
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public boolean isStale() {
        OperatedClientConnection conn;
        if (isReleased() || (conn = getWrappedConnection()) == null) {
            return true;
        }
        return conn.isStale();
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public void setSocketTimeout(int timeout) throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        conn.setSocketTimeout(timeout);
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public int getSocketTimeout() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getSocketTimeout();
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public HttpConnectionMetrics getMetrics() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getMetrics();
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void flush() throws IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        conn.flush();
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public boolean isResponseAvailable(int timeout) throws IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.isResponseAvailable(timeout);
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void receiveResponseEntity(HttpResponse response) throws HttpException, IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        unmarkReusable();
        conn.receiveResponseEntity(response);
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public HttpResponse receiveResponseHeader() throws HttpException, IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        unmarkReusable();
        return conn.receiveResponseHeader();
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void sendRequestEntity(HttpEntityEnclosingRequest request) throws HttpException, IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        unmarkReusable();
        conn.sendRequestEntity(request);
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void sendRequestHeader(HttpRequest request) throws HttpException, IOException, ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        unmarkReusable();
        conn.sendRequestHeader(request);
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public InetAddress getLocalAddress() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getLocalAddress();
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public int getLocalPort() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getLocalPort();
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public InetAddress getRemoteAddress() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getRemoteAddress();
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public int getRemotePort() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.getRemotePort();
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection, cz.msebera.android.httpclient.conn.HttpRoutedConnection
    public boolean isSecure() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        return conn.isSecure();
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public void bind(Socket socket) throws IOException {
        throw new UnsupportedOperationException();
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public Socket getSocket() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        if (isOpen()) {
            return conn.getSocket();
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection, cz.msebera.android.httpclient.conn.HttpRoutedConnection, cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public SSLSession getSSLSession() throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        if (!isOpen()) {
            return null;
        }
        Socket sock = conn.getSocket();
        if (!(sock instanceof SSLSocket)) {
            return null;
        }
        SSLSession result = ((SSLSocket) sock).getSession();
        return result;
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection
    public void markReusable() {
        this.markedReusable = true;
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection
    public void unmarkReusable() {
        this.markedReusable = false;
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection
    public boolean isMarkedReusable() {
        return this.markedReusable;
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedClientConnection
    public void setIdleDuration(long duration, TimeUnit unit) {
        if (duration > 0) {
            this.duration = unit.toMillis(duration);
        } else {
            this.duration = -1L;
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger
    public synchronized void releaseConnection() {
        if (!this.released) {
            this.released = true;
            this.connManager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger
    public synchronized void abortConnection() {
        if (!this.released) {
            this.released = true;
            unmarkReusable();
            try {
                shutdown();
            } catch (IOException e) {
            }
            this.connManager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
        }
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public Object getAttribute(String id) throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        if (conn instanceof HttpContext) {
            return ((HttpContext) conn).getAttribute(id);
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public Object removeAttribute(String id) throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        if (conn instanceof HttpContext) {
            return ((HttpContext) conn).removeAttribute(id);
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public void setAttribute(String id, Object obj) throws ConnectionShutdownException {
        OperatedClientConnection conn = getWrappedConnection();
        assertValid(conn);
        if (conn instanceof HttpContext) {
            ((HttpContext) conn).setAttribute(id, obj);
        }
    }
}
