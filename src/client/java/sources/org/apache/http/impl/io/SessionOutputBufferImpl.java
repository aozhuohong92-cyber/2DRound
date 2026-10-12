package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.ByteArrayBuffer;
import org.apache.http.util.CharArrayBuffer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SessionOutputBufferImpl implements SessionOutputBuffer, BufferInfo {
    private static final byte[] CRLF = {13, 10};
    private ByteBuffer bbuf;
    private final ByteArrayBuffer buffer;
    private final CharsetEncoder encoder;
    private final int fragementSizeHint;
    private final HttpTransportMetricsImpl metrics;
    private OutputStream outStream;

    public SessionOutputBufferImpl(HttpTransportMetricsImpl metrics, int bufferSize, int fragementSizeHint, CharsetEncoder charEncoder) {
        Args.positive(bufferSize, "Buffer size");
        Args.notNull(metrics, "HTTP transport metrcis");
        this.metrics = metrics;
        this.buffer = new ByteArrayBuffer(bufferSize);
        this.fragementSizeHint = fragementSizeHint < 0 ? 0 : fragementSizeHint;
        this.encoder = charEncoder;
    }

    public SessionOutputBufferImpl(HttpTransportMetricsImpl metrics, int bufferSize) {
        this(metrics, bufferSize, bufferSize, null);
    }

    public void bind(OutputStream outStream) {
        this.outStream = outStream;
    }

    public boolean isBound() {
        return this.outStream != null;
    }

    @Override // org.apache.http.io.BufferInfo
    public int capacity() {
        return this.buffer.capacity();
    }

    @Override // org.apache.http.io.BufferInfo
    public int length() {
        return this.buffer.length();
    }

    @Override // org.apache.http.io.BufferInfo
    public int available() {
        return capacity() - length();
    }

    private void streamWrite(byte[] b, int off, int len) throws IOException {
        Asserts.notNull(this.outStream, "Output stream");
        this.outStream.write(b, off, len);
    }

    private void flushStream() throws IOException {
        if (this.outStream != null) {
            this.outStream.flush();
        }
    }

    private void flushBuffer() throws IOException {
        int len = this.buffer.length();
        if (len > 0) {
            streamWrite(this.buffer.buffer(), 0, len);
            this.buffer.clear();
            this.metrics.incrementBytesTransferred(len);
        }
    }

    @Override // org.apache.http.io.SessionOutputBuffer
    public void flush() throws IOException {
        flushBuffer();
        flushStream();
    }

    @Override // org.apache.http.io.SessionOutputBuffer
    public void write(byte[] b, int off, int len) throws IOException {
        if (b != null) {
            if (len > this.fragementSizeHint || len > this.buffer.capacity()) {
                flushBuffer();
                streamWrite(b, off, len);
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

    @Override // org.apache.http.io.SessionOutputBuffer
    public void write(byte[] b) throws IOException {
        if (b != null) {
            write(b, 0, b.length);
        }
    }

    @Override // org.apache.http.io.SessionOutputBuffer
    public void write(int b) throws IOException {
        if (this.fragementSizeHint > 0) {
            if (this.buffer.isFull()) {
                flushBuffer();
            }
            this.buffer.append(b);
        } else {
            flushBuffer();
            this.outStream.write(b);
        }
    }

    @Override // org.apache.http.io.SessionOutputBuffer
    public void writeLine(String s) throws IOException {
        if (s != null) {
            if (s.length() > 0) {
                if (this.encoder == null) {
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

    @Override // org.apache.http.io.SessionOutputBuffer
    public void writeLine(CharArrayBuffer charbuffer) throws IOException {
        if (charbuffer != null) {
            if (this.encoder == null) {
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

    @Override // org.apache.http.io.SessionOutputBuffer
    public HttpTransportMetrics getMetrics() {
        return this.metrics;
    }
}
