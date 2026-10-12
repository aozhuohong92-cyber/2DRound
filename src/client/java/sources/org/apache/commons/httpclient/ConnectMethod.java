package org.apache.commons.httpclient;

import java.io.IOException;
import org.apache.commons.httpclient.cookie.CookieSpec;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ConnectMethod extends HttpMethodBase {
    private static final Log LOG;
    public static final String NAME = "CONNECT";
    static Class class$org$apache$commons$httpclient$ConnectMethod;
    private final HostConfiguration targethost;

    public ConnectMethod() {
        this.targethost = null;
    }

    public ConnectMethod(HttpMethod method) {
        this.targethost = null;
    }

    public ConnectMethod(HostConfiguration targethost) {
        if (targethost == null) {
            throw new IllegalArgumentException("Target host may not be null");
        }
        this.targethost = targethost;
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public String getName() {
        return NAME;
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public String getPath() {
        if (this.targethost == null) {
            return CookieSpec.PATH_DELIM;
        }
        StringBuffer buffer = new StringBuffer();
        buffer.append(this.targethost.getHost());
        int port = this.targethost.getPort();
        if (port == -1) {
            port = this.targethost.getProtocol().getDefaultPort();
        }
        buffer.append(':');
        buffer.append(port);
        return buffer.toString();
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public URI getURI() throws URIException {
        String charset = getParams().getUriCharset();
        return new URI(getPath(), true, charset);
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase
    protected void addCookieRequestHeader(HttpState state, HttpConnection conn) throws IOException {
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase
    protected void addRequestHeaders(HttpState state, HttpConnection conn) throws IOException {
        LOG.trace("enter ConnectMethod.addRequestHeaders(HttpState, HttpConnection)");
        addUserAgentRequestHeader(state, conn);
        addHostRequestHeader(state, conn);
        addProxyConnectionHeader(state, conn);
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public int execute(HttpState state, HttpConnection conn) throws IllegalStateException, IOException, IllegalArgumentException {
        LOG.trace("enter ConnectMethod.execute(HttpState, HttpConnection)");
        int code = super.execute(state, conn);
        if (LOG.isDebugEnabled()) {
            LOG.debug(new StringBuffer().append("CONNECT status code ").append(code).toString());
        }
        return code;
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase
    protected void writeRequestLine(HttpState state, HttpConnection conn) throws IllegalStateException, IOException {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getName());
        buffer.append(' ');
        if (this.targethost != null) {
            buffer.append(getPath());
        } else {
            int port = conn.getPort();
            if (port == -1) {
                port = conn.getProtocol().getDefaultPort();
            }
            buffer.append(conn.getHost());
            buffer.append(':');
            buffer.append(port);
        }
        buffer.append(" ");
        buffer.append(getEffectiveVersion());
        String line = buffer.toString();
        conn.printLine(line, getParams().getHttpElementCharset());
        if (Wire.HEADER_WIRE.enabled()) {
            Wire.HEADER_WIRE.output(line);
        }
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase
    protected boolean shouldCloseConnection(HttpConnection conn) {
        if (getStatusCode() != 200) {
            return super.shouldCloseConnection(conn);
        }
        Header connectionHeader = null;
        if (!conn.isTransparent()) {
            connectionHeader = getResponseHeader("proxy-connection");
        }
        if (connectionHeader == null) {
            connectionHeader = getResponseHeader("connection");
        }
        if (connectionHeader != null && connectionHeader.getValue().equalsIgnoreCase("close") && LOG.isWarnEnabled()) {
            LOG.warn(new StringBuffer().append("Invalid header encountered '").append(connectionHeader.toExternalForm()).append("' in response ").append(getStatusLine().toString()).toString());
        }
        return false;
    }

    static {
        Class clsClass$;
        if (class$org$apache$commons$httpclient$ConnectMethod == null) {
            clsClass$ = class$("org.apache.commons.httpclient.ConnectMethod");
            class$org$apache$commons$httpclient$ConnectMethod = clsClass$;
        } else {
            clsClass$ = class$org$apache$commons$httpclient$ConnectMethod;
        }
        LOG = LogFactory.getLog(clsClass$);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
