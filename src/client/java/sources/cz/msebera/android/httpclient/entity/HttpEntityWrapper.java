package cz.msebera.android.httpclient.entity;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpEntityWrapper implements HttpEntity {
    protected HttpEntity wrappedEntity;

    public HttpEntityWrapper(HttpEntity wrappedEntity) {
        this.wrappedEntity = (HttpEntity) Args.notNull(wrappedEntity, "Wrapped entity");
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return this.wrappedEntity.isRepeatable();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isChunked() {
        return this.wrappedEntity.isChunked();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.wrappedEntity.getContentLength();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentType() {
        return this.wrappedEntity.getContentType();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentEncoding() {
        return this.wrappedEntity.getContentEncoding();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        return this.wrappedEntity.getContent();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        this.wrappedEntity.writeTo(outstream);
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return this.wrappedEntity.isStreaming();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    @Deprecated
    public void consumeContent() throws IOException {
        this.wrappedEntity.consumeContent();
    }
}
