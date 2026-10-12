package cz.msebera.android.httpclient.entity.mime;

import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.entity.mime.content.AbstractContentBody;
import cz.msebera.android.httpclient.entity.mime.content.ContentBody;
import cz.msebera.android.httpclient.util.Args;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FormBodyPart {
    private final ContentBody body;
    private final Header header;
    private final String name;

    FormBodyPart(String name, ContentBody body, Header header) {
        Args.notNull(name, "Name");
        Args.notNull(body, "Body");
        this.name = name;
        this.body = body;
        this.header = header == null ? new Header() : header;
    }

    @Deprecated
    public FormBodyPart(String name, ContentBody body) {
        Args.notNull(name, "Name");
        Args.notNull(body, "Body");
        this.name = name;
        this.body = body;
        this.header = new Header();
        generateContentDisp(body);
        generateContentType(body);
        generateTransferEncoding(body);
    }

    public String getName() {
        return this.name;
    }

    public ContentBody getBody() {
        return this.body;
    }

    public Header getHeader() {
        return this.header;
    }

    public void addField(String name, String value) {
        Args.notNull(name, "Field name");
        this.header.addField(new MinimalField(name, value));
    }

    @Deprecated
    protected void generateContentDisp(ContentBody body) {
        StringBuilder buffer = new StringBuilder();
        buffer.append("form-data; name=\"");
        buffer.append(getName());
        buffer.append("\"");
        if (body.getFilename() != null) {
            buffer.append("; filename=\"");
            buffer.append(body.getFilename());
            buffer.append("\"");
        }
        addField("Content-Disposition", buffer.toString());
    }

    @Deprecated
    protected void generateContentType(ContentBody body) {
        ContentType contentType;
        if (body instanceof AbstractContentBody) {
            contentType = ((AbstractContentBody) body).getContentType();
        } else {
            contentType = null;
        }
        if (contentType != null) {
            addField("Content-Type", contentType.toString());
            return;
        }
        StringBuilder buffer = new StringBuilder();
        buffer.append(body.getMimeType());
        if (body.getCharset() != null) {
            buffer.append("; charset=");
            buffer.append(body.getCharset());
        }
        addField("Content-Type", buffer.toString());
    }

    @Deprecated
    protected void generateTransferEncoding(ContentBody body) {
        addField(MIME.CONTENT_TRANSFER_ENC, body.getTransferEncoding());
    }
}
