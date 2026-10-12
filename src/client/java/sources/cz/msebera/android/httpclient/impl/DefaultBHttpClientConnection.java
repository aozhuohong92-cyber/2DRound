package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.impl.io.DefaultHttpRequestWriterFactory;
import cz.msebera.android.httpclient.impl.io.DefaultHttpResponseParserFactory;
import cz.msebera.android.httpclient.io.HttpMessageParser;
import cz.msebera.android.httpclient.io.HttpMessageParserFactory;
import cz.msebera.android.httpclient.io.HttpMessageWriter;
import cz.msebera.android.httpclient.io.HttpMessageWriterFactory;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultBHttpClientConnection extends BHttpConnectionBase implements HttpClientConnection {
    private final HttpMessageWriter<HttpRequest> requestWriter;
    private final HttpMessageParser<HttpResponse> responseParser;

    public DefaultBHttpClientConnection(int buffersize, int fragmentSizeHint, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints, ContentLengthStrategy incomingContentStrategy, ContentLengthStrategy outgoingContentStrategy, HttpMessageWriterFactory<HttpRequest> requestWriterFactory, HttpMessageParserFactory<HttpResponse> responseParserFactory) {
        super(buffersize, fragmentSizeHint, chardecoder, charencoder, constraints, incomingContentStrategy, outgoingContentStrategy);
        this.requestWriter = (requestWriterFactory == null ? DefaultHttpRequestWriterFactory.INSTANCE : requestWriterFactory).create(getSessionOutputBuffer());
        this.responseParser = (responseParserFactory == null ? DefaultHttpResponseParserFactory.INSTANCE : responseParserFactory).create(getSessionInputBuffer(), constraints);
    }

    public DefaultBHttpClientConnection(int buffersize, CharsetDecoder chardecoder, CharsetEncoder charencoder, MessageConstraints constraints) {
        this(buffersize, buffersize, chardecoder, charencoder, constraints, null, null, null, null);
    }

    public DefaultBHttpClientConnection(int buffersize) {
        this(buffersize, buffersize, null, null, null, null, null, null, null);
    }

    protected void onResponseReceived(HttpResponse response) {
    }

    protected void onRequestSubmitted(HttpRequest request) {
    }

    @Override // cz.msebera.android.httpclient.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        super.bind(socket);
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public boolean isResponseAvailable(int timeout) throws IOException {
        ensureOpen();
        try {
            return awaitInput(timeout);
        } catch (SocketTimeoutException e) {
            return false;
        }
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void sendRequestHeader(HttpRequest request) throws IOException, HttpException {
        Args.notNull(request, "HTTP request");
        ensureOpen();
        this.requestWriter.write(request);
        onRequestSubmitted(request);
        incrementRequestCount();
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void sendRequestEntity(HttpEntityEnclosingRequest request) throws IOException, HttpException {
        Args.notNull(request, "HTTP request");
        ensureOpen();
        HttpEntity entity = request.getEntity();
        if (entity != null) {
            OutputStream outstream = prepareOutput(request);
            entity.writeTo(outstream);
            outstream.close();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public HttpResponse receiveResponseHeader() throws HttpException, IOException {
        ensureOpen();
        HttpResponse response = (HttpResponse) this.responseParser.parse();
        onResponseReceived(response);
        if (response.getStatusLine().getStatusCode() >= 200) {
            incrementResponseCount();
        }
        return response;
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void receiveResponseEntity(HttpResponse response) throws HttpException, IOException {
        Args.notNull(response, "HTTP response");
        ensureOpen();
        HttpEntity entity = prepareInput(response);
        response.setEntity(entity);
    }

    @Override // cz.msebera.android.httpclient.HttpClientConnection
    public void flush() throws IOException {
        ensureOpen();
        doFlush();
    }
}
