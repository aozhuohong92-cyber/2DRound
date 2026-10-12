package org.apache.commons.httpclient.auth;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpAuthRealm extends AuthScope {
    public HttpAuthRealm(String domain, String realm) {
        super(domain, -1, realm, ANY_SCHEME);
    }
}
