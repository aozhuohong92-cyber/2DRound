package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CacheEntity implements HttpEntity, Serializable {
    private static final long serialVersionUID = -3467082284120936233L;
    private final HttpCacheEntry cacheEntry;

    public CacheEntity(HttpCacheEntry cacheEntry) {
        this.cacheEntry = cacheEntry;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentType() {
        return this.cacheEntry.getFirstHeader("Content-Type");
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentEncoding() {
        return this.cacheEntry.getFirstHeader("Content-Encoding");
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isChunked() {
        return false;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.cacheEntry.getResource().length();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        return this.cacheEntry.getResource().getInputStream();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        Args.notNull(outstream, "Output stream");
        InputStream instream = this.cacheEntry.getResource().getInputStream();
        try {
            IOUtils.copy(instream, outstream);
        } finally {
            instream.close();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void consumeContent() throws IOException {
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
