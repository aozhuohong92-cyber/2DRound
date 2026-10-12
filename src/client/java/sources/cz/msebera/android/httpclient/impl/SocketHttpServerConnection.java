package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.HttpInetConnection;
import cz.msebera.android.httpclient.impl.io.SocketInputBuffer;
import cz.msebera.android.httpclient.impl.io.SocketOutputBuffer;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.io.SessionOutputBuffer;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SocketHttpServerConnection extends AbstractHttpServerConnection implements HttpInetConnection {
    private volatile boolean open;
    private volatile Socket socket = null;

    protected void assertNotOpen() {
        Asserts.check(!this.open, "Connection is already open");
    }

    @Override // cz.msebera.android.httpclient.impl.AbstractHttpServerConnection
    protected void assertOpen() {
        Asserts.check(this.open, "Connection is not open");
    }

    protected SessionInputBuffer createSessionInputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        return new SocketInputBuffer(socket, buffersize, params);
    }

    protected SessionOutputBuffer createSessionOutputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        return new SocketOutputBuffer(socket, buffersize, params);
    }

    protected void bind(Socket socket, HttpParams params) throws IOException {
        Args.notNull(socket, "Socket");
        Args.notNull(params, "HTTP parameters");
        this.socket = socket;
        int buffersize = params.getIntParameter("http.socket.buffer-size", -1);
        init(createSessionInputBuffer(socket, buffersize, params), createSessionOutputBuffer(socket, buffersize, params), params);
        this.open = true;
    }

    protected Socket getSocket() {
        return this.socket;
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public boolean isOpen() {
        return this.open;
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public InetAddress getLocalAddress() {
        if (this.socket != null) {
            return this.socket.getLocalAddress();
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public int getLocalPort() {
        if (this.socket != null) {
            return this.socket.getLocalPort();
        }
        return -1;
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public InetAddress getRemoteAddress() {
        if (this.socket != null) {
            return this.socket.getInetAddress();
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.HttpInetConnection
    public int getRemotePort() {
        if (this.socket != null) {
            return this.socket.getPort();
        }
        return -1;
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public void setSocketTimeout(int timeout) throws SocketException {
        assertOpen();
        if (this.socket != null) {
            try {
                this.socket.setSoTimeout(timeout);
            } catch (SocketException e) {
            }
        }
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public int getSocketTimeout() {
        if (this.socket == null) {
            return -1;
        }
        try {
            return this.socket.getSoTimeout();
        } catch (SocketException e) {
            return -1;
        }
    }

    @Override // cz.msebera.android.httpclient.HttpConnection
    public void shutdown() throws IOException {
        this.open = false;
        Socket tmpsocket = this.socket;
        if (tmpsocket != null) {
            tmpsocket.close();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpConnection, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.open) {
            this.open = false;
            this.open = false;
            Socket sock = this.socket;
            try {
                doFlush();
                try {
                    try {
                        sock.shutdownOutput();
                    } catch (UnsupportedOperationException e) {
                    }
                } catch (IOException e2) {
                }
                try {
                    sock.shutdownInput();
                } catch (IOException e3) {
                }
            } finally {
                sock.close();
            }
        }
    }

    private static void formatAddress(StringBuilder buffer, SocketAddress socketAddress) {
        if (socketAddress instanceof InetSocketAddress) {
            InetSocketAddress addr = (InetSocketAddress) socketAddress;
            buffer.append(addr.getAddress() != null ? addr.getAddress().getHostAddress() : addr.getAddress()).append(':').append(addr.getPort());
        } else {
            buffer.append(socketAddress);
        }
    }

    public String toString() {
        if (this.socket == null) {
            return super.toString();
        }
        StringBuilder buffer = new StringBuilder();
        SocketAddress remoteAddress = this.socket.getRemoteSocketAddress();
        SocketAddress localAddress = this.socket.getLocalSocketAddress();
        if (remoteAddress != null && localAddress != null) {
            formatAddress(buffer, localAddress);
            buffer.append("<->");
            formatAddress(buffer, remoteAddress);
        }
        return buffer.toString();
    }
}
