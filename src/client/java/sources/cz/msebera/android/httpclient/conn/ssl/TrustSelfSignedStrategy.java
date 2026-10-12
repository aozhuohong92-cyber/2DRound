package cz.msebera.android.httpclient.conn.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class TrustSelfSignedStrategy implements TrustStrategy {
    public static final TrustSelfSignedStrategy INSTANCE = new TrustSelfSignedStrategy();

    @Override // cz.msebera.android.httpclient.ssl.TrustStrategy
    public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        return chain.length == 1;
    }
}
