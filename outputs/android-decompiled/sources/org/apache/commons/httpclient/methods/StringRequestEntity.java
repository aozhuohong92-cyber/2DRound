package org.apache.commons.httpclient.methods;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import org.apache.commons.httpclient.HeaderElement;
import org.apache.commons.httpclient.NameValuePair;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class StringRequestEntity implements RequestEntity {
    private String charset;
    private byte[] content;
    private String contentType;

    public StringRequestEntity(String content) {
        if (content == null) {
            throw new IllegalArgumentException("The content cannot be null");
        }
        this.contentType = null;
        this.charset = null;
        this.content = content.getBytes();
    }

    public StringRequestEntity(String content, String contentType, String charset) throws UnsupportedEncodingException {
        if (content == null) {
            throw new IllegalArgumentException("The content cannot be null");
        }
        this.contentType = contentType;
        this.charset = charset;
        if (contentType != null) {
            HeaderElement[] values = HeaderElement.parseElements(contentType);
            NameValuePair charsetPair = null;
            for (int i = 0; i < values.length && (charsetPair = values[i].getParameterByName("charset")) == null; i++) {
            }
            if (charset == null && charsetPair != null) {
                this.charset = charsetPair.getValue();
            } else if (charset != null && charsetPair == null) {
                this.contentType = new StringBuffer().append(contentType).append("; charset=").append(charset).toString();
            }
        }
        if (this.charset != null) {
            this.content = content.getBytes(this.charset);
        } else {
            this.content = content.getBytes();
        }
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public String getContentType() {
        return this.contentType;
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public void writeRequest(OutputStream out) throws IOException {
        if (out == null) {
            throw new IllegalArgumentException("Output stream may not be null");
        }
        out.write(this.content);
        out.flush();
    }

    @Override // org.apache.commons.httpclient.methods.RequestEntity
    public long getContentLength() {
        return this.content.length;
    }

    public String getContent() {
        if (this.charset != null) {
            try {
                return new String(this.content, this.charset);
            } catch (UnsupportedEncodingException e) {
                return new String(this.content);
            }
        }
        return new String(this.content);
    }

    public String getCharset() {
        return this.charset;
    }
}
