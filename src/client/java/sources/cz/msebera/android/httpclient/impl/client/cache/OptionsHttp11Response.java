package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.message.AbstractHttpMessage;
import cz.msebera.android.httpclient.message.BasicStatusLine;
import cz.msebera.android.httpclient.params.BasicHttpParams;
import cz.msebera.android.httpclient.params.HttpParams;
import java.util.Locale;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class OptionsHttp11Response extends AbstractHttpMessage implements HttpResponse {
    private final StatusLine statusLine = new BasicStatusLine(HttpVersion.HTTP_1_1, 501, "");
    private final ProtocolVersion version = HttpVersion.HTTP_1_1;

    OptionsHttp11Response() {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public StatusLine getStatusLine() {
        return this.statusLine;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(StatusLine statusline) {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code) {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code, String reason) {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusCode(int code) throws IllegalStateException {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setReasonPhrase(String reason) throws IllegalStateException {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public HttpEntity getEntity() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setEntity(HttpEntity entity) {
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public Locale getLocale() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setLocale(Locale loc) {
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return this.version;
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public boolean containsHeader(String name) {
        return this.headergroup.containsHeader(name);
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public Header[] getHeaders(String name) {
        return this.headergroup.getHeaders(name);
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public Header getFirstHeader(String name) {
        return this.headergroup.getFirstHeader(name);
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public Header getLastHeader(String name) {
        return this.headergroup.getLastHeader(name);
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public Header[] getAllHeaders() {
        return this.headergroup.getAllHeaders();
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void addHeader(Header header) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void addHeader(String name, String value) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void setHeader(Header header) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void setHeader(String name, String value) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void setHeaders(Header[] headers) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void removeHeader(Header header) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void removeHeaders(String name) {
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator() {
        return this.headergroup.iterator();
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator(String name) {
        return this.headergroup.iterator(name);
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public HttpParams getParams() {
        if (this.params == null) {
            this.params = new BasicHttpParams();
        }
        return this.params;
    }

    @Override // cz.msebera.android.httpclient.message.AbstractHttpMessage, cz.msebera.android.httpclient.HttpMessage
    public void setParams(HttpParams params) {
    }
}
