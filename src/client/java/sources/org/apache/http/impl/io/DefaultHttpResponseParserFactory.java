package org.apache.http.impl.io;

import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.config.MessageConstraints;
import org.apache.http.impl.DefaultHttpResponseFactory;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;

@Contract(threading = ThreadingBehavior.IMMUTABLE_CONDITIONAL)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultHttpResponseParserFactory implements HttpMessageParserFactory<HttpResponse> {
    public static final DefaultHttpResponseParserFactory INSTANCE = new DefaultHttpResponseParserFactory();
    private final LineParser lineParser;
    private final HttpResponseFactory responseFactory;

    public DefaultHttpResponseParserFactory(LineParser lineParser, HttpResponseFactory responseFactory) {
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.responseFactory = responseFactory == null ? DefaultHttpResponseFactory.INSTANCE : responseFactory;
    }

    public DefaultHttpResponseParserFactory() {
        this(null, null);
    }

    @Override // org.apache.http.io.HttpMessageParserFactory
    public HttpMessageParser<HttpResponse> create(SessionInputBuffer buffer, MessageConstraints constraints) {
        return new DefaultHttpResponseParser(buffer, this.lineParser, this.responseFactory, constraints);
    }
}
