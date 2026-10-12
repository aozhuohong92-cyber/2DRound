package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.conn.ManagedHttpClientConnection;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.impl.DefaultBHttpClientConnection;
import cz.msebera.android.httpclient.io.HttpMessageParserFactory;
import cz.msebera.android.httpclient.io.HttpMessageWriterFactory;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultManagedHttpClientConnection extends DefaultBHttpClientConnection implements ManagedHttpClientConnection, HttpContext {
    private final Map<String, Object> attributes;
    private final String id;
    private volatile boolean shutdown;

    public DefaultManagedHttpClientConnection(String id, int buffersize, int fragmentSizeHint, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints, ContentLengthStrategy incomingContentStrategy, ContentLengthStrategy outgoingContentStrategy, HttpMessageWriterFactory<HttpRequest> requestWriterFactory, HttpMessageParserFactory<HttpResponse> responseParserFactory) {
        super(buffersize, fragmentSizeHint, chardecoder, charencoder, constraints, incomingContentStrategy, outgoingContentStrategy, requestWriterFactory, responseParserFactory);
        this.id = id;
        this.attributes = new ConcurrentHashMap();
    }

    public DefaultManagedHttpClientConnection(String id, int buffersize) {
        this(id, buffersize, buffersize, null, null, null, null, null, null, null);
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public String getId() {
        return this.id;
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase, cz.msebera.android.httpclient.HttpConnection
    public void shutdown() throws IOException {
        this.shutdown = true;
        super.shutdown();
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public Object getAttribute(String id) {
        return this.attributes.get(id);
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public Object removeAttribute(String id) {
        return this.attributes.remove(id);
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpContext
    public void setAttribute(String id, Object obj) {
        this.attributes.put(id, obj);
    }

    @Override // cz.msebera.android.httpclient.impl.DefaultBHttpClientConnection, cz.msebera.android.httpclient.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        if (this.shutdown) {
            socket.close();
            throw new InterruptedIOException("Connection already shutdown");
        }
        super.bind(socket);
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase, cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public Socket getSocket() {
        return super.getSocket();
    }

    @Override // cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    public SSLSession getSSLSession() {
        Socket socket = super.getSocket();
        if (socket instanceof SSLSocket) {
            return ((SSLSocket) socket).getSession();
        }
        return null;
    }
}
