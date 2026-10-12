package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.io.HttpMessageParserFactory;
import cz.msebera.android.httpclient.io.HttpMessageWriterFactory;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class LoggingManagedHttpClientConnection extends DefaultManagedHttpClientConnection {
    private final HttpClientAndroidLog headerlog;
    public HttpClientAndroidLog log;
    private final Wire wire;

    public LoggingManagedHttpClientConnection(String id, HttpClientAndroidLog log, HttpClientAndroidLog headerlog, HttpClientAndroidLog wirelog, int buffersize, int fragmentSizeHint, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints, ContentLengthStrategy incomingContentStrategy, ContentLengthStrategy outgoingContentStrategy, HttpMessageWriterFactory<HttpRequest> requestWriterFactory, HttpMessageParserFactory<HttpResponse> responseParserFactory) {
        super(id, buffersize, fragmentSizeHint, chardecoder, charencoder, constraints, incomingContentStrategy, outgoingContentStrategy, requestWriterFactory, responseParserFactory);
        this.log = log;
        this.headerlog = headerlog;
        this.wire = new Wire(wirelog, id);
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase, cz.msebera.android.httpclient.HttpConnection, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.log.isDebugEnabled()) {
            this.log.debug(getId() + ": Close connection");
        }
        super.close();
    }

    @Override // cz.msebera.android.httpclient.impl.conn.DefaultManagedHttpClientConnection, cz.msebera.android.httpclient.impl.BHttpConnectionBase, cz.msebera.android.httpclient.HttpConnection
    public void shutdown() throws IOException {
        if (this.log.isDebugEnabled()) {
            this.log.debug(getId() + ": Shutdown connection");
        }
        super.shutdown();
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase
    protected InputStream getSocketInputStream(Socket socket) throws IOException {
        InputStream in = super.getSocketInputStream(socket);
        if (this.wire.enabled()) {
            return new LoggingInputStream(in, this.wire);
        }
        return in;
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase
    protected OutputStream getSocketOutputStream(Socket socket) throws IOException {
        OutputStream out = super.getSocketOutputStream(socket);
        if (this.wire.enabled()) {
            return new LoggingOutputStream(out, this.wire);
        }
        return out;
    }

    @Override // cz.msebera.android.httpclient.impl.DefaultBHttpClientConnection
    protected void onResponseReceived(HttpResponse response) {
        if (response != null && this.headerlog.isDebugEnabled()) {
            this.headerlog.debug(getId() + " << " + response.getStatusLine().toString());
            Header[] headers = response.getAllHeaders();
            for (Header header : headers) {
                this.headerlog.debug(getId() + " << " + header.toString());
            }
        }
    }

    @Override // cz.msebera.android.httpclient.impl.DefaultBHttpClientConnection
    protected void onRequestSubmitted(HttpRequest request) {
        if (request != null && this.headerlog.isDebugEnabled()) {
            this.headerlog.debug(getId() + " >> " + request.getRequestLine().toString());
            Header[] headers = request.getAllHeaders();
            for (Header header : headers) {
                this.headerlog.debug(getId() + " >> " + header.toString());
            }
        }
    }
}
