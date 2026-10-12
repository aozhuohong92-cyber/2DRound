package cz.msebera.android.httpclient.entity.mime;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.List;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class HttpBrowserCompatibleMultipart extends AbstractMultipartForm {
    private final List<FormBodyPart> parts;

    public HttpBrowserCompatibleMultipart(Charset charset, String boundary, List<FormBodyPart> parts) {
        super(charset, boundary);
        this.parts = parts;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.AbstractMultipartForm
    public List<FormBodyPart> getBodyParts() {
        return this.parts;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.AbstractMultipartForm
    protected void formatMultipartHeader(FormBodyPart part, OutputStream out) throws IOException {
        Header header = part.getHeader();
        MinimalField cd = header.getField("Content-Disposition");
        writeField(cd, this.charset, out);
        String filename = part.getBody().getFilename();
        if (filename != null) {
            MinimalField ct = header.getField("Content-Type");
            writeField(ct, this.charset, out);
        }
    }
}
