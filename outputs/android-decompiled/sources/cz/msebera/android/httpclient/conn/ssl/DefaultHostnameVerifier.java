package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.util.InetAddressUtils;
import cz.msebera.android.httpclient.conn.util.PublicSuffixMatcher;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.cert.Certificate;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.security.auth.x500.X500Principal;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class DefaultHostnameVerifier implements HostnameVerifier {
    static final int DNS_NAME_TYPE = 2;
    static final int IP_ADDRESS_TYPE = 7;
    public HttpClientAndroidLog log;
    private final PublicSuffixMatcher publicSuffixMatcher;

    public DefaultHostnameVerifier(PublicSuffixMatcher publicSuffixMatcher) {
        this.log = new HttpClientAndroidLog(getClass());
        this.publicSuffixMatcher = publicSuffixMatcher;
    }

    public DefaultHostnameVerifier() {
        this(null);
    }

    @Override // javax.net.ssl.HostnameVerifier
    public final boolean verify(String host, SSLSession session) throws CertificateParsingException, UnknownHostException, SSLPeerUnverifiedException {
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

    public final void verify(String host, X509Certificate cert) throws SSLException, CertificateParsingException, UnknownHostException {
        boolean ipv4 = InetAddressUtils.isIPv4Address(host);
        boolean ipv6 = InetAddressUtils.isIPv6Address(host);
        int subjectType = (ipv4 || ipv6) ? 7 : 2;
        List<String> subjectAlts = extractSubjectAlts(cert, subjectType);
        if (subjectAlts != null && !subjectAlts.isEmpty()) {
            if (ipv4) {
                matchIPAddress(host, subjectAlts);
                return;
            } else if (ipv6) {
                matchIPv6Address(host, subjectAlts);
                return;
            } else {
                matchDNSName(host, subjectAlts, this.publicSuffixMatcher);
                return;
            }
        }
        X500Principal subjectPrincipal = cert.getSubjectX500Principal();
        String cn = new DistinguishedNameParser(subjectPrincipal).findMostSpecific("cn");
        if (cn == null) {
            throw new SSLException("Certificate subject for <" + host + "> doesn't contain a common name and does not have alternative names");
        }
        matchCN(host, cn, this.publicSuffixMatcher);
    }

    static void matchIPAddress(String host, List<String> subjectAlts) throws SSLException {
        for (int i = 0; i < subjectAlts.size(); i++) {
            String subjectAlt = subjectAlts.get(i);
            if (host.equals(subjectAlt)) {
                return;
            }
        }
        throw new SSLException("Certificate for <" + host + "> doesn't match any of the subject alternative names: " + subjectAlts);
    }

    static void matchIPv6Address(String host, List<String> subjectAlts) throws SSLException, UnknownHostException {
        String normalisedHost = normaliseAddress(host);
        for (int i = 0; i < subjectAlts.size(); i++) {
            String subjectAlt = subjectAlts.get(i);
            String normalizedSubjectAlt = normaliseAddress(subjectAlt);
            if (normalisedHost.equals(normalizedSubjectAlt)) {
                return;
            }
        }
        throw new SSLException("Certificate for <" + host + "> doesn't match any of the subject alternative names: " + subjectAlts);
    }

    static void matchDNSName(String host, List<String> subjectAlts, PublicSuffixMatcher publicSuffixMatcher) throws SSLException {
        String normalizedHost = host.toLowerCase(Locale.ROOT);
        for (int i = 0; i < subjectAlts.size(); i++) {
            String subjectAlt = subjectAlts.get(i);
            String normalizedSubjectAlt = subjectAlt.toLowerCase(Locale.ROOT);
            if (matchIdentityStrict(normalizedHost, normalizedSubjectAlt, publicSuffixMatcher)) {
                return;
            }
        }
        throw new SSLException("Certificate for <" + host + "> doesn't match any of the subject alternative names: " + subjectAlts);
    }

    static void matchCN(String host, String cn, PublicSuffixMatcher publicSuffixMatcher) throws SSLException {
        if (!matchIdentityStrict(host, cn, publicSuffixMatcher)) {
            throw new SSLException("Certificate for <" + host + "> doesn't match common name of the certificate subject: " + cn);
        }
    }

    static boolean matchDomainRoot(String host, String domainRoot) {
        if (domainRoot != null && host.endsWith(domainRoot)) {
            return host.length() == domainRoot.length() || host.charAt((host.length() - domainRoot.length()) + (-1)) == '.';
        }
        return false;
    }

    private static boolean matchIdentity(String host, String identity, PublicSuffixMatcher publicSuffixMatcher, boolean strict) {
        if (publicSuffixMatcher != null && host.contains(".") && !matchDomainRoot(host, publicSuffixMatcher.getDomainRoot(identity))) {
            return false;
        }
        int asteriskIdx = identity.indexOf(42);
        if (asteriskIdx != -1) {
            String prefix = identity.substring(0, asteriskIdx);
            String suffix = identity.substring(asteriskIdx + 1);
            if (!prefix.isEmpty() && !host.startsWith(prefix)) {
                return false;
            }
            if (!suffix.isEmpty() && !host.endsWith(suffix)) {
                return false;
            }
            if (strict) {
                String remainder = host.substring(prefix.length(), host.length() - suffix.length());
                if (remainder.contains(".")) {
                    return false;
                }
            }
            return true;
        }
        return host.equalsIgnoreCase(identity);
    }

    static boolean matchIdentity(String host, String identity, PublicSuffixMatcher publicSuffixMatcher) {
        return matchIdentity(host, identity, publicSuffixMatcher, false);
    }

    static boolean matchIdentity(String host, String identity) {
        return matchIdentity(host, identity, null, false);
    }

    static boolean matchIdentityStrict(String host, String identity, PublicSuffixMatcher publicSuffixMatcher) {
        return matchIdentity(host, identity, publicSuffixMatcher, true);
    }

    static boolean matchIdentityStrict(String host, String identity) {
        return matchIdentity(host, identity, null, true);
    }

    static List<String> extractSubjectAlts(X509Certificate cert, int subjectType) throws CertificateParsingException {
        Collection<List<?>> c = null;
        try {
            c = cert.getSubjectAlternativeNames();
        } catch (CertificateParsingException e) {
        }
        List<String> subjectAltList = null;
        if (c != null) {
            for (List<?> aC : c) {
                int type = ((Integer) aC.get(0)).intValue();
                if (type == subjectType) {
                    String s = (String) aC.get(1);
                    if (subjectAltList == null) {
                        subjectAltList = new ArrayList<>();
                    }
                    subjectAltList.add(s);
                }
            }
        }
        return subjectAltList;
    }

    static String normaliseAddress(String hostname) throws UnknownHostException {
        if (hostname != null) {
            try {
                InetAddress inetAddress = InetAddress.getByName(hostname);
                return inetAddress.getHostAddress();
            } catch (UnknownHostException e) {
                return hostname;
            }
        }
        return hostname;
    }
}
