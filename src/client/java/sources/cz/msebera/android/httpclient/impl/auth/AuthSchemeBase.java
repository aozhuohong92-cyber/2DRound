package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.FormattedHeader;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.ChallengeState;
import cz.msebera.android.httpclient.auth.ContextAwareAuthScheme;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.Locale;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AuthSchemeBase implements ContextAwareAuthScheme {
    private ChallengeState challengeState;

    protected abstract void parseChallenge(CharArrayBuffer charArrayBuffer, int i, int i2) throws MalformedChallengeException;

    @Deprecated
    public AuthSchemeBase(ChallengeState challengeState) {
        this.challengeState = challengeState;
    }

    public AuthSchemeBase() {
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public void processChallenge(Header header) throws MalformedChallengeException {
        CharArrayBuffer buffer;
        int pos;
        Args.notNull(header, "Header");
        String authheader = header.getName();
        if (authheader.equalsIgnoreCase("WWW-Authenticate")) {
            this.challengeState = ChallengeState.TARGET;
        } else if (authheader.equalsIgnoreCase("Proxy-Authenticate")) {
            this.challengeState = ChallengeState.PROXY;
        } else {
            throw new MalformedChallengeException("Unexpected header name: " + authheader);
        }
        if (header instanceof FormattedHeader) {
            buffer = ((FormattedHeader) header).getBuffer();
            pos = ((FormattedHeader) header).getValuePos();
        } else {
            String s = header.getValue();
            if (s == null) {
                throw new MalformedChallengeException("Header value is null");
            }
            buffer = new CharArrayBuffer(s.length());
            buffer.append(s);
            pos = 0;
        }
        while (pos < buffer.length() && HTTP.isWhitespace(buffer.charAt(pos))) {
            pos++;
        }
        int beginIndex = pos;
        while (pos < buffer.length() && !HTTP.isWhitespace(buffer.charAt(pos))) {
            pos++;
        }
        int endIndex = pos;
        String s2 = buffer.substring(beginIndex, endIndex);
        if (!s2.equalsIgnoreCase(getSchemeName())) {
            throw new MalformedChallengeException("Invalid scheme identifier: " + s2);
        }
        parseChallenge(buffer, pos, buffer.length());
    }

    @Override // cz.msebera.android.httpclient.auth.ContextAwareAuthScheme
    public Header authenticate(Credentials credentials, HttpRequest request, HttpContext context) throws AuthenticationException {
        return authenticate(credentials, request);
    }

    public boolean isProxy() {
        return this.challengeState != null && this.challengeState == ChallengeState.PROXY;
    }

    public ChallengeState getChallengeState() {
        return this.challengeState;
    }

    public String toString() {
        String name = getSchemeName();
        return name != null ? name.toUpperCase(Locale.ROOT) : super.toString();
    }
}
