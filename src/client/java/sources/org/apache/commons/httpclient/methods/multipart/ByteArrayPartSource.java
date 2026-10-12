package org.apache.commons.httpclient.methods.multipart;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ByteArrayPartSource implements PartSource {
    private byte[] bytes;
    private String fileName;

    public ByteArrayPartSource(String fileName, byte[] bytes) {
        this.fileName = fileName;
        this.bytes = bytes;
    }

    @Override // org.apache.commons.httpclient.methods.multipart.PartSource
    public long getLength() {
        return this.bytes.length;
    }

    @Override // org.apache.commons.httpclient.methods.multipart.PartSource
    public String getFileName() {
        return this.fileName;
    }

    @Override // org.apache.commons.httpclient.methods.multipart.PartSource
    public InputStream createInputStream() throws IOException {
        return new ByteArrayInputStream(this.bytes);
    }
}
