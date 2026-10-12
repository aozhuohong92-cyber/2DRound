package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.util.Locale;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class HttpResponseProxy implements CloseableHttpResponse {
    private final ConnectionHolder connHolder;
    private final HttpResponse original;

    public HttpResponseProxy(HttpResponse original, ConnectionHolder connHolder) {
        this.original = original;
        this.connHolder = connHolder;
        ResponseEntityProxy.enchance(original, connHolder);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.connHolder != null) {
            this.connHolder.abortConnection();
        }
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public StatusLine getStatusLine() {
        return this.original.getStatusLine();
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(StatusLine statusline) {
        this.original.setStatusLine(statusline);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code) {
        this.original.setStatusLine(ver, code);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusLine(ProtocolVersion ver, int code, String reason) {
        this.original.setStatusLine(ver, code, reason);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setStatusCode(int code) throws IllegalStateException {
        this.original.setStatusCode(code);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setReasonPhrase(String reason) throws IllegalStateException {
        this.original.setReasonPhrase(reason);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public HttpEntity getEntity() {
        return this.original.getEntity();
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setEntity(HttpEntity entity) {
        this.original.setEntity(entity);
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public Locale getLocale() {
        return this.original.getLocale();
    }

    @Override // cz.msebera.android.httpclient.HttpResponse
    public void setLocale(Locale loc) {
        this.original.setLocale(loc);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return this.original.getProtocolVersion();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public boolean containsHeader(String name) {
        return this.original.containsHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header[] getHeaders(String name) {
        return this.original.getHeaders(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header getFirstHeader(String name) {
        return this.original.getFirstHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header getLastHeader(String name) {
        return this.original.getLastHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header[] getAllHeaders() {
        return this.original.getAllHeaders();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void addHeader(Header header) {
        this.original.addHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void addHeader(String name, String value) {
        this.original.addHeader(name, value);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeader(Header header) {
        this.original.setHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeader(String name, String value) {
        this.original.setHeader(name, value);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeaders(Header[] headers) {
        this.original.setHeaders(headers);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void removeHeader(Header header) {
        this.original.removeHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void removeHeaders(String name) {
        this.original.removeHeaders(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator() {
        return this.original.headerIterator();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator(String name) {
        return this.original.headerIterator(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    @Deprecated
    public HttpParams getParams() {
        return this.original.getParams();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    @Deprecated
    public void setParams(HttpParams params) {
        this.original.setParams(params);
    }

    public String toString() {
        return "HttpResponseProxy{" + this.original + '}';
    }
}
