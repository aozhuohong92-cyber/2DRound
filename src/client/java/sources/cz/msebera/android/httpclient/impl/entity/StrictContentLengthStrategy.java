package cz.msebera.android.httpclient.impl.entity;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class StrictContentLengthStrategy implements ContentLengthStrategy {
    public static final StrictContentLengthStrategy INSTANCE = new StrictContentLengthStrategy();
    private final int implicitLen;

    public StrictContentLengthStrategy(int implicitLen) {
        this.implicitLen = implicitLen;
    }

    public StrictContentLengthStrategy() {
        this(-1);
    }

    @Override // cz.msebera.android.httpclient.entity.ContentLengthStrategy
    public long determineLength(HttpMessage message) throws NumberFormatException, HttpException {
        Args.notNull(message, "HTTP message");
        Header transferEncodingHeader = message.getFirstHeader("Transfer-Encoding");
        if (transferEncodingHeader != null) {
            String s = transferEncodingHeader.getValue();
            if ("chunked".equalsIgnoreCase(s)) {
                if (message.getProtocolVersion().lessEquals(HttpVersion.HTTP_1_0)) {
                    throw new ProtocolException("Chunked transfer encoding not allowed for " + message.getProtocolVersion());
                }
                return -2L;
            }
            if ("identity".equalsIgnoreCase(s)) {
                return -1L;
            }
            throw new ProtocolException("Unsupported transfer encoding: " + s);
        }
        Header contentLengthHeader = message.getFirstHeader("Content-Length");
        if (contentLengthHeader != null) {
            String s2 = contentLengthHeader.getValue();
            try {
                long len = Long.parseLong(s2);
                if (len < 0) {
                    throw new ProtocolException("Negative content length: " + s2);
                }
                return len;
            } catch (NumberFormatException e) {
                throw new ProtocolException("Invalid content length: " + s2);
            }
        }
        return this.implicitLen;
    }
}
