package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.ConnectionClosedException;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.MalformedChunkCodingException;
import cz.msebera.android.httpclient.TruncatedChunkException;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.io.BufferInfo;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;
import java.io.InputStream;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ChunkedInputStream extends InputStream {
    private static final int BUFFER_SIZE = 2048;
    private static final int CHUNK_CRLF = 3;
    private static final int CHUNK_DATA = 2;
    private static final int CHUNK_INVALID = Integer.MAX_VALUE;
    private static final int CHUNK_LEN = 1;
    private final CharArrayBuffer buffer;
    private int chunkSize;
    private boolean closed;
    private final MessageConstraints constraints;
    private boolean eof;
    private Header[] footers;
    private final SessionInputBuffer in;
    private int pos;
    private int state;

    public ChunkedInputStream(SessionInputBuffer in, MessageConstraints constraints) {
        this.eof = false;
        this.closed = false;
        this.footers = new Header[0];
        this.in = (SessionInputBuffer) Args.notNull(in, "Session input buffer");
        this.pos = 0;
        this.buffer = new CharArrayBuffer(16);
        this.constraints = constraints == null ? MessageConstraints.DEFAULT : constraints;
        this.state = 1;
    }

    public ChunkedInputStream(SessionInputBuffer in) {
        this(in, null);
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (!(this.in instanceof BufferInfo)) {
            return 0;
        }
        int len = ((BufferInfo) this.in).length();
        return Math.min(len, this.chunkSize - this.pos);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.closed) {
            throw new IOException("Attempted read from closed stream.");
        }
        if (this.eof) {
            return -1;
        }
        if (this.state != 2) {
            nextChunk();
            if (this.eof) {
                return -1;
            }
        }
        int b = this.in.read();
        if (b != -1) {
            this.pos++;
            if (this.pos >= this.chunkSize) {
                this.state = 3;
                return b;
            }
            return b;
        }
        return b;
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            throw new IOException("Attempted read from closed stream.");
        }
        if (this.eof) {
            return -1;
        }
        if (this.state != 2) {
            nextChunk();
            if (this.eof) {
                return -1;
            }
        }
        int bytesRead = this.in.read(b, off, Math.min(len, this.chunkSize - this.pos));
        if (bytesRead != -1) {
            this.pos += bytesRead;
            if (this.pos >= this.chunkSize) {
                this.state = 3;
                return bytesRead;
            }
            return bytesRead;
        }
        this.eof = true;
        throw new TruncatedChunkException("Truncated chunk ( expected size: " + this.chunkSize + "; actual size: " + this.pos + ")");
    }

    @Override // java.io.InputStream
    public int read(byte[] b) throws IOException {
        return read(b, 0, b.length);
    }

    private void nextChunk() throws IOException {
        if (this.state == Integer.MAX_VALUE) {
            throw new MalformedChunkCodingException("Corrupt data stream");
        }
        try {
            this.chunkSize = getChunkSize();
            if (this.chunkSize < 0) {
                throw new MalformedChunkCodingException("Negative chunk size");
            }
            this.state = 2;
            this.pos = 0;
            if (this.chunkSize == 0) {
                this.eof = true;
                parseTrailerHeaders();
            }
        } catch (MalformedChunkCodingException ex) {
            this.state = Integer.MAX_VALUE;
            throw ex;
        }
    }

    private int getChunkSize() throws IOException {
        int st = this.state;
        switch (st) {
            case 1:
                break;
            case 2:
            default:
                throw new IllegalStateException("Inconsistent codec state");
            case 3:
                this.buffer.clear();
                int bytesRead1 = this.in.readLine(this.buffer);
                if (bytesRead1 == -1) {
                    throw new MalformedChunkCodingException("CRLF expected at end of chunk");
                }
                if (!this.buffer.isEmpty()) {
                    throw new MalformedChunkCodingException("Unexpected content at the end of chunk");
                }
                this.state = 1;
                break;
        }
        this.buffer.clear();
        int bytesRead2 = this.in.readLine(this.buffer);
        if (bytesRead2 == -1) {
            throw new ConnectionClosedException("Premature end of chunk coded message body: closing chunk expected");
        }
        int separator = this.buffer.indexOf(59);
        if (separator < 0) {
            separator = this.buffer.length();
        }
        try {
            return Integer.parseInt(this.buffer.substringTrimmed(0, separator), 16);
        } catch (NumberFormatException e) {
            throw new MalformedChunkCodingException("Bad chunk header");
        }
    }

    private void parseTrailerHeaders() throws IOException {
        try {
            this.footers = AbstractMessageParser.parseHeaders(this.in, this.constraints.getMaxHeaderCount(), this.constraints.getMaxLineLength(), null);
        } catch (HttpException ex) {
            IOException ioe = new MalformedChunkCodingException("Invalid footer: " + ex.getMessage());
            ioe.initCause(ex);
            throw ioe;
        }
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            try {
                if (!this.eof && this.state != Integer.MAX_VALUE) {
                    byte[] buff = new byte[2048];
                    do {
                    } while (read(buff) >= 0);
                }
            } finally {
                this.eof = true;
                this.closed = true;
            }
        }
    }

    public Header[] getFooters() {
        return (Header[]) this.footers.clone();
    }
}
