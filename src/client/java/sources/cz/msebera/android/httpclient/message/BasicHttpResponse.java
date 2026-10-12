package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.ReasonPhraseCatalog;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.util.Locale;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHttpResponse extends AbstractHttpMessage implements HttpResponse {
    private int code;
    private HttpEntity entity;
    private Locale locale;
    private final ReasonPhraseCatalog reasonCatalog;
    private String reasonPhrase;
    private StatusLine statusline;
    private ProtocolVersion ver;

    public BasicHttpResponse(StatusLine statusline, ReasonPhraseCatalog catalog, Locale locale) {
        this.statusline = (StatusLine) Args.notNull(statusline, "Status line");
        this.ver = statusline.getProtocolVersion();
        this.code = statusline.getStatusCode();
        this.reasonPhrase = statusline.getReasonPhrase();
        this.reasonCatalog = catalog;
        this.locale = locale;
    }

    public BasicHttpResponse(StatusLine statusline) {
        this.statusline = (StatusLine) Args.notNull(statusline, "Status line");
        this.ver = statusline.getProtocolVersion();
        this.code = statusline.getStatusCode();
        this.reasonPhrase = statusline.getReasonPhrase();
        this.reasonCatalog = null;
        this.locale = null;
    }

    public BasicHttpResponse(ProtocolVersion ver, int code, String reason) {
        Args.notNegative(code, "Status code");
        this.statusline = null;
        this.ver = ver;
        this.code = code;
        this.reasonPhrase = reason;
        this.reasonCatalog = null;
        this.locale = null;
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return this.ver;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public StatusLine getStatusLine() {
        if (this.statusline == null) {
            this.statusline = new BasicStatusLine(this.ver != null ? this.ver : HttpVersion.HTTP_1_1, this.code, this.reasonPhrase != null ? this.reasonPhrase : getReason(this.code));
        }
        return this.statusline;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public HttpEntity getEntity() {
        return this.entity;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public Locale getLocale() {
        return this.locale;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(StatusLine statusline) {
        this.statusline = (StatusLine) Args.notNull(statusline, "Status line");
        this.ver = statusline.getProtocolVersion();
        this.code = statusline.getStatusCode();
        this.reasonPhrase = statusline.getReasonPhrase();
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code) {
        Args.notNegative(code, "Status code");
        this.statusline = null;
        this.ver = ver;
        this.code = code;
        this.reasonPhrase = null;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code, String reason) {
        Args.notNegative(code, "Status code");
        this.statusline = null;
        this.ver = ver;
        this.code = code;
        this.reasonPhrase = reason;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusCode(int code) {
        Args.notNegative(code, "Status code");
        this.statusline = null;
        this.code = code;
        this.reasonPhrase = null;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setReasonPhrase(String reason) {
        this.statusline = null;
        this.reasonPhrase = reason;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setEntity(HttpEntity entity) {
        this.entity = entity;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setLocale(Locale locale) {
        this.locale = (Locale) Args.notNull(locale, "Locale");
        this.statusline = null;
    }

    protected String getReason(int code) {
        if (this.reasonCatalog != null) {
            return this.reasonCatalog.getReason(code, this.locale != null ? this.locale : Locale.getDefault());
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getStatusLine());
        sb.append(' ');
        sb.append(this.headergroup);
        if (this.entity != null) {
            sb.append(' ');
            sb.append(this.entity);
        }
        return sb.toString();
    }
}
