package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.auth.AuthOption;
import cz.msebera.android.httpclient.auth.AuthProtocolState;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.ContextAwareAuthScheme;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.Queue;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpAuthenticator {
    public HttpClientAndroidLog log;

    public HttpAuthenticator(HttpClientAndroidLog log) {
        this.log = log == null ? new HttpClientAndroidLog(getClass()) : log;
    }

    public HttpAuthenticator() {
        this(null);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public boolean isAuthenticationRequested(HttpHost host, HttpResponse response, AuthenticationStrategy authStrategy, AuthState authState, HttpContext context) {
        if (authStrategy.isAuthenticationRequested(host, response, context)) {
            this.log.debug("Authentication required");
            if (authState.getState() == AuthProtocolState.SUCCESS) {
                authStrategy.authFailed(host, authState.getAuthScheme(), context);
            }
            return true;
        }
        switch (authState.getState()) {
            case CHALLENGED:
            case HANDSHAKE:
                this.log.debug("Authentication succeeded");
                authState.setState(AuthProtocolState.SUCCESS);
                authStrategy.authSucceeded(host, authState.getAuthScheme(), context);
                return false;
            case SUCCESS:
                return false;
            default:
                authState.setState(AuthProtocolState.UNCHALLENGED);
                return false;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0050 A[Catch: MalformedChallengeException -> 0x0086, TryCatch #0 {MalformedChallengeException -> 0x0086, blocks: (B:2:0x0000, B:4:0x0008, B:5:0x0024, B:7:0x002e, B:9:0x0037, B:10:0x0047, B:11:0x004a, B:13:0x0050, B:15:0x0056, B:17:0x005e, B:18:0x0076, B:20:0x0082, B:28:0x00b2, B:30:0x00ca, B:32:0x00dc, B:34:0x00ec, B:35:0x0105, B:36:0x010d), top: B:39:0x0000 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00ca A[Catch: MalformedChallengeException -> 0x0086, TryCatch #0 {MalformedChallengeException -> 0x0086, blocks: (B:2:0x0000, B:4:0x0008, B:5:0x0024, B:7:0x002e, B:9:0x0037, B:10:0x0047, B:11:0x004a, B:13:0x0050, B:15:0x0056, B:17:0x005e, B:18:0x0076, B:20:0x0082, B:28:0x00b2, B:30:0x00ca, B:32:0x00dc, B:34:0x00ec, B:35:0x0105, B:36:0x010d), top: B:39:0x0000 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean handleAuthChallenge(cz.msebera.android.httpclient.HttpHost r10, cz.msebera.android.httpclient.HttpResponse r11, cz.msebera.android.httpclient.client.AuthenticationStrategy r12, cz.msebera.android.httpclient.auth.AuthState r13, cz.msebera.android.httpclient.protocol.HttpContext r14) {
        /*
            Method dump skipped, instructions count: 292
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.auth.HttpAuthenticator.handleAuthChallenge(cz.msebera.android.httpclient.HttpHost, cz.msebera.android.httpclient.HttpResponse, cz.msebera.android.httpclient.client.AuthenticationStrategy, cz.msebera.android.httpclient.auth.AuthState, cz.msebera.android.httpclient.protocol.HttpContext):boolean");
    }

    public void generateAuthResponse(HttpRequest request, AuthState authState, HttpContext context) throws HttpException, IOException {
        AuthScheme authScheme = authState.getAuthScheme();
        Credentials creds = authState.getCredentials();
        switch (authState.getState()) {
            case CHALLENGED:
                Queue<AuthOption> authOptions = authState.getAuthOptions();
                if (authOptions != null) {
                    while (!authOptions.isEmpty()) {
                        AuthOption authOption = authOptions.remove();
                        AuthScheme authScheme2 = authOption.getAuthScheme();
                        Credentials creds2 = authOption.getCredentials();
                        authState.update(authScheme2, creds2);
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Generating response to an authentication challenge using " + authScheme2.getSchemeName() + " scheme");
                        }
                        try {
                            Header header = doAuth(authScheme2, creds2, request, context);
                            request.addHeader(header);
                            return;
                        } catch (AuthenticationException ex) {
                            if (this.log.isWarnEnabled()) {
                                this.log.warn(authScheme2 + " authentication error: " + ex.getMessage());
                            }
                        }
                    }
                    return;
                }
                ensureAuthScheme(authScheme);
                break;
            case SUCCESS:
                ensureAuthScheme(authScheme);
                if (authScheme.isConnectionBased()) {
                    return;
                }
                break;
            case FAILURE:
                return;
        }
        if (authScheme != null) {
            try {
                Header header2 = doAuth(authScheme, creds, request, context);
                request.addHeader(header2);
            } catch (AuthenticationException ex2) {
                if (this.log.isErrorEnabled()) {
                    this.log.error(authScheme + " authentication error: " + ex2.getMessage());
                }
            }
        }
    }

    private void ensureAuthScheme(AuthScheme authScheme) {
        Asserts.notNull(authScheme, "Auth scheme");
    }

    private Header doAuth(AuthScheme authScheme, Credentials creds, HttpRequest request, HttpContext context) throws AuthenticationException {
        return authScheme instanceof ContextAwareAuthScheme ? ((ContextAwareAuthScheme) authScheme).authenticate(creds, request, context) : authScheme.authenticate(creds, request);
    }
}
