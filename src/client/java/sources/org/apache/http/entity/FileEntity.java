package org.apache.http.entity;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.util.Args;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FileEntity extends AbstractHttpEntity implements Cloneable {
    protected final File file;

    @Deprecated
    public FileEntity(File file, String contentType) {
        this.file = (File) Args.notNull(file, "File");
        setContentType(contentType);
    }

    public FileEntity(File file, ContentType contentType) {
        this.file = (File) Args.notNull(file, "File");
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public FileEntity(File file) {
        this.file = (File) Args.notNull(file, "File");
    }

    @Override // org.apache.http.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.http.HttpEntity
    public long getContentLength() {
        return this.file.length();
    }

    @Override // org.apache.http.HttpEntity
    public InputStream getContent() throws IOException {
        return new FileInputStream(this.file);
    }

    @Override // org.apache.http.HttpEntity
    public void writeTo(OutputStream outStream) throws IOException {
        Args.notNull(outStream, "Output stream");
        InputStream inStream = new FileInputStream(this.file);
        try {
            byte[] tmp = new byte[4096];
            while (true) {
                int l = inStream.read(tmp);
                if (l != -1) {
                    outStream.write(tmp, 0, l);
                } else {
                    outStream.flush();
                    return;
                }
            }
        } finally {
            inStream.close();
        }
    }

    @Override // org.apache.http.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
