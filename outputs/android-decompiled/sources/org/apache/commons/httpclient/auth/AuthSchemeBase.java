package org.apache.commons.httpclient.auth;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AuthSchemeBase implements AuthScheme {
    private String challenge;

    public AuthSchemeBase(String challenge) throws MalformedChallengeException {
        this.challenge = null;
        if (challenge == null) {
            throw new IllegalArgumentException("Challenge may not be null");
        }
        this.challenge = challenge;
    }

    public boolean equals(Object obj) {
        return obj instanceof AuthSchemeBase ? this.challenge.equals(((AuthSchemeBase) obj).challenge) : super.equals(obj);
    }

    public int hashCode() {
        return this.challenge.hashCode();
    }

    public String toString() {
        return this.challenge;
    }
}
