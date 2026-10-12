package org.apache.commons.httpclient;

import org.apache.commons.httpclient.protocol.Protocol;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ProxyHost extends HttpHost {
    public ProxyHost(ProxyHost httpproxy) {
        super(httpproxy);
    }

    public ProxyHost(String hostname, int port) {
        super(hostname, port, Protocol.getProtocol("http"));
    }

    public ProxyHost(String hostname) {
        this(hostname, -1);
    }

    @Override // org.apache.commons.httpclient.HttpHost
    public Object clone() throws CloneNotSupportedException {
        ProxyHost copy = (ProxyHost) super.clone();
        return copy;
    }
}
