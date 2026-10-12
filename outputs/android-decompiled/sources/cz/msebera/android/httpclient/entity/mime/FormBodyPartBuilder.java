package cz.msebera.android.httpclient.entity.mime;

import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.entity.mime.content.AbstractContentBody;
import cz.msebera.android.httpclient.entity.mime.content.ContentBody;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.util.List;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FormBodyPartBuilder {
    private ContentBody body;
    private final Header header;
    private String name;

    public static FormBodyPartBuilder create(String name, ContentBody body) {
        return new FormBodyPartBuilder(name, body);
    }

    public static FormBodyPartBuilder create() {
        return new FormBodyPartBuilder();
    }

    FormBodyPartBuilder(String name, ContentBody body) {
        this();
        this.name = name;
        this.body = body;
    }

    FormBodyPartBuilder() {
        this.header = new Header();
    }

    public FormBodyPartBuilder setName(String name) {
        this.name = name;
        return this;
    }

    public FormBodyPartBuilder setBody(ContentBody body) {
        this.body = body;
        return this;
    }

    public FormBodyPartBuilder addField(String name, String value) {
        Args.notNull(name, "Field name");
        this.header.addField(new MinimalField(name, value));
        return this;
    }

    public FormBodyPartBuilder setField(String name, String value) {
        Args.notNull(name, "Field name");
        this.header.setField(new MinimalField(name, value));
        return this;
    }

    public FormBodyPartBuilder removeFields(String name) {
        Args.notNull(name, "Field name");
        this.header.removeFields(name);
        return this;
    }

    public FormBodyPart build() {
        ContentType contentType;
        Asserts.notBlank(this.name, "Name");
        Asserts.notNull(this.body, "Content body");
        Header headerCopy = new Header();
        List<MinimalField> fields = this.header.getFields();
        for (MinimalField field : fields) {
            headerCopy.addField(field);
        }
        if (headerCopy.getField("Content-Disposition") == null) {
            StringBuilder buffer = new StringBuilder();
            buffer.append("form-data; name=\"");
            buffer.append(this.name);
            buffer.append("\"");
            if (this.body.getFilename() != null) {
                buffer.append("; filename=\"");
                buffer.append(this.body.getFilename());
                buffer.append("\"");
            }
            headerCopy.addField(new MinimalField("Content-Disposition", buffer.toString()));
        }
        if (headerCopy.getField("Content-Type") == null) {
            if (this.body instanceof AbstractContentBody) {
                contentType = ((AbstractContentBody) this.body).getContentType();
            } else {
                contentType = null;
            }
            if (contentType != null) {
                headerCopy.addField(new MinimalField("Content-Type", contentType.toString()));
            } else {
                StringBuilder buffer2 = new StringBuilder();
                buffer2.append(this.body.getMimeType());
                if (this.body.getCharset() != null) {
                    buffer2.append("; charset=");
                    buffer2.append(this.body.getCharset());
                }
                headerCopy.addField(new MinimalField("Content-Type", buffer2.toString()));
            }
        }
        if (headerCopy.getField(MIME.CONTENT_TRANSFER_ENC) == null) {
            headerCopy.addField(new MinimalField(MIME.CONTENT_TRANSFER_ENC, this.body.getTransferEncoding()));
        }
        return new FormBodyPart(this.name, this.body, headerCopy);
    }
}
