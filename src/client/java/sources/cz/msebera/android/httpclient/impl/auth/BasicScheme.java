package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.Consts;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.ChallengeState;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.extras.Base64;
import cz.msebera.android.httpclient.message.BufferedHeader;
import cz.msebera.android.httpclient.protocol.BasicHttpContext;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import cz.msebera.android.httpclient.util.EncodingUtils;
import java.nio.charset.Charset;
import org.apache.commons.httpclient.auth.AuthState;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicScheme extends RFC2617Scheme {
    private static final long serialVersionUID = -1931571557597830536L;
    private boolean complete;

    public BasicScheme(Charset credentialsCharset) {
        super(credentialsCharset);
        this.complete = false;
    }

    @Deprecated
    public BasicScheme(ChallengeState challengeState) {
        super(challengeState);
    }

    public BasicScheme() {
        this(Consts.ASCII);
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public String getSchemeName() {
        return AuthState.PREEMPTIVE_AUTH_SCHEME;
    }

    @Override // cz.msebera.android.httpclient.impl.auth.AuthSchemeBase, cz.msebera.android.httpclient.auth.AuthScheme
    public void processChallenge(Header header) throws MalformedChallengeException {
        super.processChallenge(header);
        this.complete = true;
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public boolean isComplete() {
        return this.complete;
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public boolean isConnectionBased() {
        return false;
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    @Deprecated
    public Header authenticate(Credentials credentials, HttpRequest request) throws AuthenticationException {
        return authenticate(credentials, request, new BasicHttpContext());
    }

    @Override // cz.msebera.android.httpclient.impl.auth.AuthSchemeBase, cz.msebera.android.httpclient.auth.ContextAwareAuthScheme
    public Header authenticate(Credentials credentials, HttpRequest request, HttpContext context) throws AuthenticationException {
        Args.notNull(credentials, "Credentials");
        Args.notNull(request, "HTTP request");
        StringBuilder tmp = new StringBuilder();
        tmp.append(credentials.getUserPrincipal().getName());
        tmp.append(":");
        tmp.append(credentials.getPassword() == null ? "null" : credentials.getPassword());
        byte[] base64password = Base64.encode(EncodingUtils.getBytes(tmp.toString(), getCredentialsCharset(request)), 2);
        CharArrayBuffer buffer = new CharArrayBuffer(32);
        if (isProxy()) {
            buffer.append("Proxy-Authorization");
        } else {
            buffer.append("Authorization");
        }
        buffer.append(": Basic ");
        buffer.append(base64password, 0, base64password.length);
        return new BufferedHeader(buffer);
    }

    @Deprecated
    public static Header authenticate(Credentials credentials, String charset, boolean proxy) {
        Args.notNull(credentials, "Credentials");
        Args.notNull(charset, "charset");
        StringBuilder tmp = new StringBuilder();
        tmp.append(credentials.getUserPrincipal().getName());
        tmp.append(":");
        tmp.append(credentials.getPassword() == null ? "null" : credentials.getPassword());
        byte[] base64password = Base64.encode(EncodingUtils.getBytes(tmp.toString(), charset), 2);
        CharArrayBuffer buffer = new CharArrayBuffer(32);
        if (proxy) {
            buffer.append("Proxy-Authorization");
        } else {
            buffer.append("Authorization");
        }
        buffer.append(": Basic ");
        buffer.append(base64password, 0, base64password.length);
        return new BufferedHeader(buffer);
    }

    @Override // cz.msebera.android.httpclient.impl.auth.AuthSchemeBase
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("BASIC [complete=").append(this.complete).append("]");
        return builder.toString();
    }
}
