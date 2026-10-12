package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.ConnectionClosedException;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.HttpRequestFactory;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.RequestLine;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.message.LineParser;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;

@NotThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpRequestParser extends AbstractMessageParser<HttpMessage> {
    private final CharArrayBuffer lineBuf;
    private final HttpRequestFactory requestFactory;

    public HttpRequestParser(SessionInputBuffer buffer, LineParser parser, HttpRequestFactory requestFactory, HttpParams params) {
        super(buffer, parser, params);
        this.requestFactory = (HttpRequestFactory) Args.notNull(requestFactory, "Request factory");
        this.lineBuf = new CharArrayBuffer(128);
    }

    @Override // cz.msebera.android.httpclient.impl.io.AbstractMessageParser
    protected HttpMessage parseHead(SessionInputBuffer sessionBuffer) throws ParseException, IOException, HttpException {
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
