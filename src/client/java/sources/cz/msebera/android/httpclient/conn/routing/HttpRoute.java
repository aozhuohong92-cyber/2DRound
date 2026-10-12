package cz.msebera.android.httpclient.conn.routing;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.routing.RouteInfo;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.LangUtils;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class HttpRoute implements RouteInfo, Cloneable {
    private final RouteInfo.LayerType layered;
    private final InetAddress localAddress;
    private final List<HttpHost> proxyChain;
    private final boolean secure;
    private final HttpHost targetHost;
    private final RouteInfo.TunnelType tunnelled;

    private HttpRoute(HttpHost target, InetAddress local, List<HttpHost> proxies, boolean secure, RouteInfo.TunnelType tunnelled, RouteInfo.LayerType layered) {
        Args.notNull(target, "Target host");
        this.targetHost = normalize(target);
        this.localAddress = local;
        if (proxies != null && !proxies.isEmpty()) {
            this.proxyChain = new ArrayList(proxies);
        } else {
            this.proxyChain = null;
        }
        if (tunnelled == RouteInfo.TunnelType.TUNNELLED) {
            Args.check(this.proxyChain != null, "Proxy required if tunnelled");
        }
        this.secure = secure;
        this.tunnelled = tunnelled == null ? RouteInfo.TunnelType.PLAIN : tunnelled;
        this.layered = layered == null ? RouteInfo.LayerType.PLAIN : layered;
    }

    private static int getDefaultPort(String schemeName) {
        if ("http".equalsIgnoreCase(schemeName)) {
            return 80;
        }
        if ("https".equalsIgnoreCase(schemeName)) {
            return 443;
        }
        return -1;
    }

    private static HttpHost normalize(HttpHost target) {
        if (target.getPort() < 0) {
            InetAddress address = target.getAddress();
            String schemeName = target.getSchemeName();
            if (address != null) {
                return new HttpHost(address, getDefaultPort(schemeName), schemeName);
            }
            String hostName = target.getHostName();
            return new HttpHost(hostName, getDefaultPort(schemeName), schemeName);
        }
        return target;
    }

    public HttpRoute(HttpHost target, InetAddress local, HttpHost[] proxies, boolean secure, RouteInfo.TunnelType tunnelled, RouteInfo.LayerType layered) {
        this(target, local, (List<HttpHost>) (proxies != null ? Arrays.asList(proxies) : null), secure, tunnelled, layered);
    }

    public HttpRoute(HttpHost target, InetAddress local, HttpHost proxy, boolean secure, RouteInfo.TunnelType tunnelled, RouteInfo.LayerType layered) {
        this(target, local, (List<HttpHost>) (proxy != null ? Collections.singletonList(proxy) : null), secure, tunnelled, layered);
    }

    public HttpRoute(HttpHost target, InetAddress local, boolean secure) {
        this(target, local, (List<HttpHost>) Collections.emptyList(), secure, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
    }

    public HttpRoute(HttpHost target) {
        this(target, (InetAddress) null, (List<HttpHost>) Collections.emptyList(), false, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
    }

    public HttpRoute(HttpHost target, InetAddress local, HttpHost proxy, boolean secure) {
        this(target, local, (List<HttpHost>) Collections.singletonList(Args.notNull(proxy, "Proxy host")), secure, secure ? RouteInfo.TunnelType.TUNNELLED : RouteInfo.TunnelType.PLAIN, secure ? RouteInfo.LayerType.LAYERED : RouteInfo.LayerType.PLAIN);
    }

    public HttpRoute(HttpHost target, HttpHost proxy) {
        this(target, null, proxy, false);
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final HttpHost getTargetHost() {
        return this.targetHost;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final InetAddress getLocalAddress() {
        return this.localAddress;
    }

    public final InetSocketAddress getLocalSocketAddress() {
        if (this.localAddress != null) {
            return new InetSocketAddress(this.localAddress, 0);
        }
        return null;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final int getHopCount() {
        if (this.proxyChain != null) {
            return this.proxyChain.size() + 1;
        }
        return 1;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final HttpHost getHopTarget(int hop) {
        Args.notNegative(hop, "Hop index");
        int hopcount = getHopCount();
        Args.check(hop < hopcount, "Hop index exceeds tracked route length");
        if (hop < hopcount - 1) {
            return this.proxyChain.get(hop);
        }
        return this.targetHost;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final HttpHost getProxyHost() {
        if (this.proxyChain == null || this.proxyChain.isEmpty()) {
            return null;
        }
        return this.proxyChain.get(0);
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final RouteInfo.TunnelType getTunnelType() {
        return this.tunnelled;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final boolean isTunnelled() {
        return this.tunnelled == RouteInfo.TunnelType.TUNNELLED;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final RouteInfo.LayerType getLayerType() {
        return this.layered;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final boolean isLayered() {
        return this.layered == RouteInfo.LayerType.LAYERED;
    }

    @Override // cz.msebera.android.httpclient.conn.routing.RouteInfo
    public final boolean isSecure() {
        return this.secure;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof HttpRoute)) {
            return false;
        }
        HttpRoute that = (HttpRoute) obj;
        return this.secure == that.secure && this.tunnelled == that.tunnelled && this.layered == that.layered && LangUtils.equals(this.targetHost, that.targetHost) && LangUtils.equals(this.localAddress, that.localAddress) && LangUtils.equals(this.proxyChain, that.proxyChain);
    }

    public final int hashCode() {
        int hash = LangUtils.hashCode(LangUtils.hashCode(17, this.targetHost), this.localAddress);
        if (this.proxyChain != null) {
            for (HttpHost element : this.proxyChain) {
                hash = LangUtils.hashCode(hash, element);
            }
        }
        return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(hash, this.secure), this.tunnelled), this.layered);
    }

    public final String toString() {
        StringBuilder cab = new StringBuilder((getHopCount() * 30) + 50);
        if (this.localAddress != null) {
            cab.append(this.localAddress);
            cab.append("->");
        }
        cab.append('{');
        if (this.tunnelled == RouteInfo.TunnelType.TUNNELLED) {
            cab.append('t');
        }
        if (this.layered == RouteInfo.LayerType.LAYERED) {
            cab.append('l');
        }
        if (this.secure) {
            cab.append('s');
        }
        cab.append("}->");
        if (this.proxyChain != null) {
            for (HttpHost aProxyChain : this.proxyChain) {
                cab.append(aProxyChain);
                cab.append("->");
            }
        }
        cab.append(this.targetHost);
        return cab.toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
