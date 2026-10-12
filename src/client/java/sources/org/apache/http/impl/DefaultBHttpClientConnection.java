package org.apache.http.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.config.MessageConstraints;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.impl.io.DefaultHttpRequestWriterFactory;
import org.apache.http.impl.io.DefaultHttpResponseParserFactory;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriter;
import org.apache.http.io.HttpMessageWriterFactory;
import org.apache.http.util.Args;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultBHttpClientConnection extends BHttpConnectionBase implements HttpClientConnection {
    private final HttpMessageWriter<HttpRequest> requestWriter;
    private final HttpMessageParser<HttpResponse> responseParser;

    public DefaultBHttpClientConnection(int bufferSize, int fragmentSizeHint, CharsetDecoder charDecoder, CharsetEncoder charEncoder, MessageConstraints constraints, ContentLengthStrategy incomingContentStrategy, ContentLengthStrategy outgoingContentStrategy, HttpMessageWriterFactory<HttpRequest> requestWriterFactory, HttpMessageParserFactory<HttpResponse> responseParserFactory) {
        super(bufferSize, fragmentSizeHint, charDecoder, charEncoder, constraints, incomingContentStrategy, outgoingContentStrategy);
        this.requestWriter = (requestWriterFactory == null ? DefaultHttpRequestWriterFactory.INSTANCE : requestWriterFactory).create(getSessionOutputBuffer());
        this.responseParser = (responseParserFactory == null ? DefaultHttpResponseParserFactory.INSTANCE : responseParserFactory).create(getSessionInputBuffer(), constraints);
    }

    public DefaultBHttpClientConnection(int bufferSize, CharsetDecoder charDecoder, CharsetEncoder charEncoder, MessageConstraints constraints) {
        this(bufferSize, bufferSize, charDecoder, charEncoder, constraints, null, null, null, null);
    }

    public DefaultBHttpClientConnection(int bufferSize) {
        this(bufferSize, bufferSize, null, null, null, null, null, null, null);
    }

    protected void onResponseReceived(HttpResponse response) {
    }

    protected void onRequestSubmitted(HttpRequest request) {
    }

    @Override // org.apache.http.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        super.bind(socket);
    }

    @Override // org.apache.http.HttpClientConnection
    public boolean isResponseAvailable(int timeout) throws IOException {
        ensureOpen();
        try {
            return awaitInput(timeout);
        } catch (SocketTimeoutException e) {
            return false;
        }
    }

    @Override // org.apache.http.HttpClientConnection
    public void sendRequestHeader(HttpRequest request) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        ensureOpen();
        this.requestWriter.write(request);
        onRequestSubmitted(request);
        incrementRequestCount();
    }

    @Override // org.apache.http.HttpClientConnection
    public void sendRequestEntity(HttpEntityEnclosingRequest request) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        ensureOpen();
        HttpEntity entity = request.getEntity();
        if (entity != null) {
            OutputStream outStream = prepareOutput(request);
            entity.writeTo(outStream);
            outStream.close();
        }
    }

    @Override // org.apache.http.HttpClientConnection
    public HttpResponse receiveResponseHeader() throws HttpException, IOException {
        ensureOpen();
        HttpResponse response = (HttpResponse) this.responseParser.parse();
        onResponseReceived(response);
        if (response.getStatusLine().getStatusCode() >= 200) {
            incrementResponseCount();
        }
        return response;
    }

    @Override // org.apache.http.HttpClientConnection
    public void receiveResponseEntity(HttpResponse response) throws HttpException, IOException {
        Args.notNull(response, "HTTP response");
        ensureOpen();
        HttpEntity entity = prepareInput(response);
        response.setEntity(entity);
    }

    @Override // org.apache.http.HttpClientConnection
    public void flush() throws IOException {
        ensureOpen();
        doFlush();
    }
}
