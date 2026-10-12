package org.apache.http.impl;

import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.ParseException;
import org.apache.http.ProtocolVersion;
import org.apache.http.TokenIterator;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.message.BasicTokenIterator;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Contract(threading = ThreadingBehavior.IMMUTABLE)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultConnectionReuseStrategy implements ConnectionReuseStrategy {
    public static final DefaultConnectionReuseStrategy INSTANCE = new DefaultConnectionReuseStrategy();

    @Override // org.apache.http.ConnectionReuseStrategy
    public boolean keepAlive(HttpResponse response, HttpContext context) throws NumberFormatException {
        Args.notNull(response, "HTTP response");
        Args.notNull(context, "HTTP context");
        if (response.getStatusLine().getStatusCode() == 204) {
            Header clh = response.getFirstHeader("Content-Length");
            if (clh != null) {
                try {
                    int contentLen = Integer.parseInt(clh.getValue());
                    if (contentLen > 0) {
                        return false;
                    }
                } catch (NumberFormatException e) {
                }
            }
            if (response.getFirstHeader("Transfer-Encoding") != null) {
                return false;
            }
        }
        HttpRequest request = (HttpRequest) context.getAttribute("http.request");
        if (request != null) {
            try {
                TokenIterator ti = new BasicTokenIterator(request.headerIterator("Connection"));
                while (ti.hasNext()) {
                    if ("Close".equalsIgnoreCase(ti.nextToken())) {
                        return false;
                    }
                }
            } catch (ParseException e2) {
                return false;
            }
        }
        ProtocolVersion ver = response.getStatusLine().getProtocolVersion();
        Header teh = response.getFirstHeader("Transfer-Encoding");
        if (teh != null) {
            if (!"chunked".equalsIgnoreCase(teh.getValue())) {
                return false;
            }
        } else if (canResponseHaveBody(request, response)) {
            Header[] clhs = response.getHeaders("Content-Length");
            if (clhs.length == 1) {
                try {
                    int contentLen2 = Integer.parseInt(clhs[0].getValue());
                    if (contentLen2 < 0) {
                        return false;
                    }
                } catch (NumberFormatException e3) {
                    return false;
                }
            } else {
                return false;
            }
        }
        HeaderIterator headerIterator = response.headerIterator("Connection");
        if (!headerIterator.hasNext()) {
            headerIterator = response.headerIterator("Proxy-Connection");
        }
        if (headerIterator.hasNext()) {
            try {
                TokenIterator ti2 = new BasicTokenIterator(headerIterator);
                boolean keepalive = false;
                while (ti2.hasNext()) {
                    String token = ti2.nextToken();
                    if ("Close".equalsIgnoreCase(token)) {
                        return false;
                    }
                    if ("Keep-Alive".equalsIgnoreCase(token)) {
                        keepalive = true;
                    }
                }
                if (keepalive) {
                    return true;
                }
            } catch (ParseException e4) {
                return false;
            }
        }
        return !ver.lessEquals(HttpVersion.HTTP_1_0);
    }

    protected TokenIterator createTokenIterator(HeaderIterator hit) {
        return new BasicTokenIterator(hit);
    }

    private boolean canResponseHaveBody(HttpRequest request, HttpResponse response) {
        int status;
        return ((request != null && request.getRequestLine().getMethod().equalsIgnoreCase("HEAD")) || (status = response.getStatusLine().getStatusCode()) < 200 || status == 204 || status == 304 || status == 205) ? false : true;
    }
}
