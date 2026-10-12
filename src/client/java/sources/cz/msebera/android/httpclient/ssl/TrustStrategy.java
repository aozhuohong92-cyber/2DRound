package cz.msebera.android.httpclient.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface TrustStrategy {
    boolean isTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException;
}
