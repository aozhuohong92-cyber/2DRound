package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpAuthenticator extends cz.msebera.android.httpclient.impl.auth.HttpAuthenticator {
    public HttpAuthenticator(HttpClientAndroidLog log) {
        super(log);
    }

    public HttpAuthenticator() {
    }

    public boolean authenticate(HttpHost host, HttpResponse response, AuthenticationStrategy authStrategy, AuthState authState, HttpContext context) {
        return handleAuthChallenge(host, response, authStrategy, authState, context);
    }
}
