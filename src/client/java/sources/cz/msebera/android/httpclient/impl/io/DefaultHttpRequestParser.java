package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.ConnectionClosedException;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestFactory;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.RequestLine;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.impl.DefaultHttpRequestFactory;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.message.LineParser;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultHttpRequestParser extends AbstractMessageParser<HttpRequest> {
    private final CharArrayBuffer lineBuf;
    private final HttpRequestFactory requestFactory;

    @Deprecated
    public DefaultHttpRequestParser(SessionInputBuffer buffer, LineParser lineParser, HttpRequestFactory requestFactory, HttpParams params) {
        super(buffer, lineParser, params);
        this.requestFactory = (HttpRequestFactory) Args.notNull(requestFactory, "Request factory");
        this.lineBuf = new CharArrayBuffer(128);
    }

    public DefaultHttpRequestParser(SessionInputBuffer buffer, LineParser lineParser, HttpRequestFactory requestFactory, MessageConstraints constraints) {
        super(buffer, lineParser, constraints);
        this.requestFactory = requestFactory == null ? DefaultHttpRequestFactory.INSTANCE : requestFactory;
        this.lineBuf = new CharArrayBuffer(128);
    }

    public DefaultHttpRequestParser(SessionInputBuffer buffer, MessageConstraints constraints) {
        this(buffer, (LineParser) null, (HttpRequestFactory) null, constraints);
    }

    public DefaultHttpRequestParser(SessionInputBuffer buffer) {
        this(buffer, (LineParser) null, (HttpRequestFactory) null, MessageConstraints.DEFAULT);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // cz.msebera.android.httpclient.impl.io.AbstractMessageParser
    public HttpRequest parseHead(SessionInputBuffer sessionBuffer) throws ParseException, IOException, HttpException {
        this.lineBuf.clear();
        int i = sessionBuffer.readLine(this.lineBuf);
        if (i == -1) {
            throw new ConnectionClosedException("Client closed connection");
        }
        ParserCursor cursor = new ParserCursor(0, this.lineBuf.length());
        RequestLine requestline = this.lineParser.parseRequestLine(this.lineBuf, cursor);
        return this.requestFactory.newHttpRequest(requestline);
    }
}
