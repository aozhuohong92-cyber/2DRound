package org.apache.commons.httpclient.auth;

import org.apache.commons.httpclient.Credentials;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface CredentialsProvider {
    public static final String PROVIDER = "http.authentication.credential-provider";

    Credentials getCredentials(AuthScheme authScheme, String str, int i, boolean z) throws CredentialsNotAvailableException;
}
