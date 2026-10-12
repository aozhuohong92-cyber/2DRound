package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.params.BasicHttpParams;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractHttpMessage implements HttpMessage {
    protected HeaderGroup headergroup;

    @Deprecated
    protected HttpParams params;

    @Deprecated
    protected AbstractHttpMessage(HttpParams params) {
        this.headergroup = new HeaderGroup();
        this.params = params;
    }

    protected AbstractHttpMessage() {
        this(null);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public boolean containsHeader(String name) {
        return this.headergroup.containsHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header[] getHeaders(String name) {
        return this.headergroup.getHeaders(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header getFirstHeader(String name) {
        return this.headergroup.getFirstHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header getLastHeader(String name) {
        return this.headergroup.getLastHeader(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public Header[] getAllHeaders() {
        return this.headergroup.getAllHeaders();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void addHeader(Header header) {
        this.headergroup.addHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void addHeader(String name, String value) {
        Args.notNull(name, "Header name");
        this.headergroup.addHeader(new BasicHeader(name, value));
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeader(Header header) {
        this.headergroup.updateHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeader(String name, String value) {
        Args.notNull(name, "Header name");
        this.headergroup.updateHeader(new BasicHeader(name, value));
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void setHeaders(Header[] headers) {
        this.headergroup.setHeaders(headers);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void removeHeader(Header header) {
        this.headergroup.removeHeader(header);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public void removeHeaders(String name) {
        if (name != null) {
            HeaderIterator i = this.headergroup.iterator();
            while (i.hasNext()) {
                Header header = i.nextHeader();
                if (name.equalsIgnoreCase(header.getName())) {
                    i.remove();
                }
            }
        }
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator() {
        return this.headergroup.iterator();
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public HeaderIterator headerIterator(String name) {
        return this.headergroup.iterator(name);
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    @Deprecated
    public HttpParams getParams() {
        if (this.params == null) {
            this.params = new BasicHttpParams();
        }
        return this.params;
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    @Deprecated
    public void setParams(HttpParams params) {
        this.params = (HttpParams) Args.notNull(params, "HTTP parameters");
    }
}
