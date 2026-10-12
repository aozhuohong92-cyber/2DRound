package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.TokenIterator;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.message.BasicHeaderIterator;
import cz.msebera.android.httpclient.message.BasicTokenIterator;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultConnectionReuseStrategy implements ConnectionReuseStrategy {
    public static final DefaultConnectionReuseStrategy INSTANCE = new DefaultConnectionReuseStrategy();

    @Override // cz.msebera.android.httpclient.ConnectionReuseStrategy
    public boolean keepAlive(HttpResponse response, HttpContext context) throws NumberFormatException {
        Args.notNull(response, "HTTP response");
        Args.notNull(context, "HTTP context");
        ProtocolVersion ver = response.getStatusLine().getProtocolVersion();
        Header teh = response.getFirstHeader("Transfer-Encoding");
        if (teh != null) {
            if (!"chunked".equalsIgnoreCase(teh.getValue())) {
                return false;
            }
        } else if (canResponseHaveBody(response)) {
            Header[] clhs = response.getHeaders("Content-Length");
            if (clhs.length == 1) {
                Header clh = clhs[0];
                try {
                    int contentLen = Integer.parseInt(clh.getValue());
                    if (contentLen < 0) {
                        return false;
                    }
                } catch (NumberFormatException e) {
                    return false;
                }
            } else {
                return false;
            }
        }
        Header[] connHeaders = response.getHeaders("Connection");
        if (connHeaders.length == 0) {
            connHeaders = response.getHeaders("Proxy-Connection");
        }
        if (connHeaders.length != 0) {
            try {
                TokenIterator ti = new BasicTokenIterator(new BasicHeaderIterator(connHeaders, null));
                boolean keepalive = false;
                while (ti.hasNext()) {
                    String token = ti.nextToken();
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
            } catch (ParseException e2) {
                return false;
            }
        }
        return !ver.lessEquals(HttpVersion.HTTP_1_0);
    }

    protected TokenIterator createTokenIterator(HeaderIterator hit) {
        return new BasicTokenIterator(hit);
    }

    private boolean canResponseHaveBody(HttpResponse response) {
        int status = response.getStatusLine().getStatusCode();
        return (status < 200 || status == 204 || status == 304 || status == 205) ? false : true;
    }
}
