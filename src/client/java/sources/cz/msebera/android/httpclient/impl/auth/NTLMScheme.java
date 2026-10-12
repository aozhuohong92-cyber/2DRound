package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.auth.InvalidCredentialsException;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.auth.NTCredentials;
import cz.msebera.android.httpclient.message.BufferedHeader;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NTLMScheme extends AuthSchemeBase {
    private String challenge;
    private final NTLMEngine engine;
    private State state;

    enum State {
        UNINITIATED,
        CHALLENGE_RECEIVED,
        MSG_TYPE1_GENERATED,
        MSG_TYPE2_RECEVIED,
        MSG_TYPE3_GENERATED,
        FAILED
    }

    public NTLMScheme(NTLMEngine engine) {
        Args.notNull(engine, "NTLM engine");
        this.engine = engine;
        this.state = State.UNINITIATED;
        this.challenge = null;
    }

    public NTLMScheme() {
        this(new NTLMEngineImpl());
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public String getSchemeName() {
        return "ntlm";
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public String getParameter(String name) {
        return null;
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public String getRealm() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public boolean isConnectionBased() {
        return true;
    }

    @Override // cz.msebera.android.httpclient.impl.auth.AuthSchemeBase
    protected void parseChallenge(CharArrayBuffer buffer, int beginIndex, int endIndex) throws MalformedChallengeException {
        this.challenge = buffer.substringTrimmed(beginIndex, endIndex);
        if (this.challenge.isEmpty()) {
            if (this.state == State.UNINITIATED) {
                this.state = State.CHALLENGE_RECEIVED;
                return;
            } else {
                this.state = State.FAILED;
                return;
            }
        }
        if (this.state.compareTo(State.MSG_TYPE1_GENERATED) < 0) {
            this.state = State.FAILED;
            throw new MalformedChallengeException("Out of sequence NTLM response message");
        }
        if (this.state == State.MSG_TYPE1_GENERATED) {
            this.state = State.MSG_TYPE2_RECEVIED;
        }
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public Header authenticate(Credentials credentials, HttpRequest request) throws AuthenticationException {
        String response;
        try {
            NTCredentials ntcredentials = (NTCredentials) credentials;
            if (this.state == State.FAILED) {
                throw new AuthenticationException("NTLM authentication failed");
            }
            if (this.state == State.CHALLENGE_RECEIVED) {
                response = this.engine.generateType1Msg(ntcredentials.getDomain(), ntcredentials.getWorkstation());
                this.state = State.MSG_TYPE1_GENERATED;
            } else if (this.state == State.MSG_TYPE2_RECEVIED) {
                response = this.engine.generateType3Msg(ntcredentials.getUserName(), ntcredentials.getPassword(), ntcredentials.getDomain(), ntcredentials.getWorkstation(), this.challenge);
                this.state = State.MSG_TYPE3_GENERATED;
            } else {
                throw new AuthenticationException("Unexpected state: " + this.state);
            }
            CharArrayBuffer buffer = new CharArrayBuffer(32);
            if (isProxy()) {
                buffer.append("Proxy-Authorization");
            } else {
                buffer.append("Authorization");
            }
            buffer.append(": NTLM ");
            buffer.append(response);
            return new BufferedHeader(buffer);
        } catch (ClassCastException e) {
            throw new InvalidCredentialsException("Credentials cannot be used for NTLM authentication: " + credentials.getClass().getName());
        }
    }

    @Override // cz.msebera.android.httpclient.auth.AuthScheme
    public boolean isComplete() {
        return this.state == State.MSG_TYPE3_GENERATED || this.state == State.FAILED;
    }
}
