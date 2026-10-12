package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.Consts;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.BufferInfo;
import cz.msebera.android.httpclient.io.HttpTransportMetrics;
import cz.msebera.android.httpclient.io.SessionOutputBuffer;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.ByteArrayBuffer;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;

@NotThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractSessionOutputBuffer implements SessionOutputBuffer, BufferInfo {
    private static final byte[] CRLF = {13, 10};
    private boolean ascii;
    private ByteBuffer bbuf;
    private ByteArrayBuffer buffer;
    private Charset charset;
    private CharsetEncoder encoder;
    private HttpTransportMetricsImpl metrics;
    private int minChunkLimit;
    private CodingErrorAction onMalformedCharAction;
    private CodingErrorAction onUnmappableCharAction;
    private OutputStream outstream;

    protected AbstractSessionOutputBuffer(OutputStream outstream, int buffersize, Charset charset, int minChunkLimit, CodingErrorAction malformedCharAction, CodingErrorAction unmappableCharAction) {
        Args.notNull(outstream, "Input stream");
        Args.notNegative(buffersize, "Buffer size");
        this.outstream = outstream;
        this.buffer = new ByteArrayBuffer(buffersize);
        this.charset = charset == null ? Consts.ASCII : charset;
        this.ascii = this.charset.equals(Consts.ASCII);
        this.encoder = null;
        this.minChunkLimit = minChunkLimit < 0 ? 512 : minChunkLimit;
        this.metrics = createTransportMetrics();
        this.onMalformedCharAction = malformedCharAction == null ? CodingErrorAction.REPORT : malformedCharAction;
        this.onUnmappableCharAction = unmappableCharAction == null ? CodingErrorAction.REPORT : unmappableCharAction;
    }

    public AbstractSessionOutputBuffer() {
    }

    protected void init(OutputStream outstream, int buffersize, HttpParams params) {
        Args.notNull(outstream, "Input stream");
        Args.notNegative(buffersize, "Buffer size");
        Args.notNull(params, "HTTP parameters");
        this.outstream = outstream;
        this.buffer = new ByteArrayBuffer(buffersize);
        String charset = (String) params.getParameter("http.protocol.element-charset");
        this.charset = charset != null ? Charset.forName(charset) : Consts.ASCII;
        this.ascii = this.charset.equals(Consts.ASCII);
        this.encoder = null;
        this.minChunkLimit = params.getIntParameter("http.connection.min-chunk-limit", 512);
        this.metrics = createTransportMetrics();
        CodingErrorAction a1 = (CodingErrorAction) params.getParameter("http.malformed.input.action");
        if (a1 == null) {
            a1 = CodingErrorAction.REPORT;
        }
        this.onMalformedCharAction = a1;
        CodingErrorAction a2 = (CodingErrorAction) params.getParameter("http.unmappable.input.action");
        if (a2 == null) {
            a2 = CodingErrorAction.REPORT;
        }
        this.onUnmappableCharAction = a2;
    }

    protected HttpTransportMetricsImpl createTransportMetrics() {
        return new HttpTransportMetricsImpl();
    }

    @Override // cz.msebera.android.httpclient.io.BufferInfo
    public int capacity() {
        return this.buffer.capacity();
    }

    @Override // cz.msebera.android.httpclient.io.BufferInfo
    public int length() {
        return this.buffer.length();
    }

    @Override // cz.msebera.android.httpclient.io.BufferInfo
    public int available() {
        return capacity() - length();
    }

    protected void flushBuffer() throws IOException {
        int len = this.buffer.length();
        if (len > 0) {
            this.outstream.write(this.buffer.buffer(), 0, len);
            this.buffer.clear();
            this.metrics.incrementBytesTransferred(len);
        }
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void flush() throws IOException {
        flushBuffer();
        this.outstream.flush();
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void write(byte[] b, int off, int len) throws IOException {
        if (b != null) {
            if (len > this.minChunkLimit || len > this.buffer.capacity()) {
                flushBuffer();
                this.outstream.write(b, off, len);
                this.metrics.incrementBytesTransferred(len);
            } else {
                int freecapacity = this.buffer.capacity() - this.buffer.length();
                if (len > freecapacity) {
                    flushBuffer();
                }
                this.buffer.append(b, off, len);
            }
        }
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void write(byte[] b) throws IOException {
        if (b != null) {
            write(b, 0, b.length);
        }
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void write(int b) throws IOException {
        if (this.buffer.isFull()) {
            flushBuffer();
        }
        this.buffer.append(b);
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void writeLine(String s) throws IOException {
        if (s != null) {
            if (s.length() > 0) {
                if (this.ascii) {
                    for (int i = 0; i < s.length(); i++) {
                        write(s.charAt(i));
                    }
                } else {
                    CharBuffer cbuf = CharBuffer.wrap(s);
                    writeEncoded(cbuf);
                }
            }
            write(CRLF);
        }
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public void writeLine(CharArrayBuffer charbuffer) throws IOException {
        if (charbuffer != null) {
            if (this.ascii) {
                int off = 0;
                int remaining = charbuffer.length();
                while (remaining > 0) {
                    int chunk = Math.min(this.buffer.capacity() - this.buffer.length(), remaining);
                    if (chunk > 0) {
                        this.buffer.append(charbuffer, off, chunk);
                    }
                    if (this.buffer.isFull()) {
                        flushBuffer();
                    }
                    off += chunk;
                    remaining -= chunk;
                }
            } else {
                CharBuffer cbuf = CharBuffer.wrap(charbuffer.buffer(), 0, charbuffer.length());
                writeEncoded(cbuf);
            }
            write(CRLF);
        }
    }

    private void writeEncoded(CharBuffer cbuf) throws IOException {
        if (cbuf.hasRemaining()) {
            if (this.encoder == null) {
                this.encoder = this.charset.newEncoder();
                this.encoder.onMalformedInput(this.onMalformedCharAction);
                this.encoder.onUnmappableCharacter(this.onUnmappableCharAction);
            }
            if (this.bbuf == null) {
                this.bbuf = ByteBuffer.allocate(1024);
            }
            this.encoder.reset();
            while (cbuf.hasRemaining()) {
                CoderResult result = this.encoder.encode(cbuf, this.bbuf, true);
                handleEncodingResult(result);
            }
            CoderResult result2 = this.encoder.flush(this.bbuf);
            handleEncodingResult(result2);
            this.bbuf.clear();
        }
    }

    private void handleEncodingResult(CoderResult result) throws IOException {
        if (result.isError()) {
            result.throwException();
        }
        this.bbuf.flip();
        while (this.bbuf.hasRemaining()) {
            write(this.bbuf.get());
        }
        this.bbuf.compact();
    }

    @Override // cz.msebera.android.httpclient.io.SessionOutputBuffer
    public HttpTransportMetrics getMetrics() {
        return this.metrics;
    }
}
