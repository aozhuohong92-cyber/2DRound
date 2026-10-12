package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.client.UserTokenHandler;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.conn.ConnectionKeepAliveStrategy;
import cz.msebera.android.httpclient.conn.HttpClientConnectionManager;
import cz.msebera.android.httpclient.conn.routing.BasicRouteDirector;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.conn.routing.RouteTracker;
import cz.msebera.android.httpclient.entity.BufferedHttpEntity;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.impl.auth.HttpAuthenticator;
import cz.msebera.android.httpclient.message.BasicHttpRequest;
import cz.msebera.android.httpclient.protocol.HttpProcessor;
import cz.msebera.android.httpclient.protocol.HttpRequestExecutor;
import cz.msebera.android.httpclient.protocol.ImmutableHttpProcessor;
import cz.msebera.android.httpclient.protocol.RequestTargetHost;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;
import org.apache.commons.httpclient.ConnectMethod;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class MainClientExec implements ClientExecChain {
    private final HttpAuthenticator authenticator;
    private final HttpClientConnectionManager connManager;
    private final ConnectionKeepAliveStrategy keepAliveStrategy;
    public HttpClientAndroidLog log;
    private final AuthenticationStrategy proxyAuthStrategy;
    private final HttpProcessor proxyHttpProcessor;
    private final HttpRequestExecutor requestExecutor;
    private final ConnectionReuseStrategy reuseStrategy;
    private final HttpRouteDirector routeDirector;
    private final AuthenticationStrategy targetAuthStrategy;
    private final UserTokenHandler userTokenHandler;

    public MainClientExec(HttpRequestExecutor requestExecutor, HttpClientConnectionManager connManager, ConnectionReuseStrategy reuseStrategy, ConnectionKeepAliveStrategy keepAliveStrategy, HttpProcessor proxyHttpProcessor, AuthenticationStrategy targetAuthStrategy, AuthenticationStrategy proxyAuthStrategy, UserTokenHandler userTokenHandler) {
        this.log = new HttpClientAndroidLog(getClass());
        Args.notNull(requestExecutor, "HTTP request executor");
        Args.notNull(connManager, "Client connection manager");
        Args.notNull(reuseStrategy, "Connection reuse strategy");
        Args.notNull(keepAliveStrategy, "Connection keep alive strategy");
        Args.notNull(proxyHttpProcessor, "Proxy HTTP processor");
        Args.notNull(targetAuthStrategy, "Target authentication strategy");
        Args.notNull(proxyAuthStrategy, "Proxy authentication strategy");
        Args.notNull(userTokenHandler, "User token handler");
        this.authenticator = new HttpAuthenticator();
        this.routeDirector = new BasicRouteDirector();
        this.requestExecutor = requestExecutor;
        this.connManager = connManager;
        this.reuseStrategy = reuseStrategy;
        this.keepAliveStrategy = keepAliveStrategy;
        this.proxyHttpProcessor = proxyHttpProcessor;
        this.targetAuthStrategy = targetAuthStrategy;
        this.proxyAuthStrategy = proxyAuthStrategy;
        this.userTokenHandler = userTokenHandler;
    }

    public MainClientExec(HttpRequestExecutor requestExecutor, HttpClientConnectionManager connManager, ConnectionReuseStrategy reuseStrategy, ConnectionKeepAliveStrategy keepAliveStrategy, AuthenticationStrategy targetAuthStrategy, AuthenticationStrategy proxyAuthStrategy, UserTokenHandler userTokenHandler) {
        this(requestExecutor, connManager, reuseStrategy, keepAliveStrategy, new ImmutableHttpProcessor(new RequestTargetHost()), targetAuthStrategy, proxyAuthStrategy, userTokenHandler);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0245 A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0286 A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x02f6 A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0330 A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TRY_LEAVE, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0192 A[EDGE_INSN: B:160:0x0192->B:82:0x0192 BREAK  A[LOOP:0: B:34:0x00cb->B:129:0x0329], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015e A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01ce A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01f6 A[Catch: ConnectionShutdownException -> 0x00de, HttpException -> 0x0126, IOException -> 0x0173, RuntimeException -> 0x0334, TryCatch #4 {HttpException -> 0x0126, ConnectionShutdownException -> 0x00de, IOException -> 0x0173, RuntimeException -> 0x0334, blocks: (B:32:0x00c4, B:36:0x00d0, B:38:0x00d6, B:39:0x00dd, B:54:0x0118, B:56:0x011e, B:57:0x0125, B:61:0x012b, B:63:0x0131, B:65:0x0155, B:78:0x0179, B:80:0x0183, B:81:0x018e, B:83:0x0194, B:85:0x01a9, B:86:0x01ae, B:88:0x01b4, B:150:0x0386, B:90:0x01ba, B:66:0x0158, B:68:0x015e, B:70:0x0165, B:72:0x016b, B:73:0x0172, B:92:0x01c4, B:94:0x01ce, B:95:0x01ec, B:97:0x01f6, B:99:0x0200, B:100:0x021e, B:101:0x022b, B:103:0x0235, B:105:0x023b, B:107:0x0245, B:108:0x0263, B:109:0x026e, B:111:0x0286, B:115:0x02a0, B:116:0x02c1, B:117:0x02dd, B:118:0x02e7, B:120:0x02f6, B:122:0x0300, B:123:0x0303, B:125:0x0311, B:126:0x0318, B:128:0x0322, B:129:0x0329, B:136:0x0339, B:138:0x0344, B:140:0x034a, B:142:0x0354, B:143:0x0360, B:145:0x0368, B:147:0x036e, B:149:0x0378, B:131:0x0330), top: B:156:0x00c4 }] */
    @Override // cz.msebera.android.httpclient.impl.execchain.ClientExecChain
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.client.methods.CloseableHttpResponse execute(cz.msebera.android.httpclient.conn.routing.HttpRoute r30, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper r31, cz.msebera.android.httpclient.client.protocol.HttpClientContext r32, cz.msebera.android.httpclient.client.methods.HttpExecutionAware r33) throws cz.msebera.android.httpclient.HttpException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 909
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.execchain.MainClientExec.execute(cz.msebera.android.httpclient.conn.routing.HttpRoute, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper, cz.msebera.android.httpclient.client.protocol.HttpClientContext, cz.msebera.android.httpclient.client.methods.HttpExecutionAware):cz.msebera.android.httpclient.client.methods.CloseableHttpResponse");
    }

    void establishRoute(AuthState proxyAuthState, HttpClientConnection managedConn, HttpRoute route, HttpRequest request, HttpClientContext context) throws IOException, HttpException {
        int step;
        RequestConfig config = context.getRequestConfig();
        int timeout = config.getConnectTimeout();
        RouteTracker tracker = new RouteTracker(route);
        do {
            HttpRoute fact = tracker.toRoute();
            step = this.routeDirector.nextStep(route, fact);
            switch (step) {
                case -1:
                    throw new HttpException("Unable to establish route: planned = " + route + "; current = " + fact);
                case 0:
                    this.connManager.routeComplete(managedConn, route, context);
                    break;
                case 1:
                    this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
                    tracker.connectTarget(route.isSecure());
                    break;
                case 2:
                    this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
                    HttpHost proxy = route.getProxyHost();
                    tracker.connectProxy(proxy, false);
                    break;
                case 3:
                    boolean secure = createTunnelToTarget(proxyAuthState, managedConn, route, request, context);
                    this.log.debug("Tunnel to target created.");
                    tracker.tunnelTarget(secure);
                    break;
                case 4:
                    int hop = fact.getHopCount() - 1;
                    boolean secure2 = createTunnelToProxy(route, hop, context);
                    this.log.debug("Tunnel to proxy created.");
                    tracker.tunnelProxy(route.getHopTarget(hop), secure2);
                    break;
                case 5:
                    this.connManager.upgrade(managedConn, route, context);
                    tracker.layerProtocol(route.isSecure());
                    break;
                default:
                    throw new IllegalStateException("Unknown step indicator " + step + " from RouteDirector.");
            }
        } while (step > 0);
    }

    private boolean createTunnelToTarget(AuthState proxyAuthState, HttpClientConnection managedConn, HttpRoute route, HttpRequest request, HttpClientContext context) throws HttpException, IOException {
        RequestConfig config = context.getRequestConfig();
        int timeout = config.getConnectTimeout();
        HttpHost target = route.getTargetHost();
        HttpHost proxy = route.getProxyHost();
        HttpResponse response = null;
        String authority = target.toHostString();
        HttpRequest connect = new BasicHttpRequest(ConnectMethod.NAME, authority, request.getProtocolVersion());
        this.requestExecutor.preProcess(connect, this.proxyHttpProcessor, context);
        while (response == null) {
            if (!managedConn.isOpen()) {
                this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
            }
            connect.removeHeaders("Proxy-Authorization");
            this.authenticator.generateAuthResponse(connect, proxyAuthState, context);
            response = this.requestExecutor.execute(connect, managedConn, context);
            int status = response.getStatusLine().getStatusCode();
            if (status < 200) {
                throw new HttpException("Unexpected response to CONNECT request: " + response.getStatusLine());
            }
            if (config.isAuthenticationEnabled() && this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, proxyAuthState, context) && this.authenticator.handleAuthChallenge(proxy, response, this.proxyAuthStrategy, proxyAuthState, context)) {
                if (this.reuseStrategy.keepAlive(response, context)) {
                    this.log.debug("Connection kept alive");
                    EntityUtils.consume(response.getEntity());
                } else {
                    managedConn.close();
                }
                response = null;
            }
        }
        int status2 = response.getStatusLine().getStatusCode();
        if (status2 > 299) {
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                response.setEntity(new BufferedHttpEntity(entity));
            }
            managedConn.close();
            throw new TunnelRefusedException("CONNECT refused by proxy: " + response.getStatusLine(), response);
        }
        return false;
    }

    private boolean createTunnelToProxy(HttpRoute route, int hop, HttpClientContext context) throws HttpException {
        throw new HttpException("Proxy chains are not supported.");
    }

    private boolean needAuthentication(AuthState targetAuthState, AuthState proxyAuthState, HttpRoute route, HttpResponse response, HttpClientContext context) {
        RequestConfig config = context.getRequestConfig();
        if (config.isAuthenticationEnabled()) {
            HttpHost target = context.getTargetHost();
            if (target == null) {
                target = route.getTargetHost();
            }
            if (target.getPort() < 0) {
                target = new HttpHost(target.getHostName(), route.getTargetHost().getPort(), target.getSchemeName());
            }
            boolean targetAuthRequested = this.authenticator.isAuthenticationRequested(target, response, this.targetAuthStrategy, targetAuthState, context);
            HttpHost proxy = route.getProxyHost();
            if (proxy == null) {
                proxy = route.getTargetHost();
            }
            boolean proxyAuthRequested = this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, proxyAuthState, context);
            if (targetAuthRequested) {
                return this.authenticator.handleAuthChallenge(target, response, this.targetAuthStrategy, targetAuthState, context);
            }
            if (proxyAuthRequested) {
                return this.authenticator.handleAuthChallenge(proxy, response, this.proxyAuthStrategy, proxyAuthState, context);
            }
        }
        return false;
    }
}
