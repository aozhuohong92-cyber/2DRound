package org.apache.commons.httpclient.methods;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ByteArrayRequestEntity implements RequestEntity {
    private byte[] content;
    private String contentType;

    public ByteArrayRequestEntity(byte[] content) {
        this(content, null);
    }

    public ByteArrayRequestEntity(byte[] content, String contentType) {
        if (content == null) {
            throw new IllegalArgumentException("The content cannot be null");
        }
        this.content = content;
        this.contentType = contentType;
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public String getContentType() {
        return this.contentType;
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public void writeRequest(OutputStream out) throws IOException {
        out.write(this.content);
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public long getContentLength() {
        return this.content.length;
    }

    public byte[] getContent() {
        return this.content;
    }
}
