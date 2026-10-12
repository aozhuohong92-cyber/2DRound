package cz.msebera.android.httpclient.client.params;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.auth.params.AuthPNames;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.conn.params.ConnRoutePNames;
import cz.msebera.android.httpclient.params.HttpParams;
import java.net.InetAddress;
import java.util.Collection;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class HttpClientParamConfig {
    private HttpClientParamConfig() {
    }

    public static RequestConfig getRequestConfig(HttpParams params) {
        return RequestConfig.custom().setSocketTimeout(params.getIntParameter("http.socket.timeout", 0)).setStaleConnectionCheckEnabled(params.getBooleanParameter("http.connection.stalecheck", true)).setConnectTimeout(params.getIntParameter("http.connection.timeout", 0)).setExpectContinueEnabled(params.getBooleanParameter("http.protocol.expect-continue", false)).setProxy((HttpHost) params.getParameter(ConnRoutePNames.DEFAULT_PROXY)).setLocalAddress((InetAddress) params.getParameter(ConnRoutePNames.LOCAL_ADDRESS)).setProxyPreferredAuthSchemes((Collection) params.getParameter(AuthPNames.PROXY_AUTH_PREF)).setTargetPreferredAuthSchemes((Collection) params.getParameter(AuthPNames.TARGET_AUTH_PREF)).setAuthenticationEnabled(params.getBooleanParameter(ClientPNames.HANDLE_AUTHENTICATION, true)).setCircularRedirectsAllowed(params.getBooleanParameter("http.protocol.allow-circular-redirects", false)).setConnectionRequestTimeout((int) params.getLongParameter("http.conn-manager.timeout", 0L)).setCookieSpec((String) params.getParameter("http.protocol.cookie-policy")).setMaxRedirects(params.getIntParameter("http.protocol.max-redirects", 50)).setRedirectsEnabled(params.getBooleanParameter(ClientPNames.HANDLE_REDIRECTS, true)).setRelativeRedirectsAllowed(!params.getBooleanParameter("http.protocol.reject-relative-redirect", false)).build();
    }
}
