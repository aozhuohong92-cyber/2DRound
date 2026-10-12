package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpServerConnection;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.impl.entity.DisallowIdentityContentLengthStrategy;
import cz.msebera.android.httpclient.impl.io.DefaultHttpRequestParserFactory;
import cz.msebera.android.httpclient.impl.io.DefaultHttpResponseWriterFactory;
import cz.msebera.android.httpclient.io.HttpMessageParser;
import cz.msebera.android.httpclient.io.HttpMessageParserFactory;
import cz.msebera.android.httpclient.io.HttpMessageWriter;
import cz.msebera.android.httpclient.io.HttpMessageWriterFactory;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultBHttpServerConnection extends BHttpConnectionBase implements HttpServerConnection {
    private final HttpMessageParser<HttpRequest> requestParser;
    private final HttpMessageWriter<HttpResponse> responseWriter;

    public DefaultBHttpServerConnection(int buffersize, int fragmentSizeHint, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints, ContentLengthStrategy incomingContentStrategy, ContentLengthStrategy outgoingContentStrategy, HttpMessageParserFactory<HttpRequest> requestParserFactory, HttpMessageWriterFactory<HttpResponse> responseWriterFactory) {
        super(buffersize, fragmentSizeHint, chardecoder, charencoder, constraints, incomingContentStrategy != null ? incomingContentStrategy : DisallowIdentityContentLengthStrategy.INSTANCE, outgoingContentStrategy);
        this.requestParser = (requestParserFactory == null ? DefaultHttpRequestParserFactory.INSTANCE : requestParserFactory).create(getSessionInputBuffer(), constraints);
        this.responseWriter = (responseWriterFactory == null ? DefaultHttpResponseWriterFactory.INSTANCE : responseWriterFactory).create(getSessionOutputBuffer());
    }

    public DefaultBHttpServerConnection(int buffersize, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints) {
        this(buffersize, buffersize, chardecoder, charencoder, constraints, null, null, null, null);
    }

    public DefaultBHttpServerConnection(int buffersize) {
        this(buffersize, buffersize, null, null, null, null, null, null, null);
    }

    protected void onRequestReceived(HttpRequest request) {
    }

    protected void onResponseSubmitted(HttpResponse response) {
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        super.bind(socket);
    }

    @Override // cz.msebera.android.httpclient.HttpServerConnection
    public HttpRequest receiveRequestHeader() throws HttpException, IOException {
        ensureOpen();
        HttpRequest request = (HttpRequest) this.requestParser.parse();
        onRequestReceived(request);
        incrementRequestCount();
        return request;
    }

    @Override // cz.msebera.android.httpclient.HttpServerConnection
    public void receiveRequestEntity(HttpEntityEnclosingRequest request) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        ensureOpen();
        HttpEntity entity = prepareInput(request);
        request.setEntity(entity);
    }

    @Override // cz.msebera.android.httpclient.HttpServerConnection
    public void sendResponseHeader(HttpResponse response) throws IOException, HttpException {
        Args.notNull(response, "HTTP response");
        ensureOpen();
        this.responseWriter.write(response);
        onResponseSubmitted(response);
        if (response.getStatusLine().getStatusCode() >= 200) {
            incrementResponseCount();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpServerConnection
    public void sendResponseEntity(HttpResponse response) throws IOException, HttpException {
        Args.notNull(response, "HTTP response");
        ensureOpen();
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            OutputStream outstream = prepareOutput(response);
            entity.writeTo(outstream);
            outstream.close();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpServerConnection
    public void flush() throws IOException {
        ensureOpen();
        doFlush();
    }
}
