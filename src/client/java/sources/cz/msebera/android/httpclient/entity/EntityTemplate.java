package cz.msebera.android.httpclient.entity;

import cz.msebera.android.httpclient.util.Args;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class EntityTemplate extends AbstractHttpEntity {
    private final ContentProducer contentproducer;

    public EntityTemplate(ContentProducer contentproducer) {
        this.contentproducer = (ContentProducer) Args.notNull(contentproducer, "Content producer");
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return -1L;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        writeTo(buf);
        return new ByteArrayInputStream(buf.toByteArray());
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        Args.notNull(outstream, "Output stream");
        this.contentproducer.writeTo(outstream);
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return false;
    }
}
