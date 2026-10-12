package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.IOException;
import java.net.ConnectException;
import java.net.InetAddress;
import java.util.Arrays;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpHostConnectException extends ConnectException {
    private static final long serialVersionUID = -3194482710275220224L;
    private final HttpHost host;

    @Deprecated
    public HttpHostConnectException(HttpHost host, ConnectException cause) {
        this(cause, host, (InetAddress[]) null);
    }

    public HttpHostConnectException(IOException cause, HttpHost host, InetAddress... remoteAddresses) {
        super("Connect to " + (host != null ? host.toHostString() : "remote host") + ((remoteAddresses == null || remoteAddresses.length <= 0) ? "" : " " + Arrays.asList(remoteAddresses)) + ((cause == null || cause.getMessage() == null) ? " refused" : " failed: " + cause.getMessage()));
        this.host = host;
        initCause(cause);
    }

    public HttpHost getHost() {
        return this.host;
    }
}
