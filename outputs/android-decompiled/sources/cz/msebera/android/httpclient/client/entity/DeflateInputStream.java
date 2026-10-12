package cz.msebera.android.httpclient.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DeflateInputStream extends InputStream {
    private InputStream sourceStream;

    public DeflateInputStream(InputStream wrapped) throws IOException {
        int n;
        byte[] peeked = new byte[6];
        PushbackInputStream pushback = new PushbackInputStream(wrapped, peeked.length);
        int headerLength = pushback.read(peeked);
        if (headerLength == -1) {
            throw new IOException("Unable to read the response");
        }
        byte[] dummy = new byte[1];
        Inflater inf = new Inflater();
        while (true) {
            try {
                n = inf.inflate(dummy);
                if (n != 0) {
                    break;
                }
                if (inf.finished()) {
                    throw new IOException("Unable to read the response");
                }
                if (inf.needsDictionary()) {
                    break;
                } else if (inf.needsInput()) {
                    inf.setInput(peeked);
                }
            } catch (DataFormatException e) {
                pushback.unread(peeked, 0, headerLength);
                this.sourceStream = new DeflateStream(pushback, new Inflater(true));
                return;
            } finally {
                inf.end();
            }
        }
        if (n == -1) {
            throw new IOException("Unable to read the response");
        }
        pushback.unread(peeked, 0, headerLength);
        this.sourceStream = new DeflateStream(pushback, new Inflater());
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        return this.sourceStream.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] b) throws IOException {
        return this.sourceStream.read(b);
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        return this.sourceStream.read(b, off, len);
    }

    @Override // java.io.InputStream
    public long skip(long n) throws IOException {
        return this.sourceStream.skip(n);
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.sourceStream.available();
    }

    @Override // java.io.InputStream
    public void mark(int readLimit) {
        this.sourceStream.mark(readLimit);
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        this.sourceStream.reset();
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.sourceStream.markSupported();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.sourceStream.close();
    }

    static class DeflateStream extends InflaterInputStream {
        private boolean closed;

        public DeflateStream(InputStream in, Inflater inflater) {
            super(in, inflater);
            this.closed = false;
        }

        @Override // java.util.zip.InflaterInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (!this.closed) {
                this.closed = true;
                this.inf.end();
                super.close();
            }
        }
    }
}
