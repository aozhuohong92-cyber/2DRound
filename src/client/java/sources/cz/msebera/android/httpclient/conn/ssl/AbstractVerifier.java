package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.conn.util.InetAddressUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;
import java.security.cert.Certificate;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.security.auth.x500.X500Principal;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractVerifier implements X509HostnameVerifier {
    static final String[] BAD_COUNTRY_2LDS = {"ac", "co", "com", "ed", "edu", "go", "gouv", "gov", "info", "lg", "ne", "net", "or", "org"};
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    static {
        Arrays.sort(BAD_COUNTRY_2LDS);
    }

    @Override // cz.msebera.android.httpclient.conn.ssl.X509HostnameVerifier
    public final void verify(String host, SSLSocket ssl) throws CertificateParsingException, IOException {
        Args.notNull(host, "Host");
        SSLSession session = ssl.getSession();
        if (session == null) {
            InputStream in = ssl.getInputStream();
            in.available();
            session = ssl.getSession();
            if (session == null) {
                ssl.startHandshake();
                session = ssl.getSession();
            }
        }
        Certificate[] certs = session.getPeerCertificates();
        X509Certificate x509 = (X509Certificate) certs[0];
        verify(host, x509);
    }

    @Override // javax.net.ssl.HostnameVerifier
    public final boolean verify(String host, SSLSession session) throws CertificateParsingException, SSLPeerUnverifiedException {
        try {
            Certificate[] certs = session.getPeerCertificates();
            X509Certificate x509 = (X509Certificate) certs[0];
            verify(host, x509);
            return true;
        } catch (SSLException ex) {
            if (!this.log.isDebugEnabled()) {
                return false;
            }
            this.log.debug(ex.getMessage(), ex);
            return false;
        }
    }

    @Override // cz.msebera.android.httpclient.conn.ssl.X509HostnameVerifier
    public final void verify(String host, X509Certificate cert) throws SSLException, CertificateParsingException {
        String[] strArr = null;
        boolean ipv4 = InetAddressUtils.isIPv4Address(host);
        boolean ipv6 = InetAddressUtils.isIPv6Address(host);
        int subjectType = (ipv4 || ipv6) ? 7 : 2;
        List<String> subjectAlts = DefaultHostnameVerifier.extractSubjectAlts(cert, subjectType);
        X500Principal subjectPrincipal = cert.getSubjectX500Principal();
        String cn = new DistinguishedNameParser(subjectPrincipal).findMostSpecific("cn");
        String[] strArr2 = cn != null ? new String[]{cn} : null;
        if (subjectAlts != null && !subjectAlts.isEmpty()) {
            strArr = (String[]) subjectAlts.toArray(new String[subjectAlts.size()]);
        }
        verify(host, strArr2, strArr);
    }

    public final void verify(String host, String[] cns, String[] subjectAlts, boolean strictWithSubDomains) throws SSLException {
        List<String> subjectAltList = null;
        String cn = (cns == null || cns.length <= 0) ? null : cns[0];
        if (subjectAlts != null && subjectAlts.length > 0) {
            subjectAltList = Arrays.asList(subjectAlts);
        }
        String normalizedHost = InetAddressUtils.isIPv6Address(host) ? DefaultHostnameVerifier.normaliseAddress(host.toLowerCase(Locale.ROOT)) : host;
        if (subjectAltList != null) {
            for (String subjectAlt : subjectAltList) {
                String normalizedAltSubject = InetAddressUtils.isIPv6Address(subjectAlt) ? DefaultHostnameVerifier.normaliseAddress(subjectAlt) : subjectAlt;
                if (matchIdentity(normalizedHost, normalizedAltSubject, strictWithSubDomains)) {
                    return;
                }
            }
            throw new SSLException("Certificate for <" + host + "> doesn't match any of the subject alternative names: " + subjectAltList);
        }
        if (cn != null) {
            String normalizedCN = InetAddressUtils.isIPv6Address(cn) ? DefaultHostnameVerifier.normaliseAddress(cn) : cn;
            if (matchIdentity(normalizedHost, normalizedCN, strictWithSubDomains)) {
                return;
            } else {
                throw new SSLException("Certificate for <" + host + "> doesn't match common name of the certificate subject: " + cn);
            }
        }
        throw new SSLException("Certificate subject for <" + host + "> doesn't contain a common name and does not have alternative names");
    }

    private static boolean matchIdentity(String host, String identity, boolean strict) {
        boolean match;
        boolean z = true;
        if (host == null) {
            return false;
        }
        String normalizedHost = host.toLowerCase(Locale.ROOT);
        String normalizedIdentity = identity.toLowerCase(Locale.ROOT);
        String[] parts = normalizedIdentity.split("\\.");
        boolean doWildcard = parts.length >= 3 && parts[0].endsWith("*") && (!strict || validCountryWildcard(parts));
        if (doWildcard) {
            String firstpart = parts[0];
            if (firstpart.length() > 1) {
                String prefix = firstpart.substring(0, firstpart.length() - 1);
                String suffix = normalizedIdentity.substring(firstpart.length());
                String hostSuffix = normalizedHost.substring(prefix.length());
                match = normalizedHost.startsWith(prefix) && hostSuffix.endsWith(suffix);
            } else {
                match = normalizedHost.endsWith(normalizedIdentity.substring(1));
            }
            if (!match || (strict && countDots(normalizedHost) != countDots(normalizedIdentity))) {
                z = false;
            }
            return z;
        }
        return normalizedHost.equals(normalizedIdentity);
    }

    private static boolean validCountryWildcard(String[] parts) {
        return (parts.length == 3 && parts[2].length() == 2 && Arrays.binarySearch(BAD_COUNTRY_2LDS, parts[1]) >= 0) ? false : true;
    }

    public static boolean acceptableCountryWildcard(String cn) {
        return validCountryWildcard(cn.split("\\."));
    }

    public static String[] getCNs(X509Certificate cert) {
        String cn = new DistinguishedNameParser(cert.getSubjectX500Principal()).findMostSpecific("cn");
        if (cn != null) {
            return new String[]{cn};
        }
        return null;
    }

    public static String[] getDNSSubjectAlts(X509Certificate cert) throws CertificateParsingException {
        List<String> subjectAlts = DefaultHostnameVerifier.extractSubjectAlts(cert, 2);
        if (subjectAlts == null || subjectAlts.isEmpty()) {
            return null;
        }
        return (String[]) subjectAlts.toArray(new String[subjectAlts.size()]);
    }

    public static int countDots(String s) {
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '.') {
                count++;
            }
        }
        return count;
    }
}
