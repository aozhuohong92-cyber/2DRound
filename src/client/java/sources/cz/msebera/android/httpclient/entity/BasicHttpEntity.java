package cz.msebera.android.httpclient.entity;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.impl.io.EmptyInputStream;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHttpEntity extends AbstractHttpEntity {
    private InputStream content;
    private long length = -1;

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.length;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IllegalStateException {
        Asserts.check(this.content != null, "Content has not been provided");
        return this.content;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return false;
    }

    public void setContentLength(long len) {
        this.length = len;
    }

    public void setContent(InputStream instream) {
        this.content = instream;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IllegalStateException, IOException {
        Args.notNull(outstream, "Output stream");
        InputStream instream = getContent();
        try {
            byte[] tmp = new byte[4096];
            while (true) {
                int l = instream.read(tmp);
                if (l != -1) {
                    outstream.write(tmp, 0, l);
                } else {
                    return;
                }
            }
        } finally {
            instream.close();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return (this.content == null || this.content == EmptyInputStream.INSTANCE) ? false : true;
    }
}
