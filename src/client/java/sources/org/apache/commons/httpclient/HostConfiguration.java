package org.apache.commons.httpclient;

import java.net.InetAddress;
import org.apache.commons.httpclient.params.HostParams;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.commons.httpclient.util.LangUtils;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HostConfiguration implements Cloneable {
    public static final HostConfiguration ANY_HOST_CONFIGURATION = new HostConfiguration();
    private HttpHost host = null;
    private ProxyHost proxyHost = null;
    private InetAddress localAddress = null;
    private HostParams params = new HostParams();

    public HostConfiguration() {
    }

    public HostConfiguration(HostConfiguration hostConfiguration) {
        init(hostConfiguration);
    }

    private void init(HostConfiguration hostConfiguration) {
        synchronized (hostConfiguration) {
            try {
                if (hostConfiguration.host != null) {
                    this.host = (HttpHost) hostConfiguration.host.clone();
                } else {
                    this.host = null;
                }
                if (hostConfiguration.proxyHost != null) {
                    this.proxyHost = (ProxyHost) hostConfiguration.proxyHost.clone();
                } else {
                    this.proxyHost = null;
                }
                this.localAddress = hostConfiguration.getLocalAddress();
                this.params = (HostParams) hostConfiguration.getParams().clone();
            } catch (CloneNotSupportedException e) {
                throw new IllegalArgumentException("Host configuration could not be cloned");
            }
        }
    }

    public Object clone() {
        try {
            HostConfiguration copy = (HostConfiguration) super.clone();
            copy.init(this);
            return copy;
        } catch (CloneNotSupportedException e) {
            throw new IllegalArgumentException("Host configuration could not be cloned");
        }
    }

    public synchronized String toString() {
        StringBuffer b;
        boolean appendComma = false;
        b = new StringBuffer(50);
        b.append("HostConfiguration[");
        if (this.host != null) {
            appendComma = true;
            b.append("host=").append(this.host);
        }
        if (this.proxyHost != null) {
            if (appendComma) {
                b.append(", ");
            } else {
                appendComma = true;
            }
            b.append("proxyHost=").append(this.proxyHost);
        }
        if (this.localAddress != null) {
            if (appendComma) {
                b.append(", ");
            } else {
                appendComma = true;
            }
            b.append("localAddress=").append(this.localAddress);
            if (appendComma) {
                b.append(", ");
            }
            b.append("params=").append(this.params);
        }
        b.append("]");
        return b.toString();
    }

    public synchronized boolean hostEquals(HttpConnection connection) {
        boolean z = false;
        synchronized (this) {
            if (connection == null) {
                throw new IllegalArgumentException("Connection may not be null");
            }
            if (this.host != null && this.host.getHostName().equalsIgnoreCase(connection.getHost()) && this.host.getPort() == connection.getPort() && this.host.getProtocol().equals(connection.getProtocol()) && (this.localAddress == null ? connection.getLocalAddress() == null : this.localAddress.equals(connection.getLocalAddress()))) {
                z = true;
            }
        }
        return z;
    }

    public synchronized boolean proxyEquals(HttpConnection connection) {
        boolean z = true;
        synchronized (this) {
            if (connection == null) {
                throw new IllegalArgumentException("Connection may not be null");
            }
            if (this.proxyHost != null) {
                if (!this.proxyHost.getHostName().equalsIgnoreCase(connection.getProxyHost()) || this.proxyHost.getPort() != connection.getProxyPort()) {
                    z = false;
                }
            } else if (connection.getProxyHost() != null) {
                z = false;
            }
        }
        return z;
    }

    public synchronized boolean isHostSet() {
        return this.host != null;
    }

    public synchronized void setHost(HttpHost host) {
        this.host = host;
    }

    public synchronized void setHost(String host, int port, String protocol) {
        this.host = new HttpHost(host, port, Protocol.getProtocol(protocol));
    }

    public synchronized void setHost(String host, String virtualHost, int port, Protocol protocol) {
        setHost(host, port, protocol);
        this.params.setVirtualHost(virtualHost);
    }

    public synchronized void setHost(String host, int port, Protocol protocol) {
        if (host == null) {
            throw new IllegalArgumentException("host must not be null");
        }
        if (protocol == null) {
            throw new IllegalArgumentException("protocol must not be null");
        }
        this.host = new HttpHost(host, port, protocol);
    }

    public synchronized void setHost(String host, int port) {
        setHost(host, port, Protocol.getProtocol("http"));
    }

    public synchronized void setHost(String host) {
        Protocol defaultProtocol = Protocol.getProtocol("http");
        setHost(host, defaultProtocol.getDefaultPort(), defaultProtocol);
    }

    public synchronized void setHost(URI uri) {
        try {
            setHost(uri.getHost(), uri.getPort(), uri.getScheme());
        } catch (URIException e) {
            throw new IllegalArgumentException(e.toString());
        }
    }

    public synchronized String getHostURL() {
        if (this.host == null) {
            throw new IllegalStateException("Host must be set to create a host URL");
        }
        return this.host.toURI();
    }

    public synchronized String getHost() {
        return this.host != null ? this.host.getHostName() : null;
    }

    public synchronized String getVirtualHost() {
        return this.params.getVirtualHost();
    }

    public synchronized int getPort() {
        return this.host != null ? this.host.getPort() : -1;
    }

    public synchronized Protocol getProtocol() {
        return this.host != null ? this.host.getProtocol() : null;
    }

    public synchronized boolean isProxySet() {
        return this.proxyHost != null;
    }

    public synchronized void setProxyHost(ProxyHost proxyHost) {
        this.proxyHost = proxyHost;
    }

    public synchronized void setProxy(String proxyHost, int proxyPort) {
        this.proxyHost = new ProxyHost(proxyHost, proxyPort);
    }

    public synchronized String getProxyHost() {
        return this.proxyHost != null ? this.proxyHost.getHostName() : null;
    }

    public synchronized int getProxyPort() {
        return this.proxyHost != null ? this.proxyHost.getPort() : -1;
    }

    public synchronized void setLocalAddress(InetAddress localAddress) {
        this.localAddress = localAddress;
    }

    public synchronized InetAddress getLocalAddress() {
        return this.localAddress;
    }

    public HostParams getParams() {
        return this.params;
    }

    public void setParams(HostParams params) {
        if (params == null) {
            throw new IllegalArgumentException("Parameters may not be null");
        }
        this.params = params;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized boolean equals(java.lang.Object r7) {
        /*
            r6 = this;
            r2 = 1
            r3 = 0
            monitor-enter(r6)
            boolean r4 = r7 instanceof org.apache.commons.httpclient.HostConfiguration     // Catch: java.lang.Throwable -> L31
            if (r4 == 0) goto L2f
            if (r7 != r6) goto Lb
        L9:
            monitor-exit(r6)
            return r2
        Lb:
            r0 = r7
            org.apache.commons.httpclient.HostConfiguration r0 = (org.apache.commons.httpclient.HostConfiguration) r0     // Catch: java.lang.Throwable -> L31
            r1 = r0
            org.apache.commons.httpclient.HttpHost r4 = r6.host     // Catch: java.lang.Throwable -> L31
            org.apache.commons.httpclient.HttpHost r5 = r1.host     // Catch: java.lang.Throwable -> L31
            boolean r4 = org.apache.commons.httpclient.util.LangUtils.equals(r4, r5)     // Catch: java.lang.Throwable -> L31
            if (r4 == 0) goto L2d
            org.apache.commons.httpclient.ProxyHost r4 = r6.proxyHost     // Catch: java.lang.Throwable -> L31
            org.apache.commons.httpclient.ProxyHost r5 = r1.proxyHost     // Catch: java.lang.Throwable -> L31
            boolean r4 = org.apache.commons.httpclient.util.LangUtils.equals(r4, r5)     // Catch: java.lang.Throwable -> L31
            if (r4 == 0) goto L2d
            java.net.InetAddress r4 = r6.localAddress     // Catch: java.lang.Throwable -> L31
            java.net.InetAddress r5 = r1.localAddress     // Catch: java.lang.Throwable -> L31
            boolean r4 = org.apache.commons.httpclient.util.LangUtils.equals(r4, r5)     // Catch: java.lang.Throwable -> L31
            if (r4 != 0) goto L9
        L2d:
            r2 = r3
            goto L9
        L2f:
            r2 = r3
            goto L9
        L31:
            r2 = move-exception
            monitor-exit(r6)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.httpclient.HostConfiguration.equals(java.lang.Object):boolean");
    }

    public synchronized int hashCode() {
        int hash;
        hash = LangUtils.hashCode(17, this.host);
        return LangUtils.hashCode(LangUtils.hashCode(hash, this.proxyHost), this.localAddress);
    }
}
