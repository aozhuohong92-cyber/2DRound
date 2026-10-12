package cz.msebera.android.httpclient.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import cz.msebera.android.httpclient.message.HeaderGroup;
import cz.msebera.android.httpclient.util.Args;
import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpCacheEntry implements Serializable {
    private static final String REQUEST_METHOD_HEADER_NAME = "Hc-Request-Method";
    private static final long serialVersionUID = -6300496422359477413L;
    private final Date date;
    private final Date requestDate;
    private final Resource resource;
    private final Date responseDate;
    private final HeaderGroup responseHeaders;
    private final StatusLine statusLine;
    private final Map<String, String> variantMap;

    public HttpCacheEntry(Date requestDate, Date responseDate, StatusLine statusLine, Header[] responseHeaders, Resource resource, Map<String, String> variantMap, String requestMethod) {
        Args.notNull(requestDate, "Request date");
        Args.notNull(responseDate, "Response date");
        Args.notNull(statusLine, "Status line");
        Args.notNull(responseHeaders, "Response headers");
        this.requestDate = requestDate;
        this.responseDate = responseDate;
        this.statusLine = statusLine;
        this.responseHeaders = new HeaderGroup();
        this.responseHeaders.setHeaders(responseHeaders);
        this.resource = resource;
        this.variantMap = variantMap != null ? new HashMap(variantMap) : null;
        this.date = parseDate();
    }

    public HttpCacheEntry(Date requestDate, Date responseDate, StatusLine statusLine, Header[] responseHeaders, Resource resource, Map<String, String> variantMap) {
        this(requestDate, responseDate, statusLine, responseHeaders, resource, variantMap, null);
    }

    public HttpCacheEntry(Date requestDate, Date responseDate, StatusLine statusLine, Header[] responseHeaders, Resource resource) {
        this(requestDate, responseDate, statusLine, responseHeaders, resource, new HashMap());
    }

    public HttpCacheEntry(Date requestDate, Date responseDate, StatusLine statusLine, Header[] responseHeaders, Resource resource, String requestMethod) {
        this(requestDate, responseDate, statusLine, responseHeaders, resource, new HashMap(), requestMethod);
    }

    private Date parseDate() {
        Header dateHdr = getFirstHeader("Date");
        if (dateHdr == null) {
            return null;
        }
        return DateUtils.parseDate(dateHdr.getValue());
    }

    public StatusLine getStatusLine() {
        return this.statusLine;
    }

    public ProtocolVersion getProtocolVersion() {
        return this.statusLine.getProtocolVersion();
    }

    public String getReasonPhrase() {
        return this.statusLine.getReasonPhrase();
    }

    public int getStatusCode() {
        return this.statusLine.getStatusCode();
    }

    public Date getRequestDate() {
        return this.requestDate;
    }

    public Date getResponseDate() {
        return this.responseDate;
    }

    public Header[] getAllHeaders() {
        HeaderGroup filteredHeaders = new HeaderGroup();
        HeaderIterator iterator = this.responseHeaders.iterator();
        while (iterator.hasNext()) {
            Header header = (Header) iterator.next();
            if (!REQUEST_METHOD_HEADER_NAME.equals(header.getName())) {
                filteredHeaders.addHeader(header);
            }
        }
        return filteredHeaders.getAllHeaders();
    }

    public Header getFirstHeader(String name) {
        if (REQUEST_METHOD_HEADER_NAME.equalsIgnoreCase(name)) {
            return null;
        }
        return this.responseHeaders.getFirstHeader(name);
    }

    public Header[] getHeaders(String name) {
        return REQUEST_METHOD_HEADER_NAME.equalsIgnoreCase(name) ? new Header[0] : this.responseHeaders.getHeaders(name);
    }

    public Date getDate() {
        return this.date;
    }

    public Resource getResource() {
        return this.resource;
    }

    public boolean hasVariants() {
        return getFirstHeader("Vary") != null;
    }

    public Map<String, String> getVariantMap() {
        return Collections.unmodifiableMap(this.variantMap);
    }

    public String getRequestMethod() {
        Header requestMethodHeader = this.responseHeaders.getFirstHeader(REQUEST_METHOD_HEADER_NAME);
        return requestMethodHeader != null ? requestMethodHeader.getValue() : "GET";
    }

    public String toString() {
        return "[request date=" + this.requestDate + "; response date=" + this.responseDate + "; statusLine=" + this.statusLine + "]";
    }
}
