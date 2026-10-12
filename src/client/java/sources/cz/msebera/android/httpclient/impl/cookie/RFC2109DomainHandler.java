package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.CookieRestrictionViolationException;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.util.Args;
import java.util.Locale;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RFC2109DomainHandler implements CommonCookieAttributeHandler {
    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        if (value == null) {
            throw new MalformedCookieException("Missing value for domain attribute");
        }
        if (value.trim().isEmpty()) {
            throw new MalformedCookieException("Blank value for domain attribute");
        }
        cookie.setDomain(value);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        String host = origin.getHost();
        String domain = cookie.getDomain();
        if (domain == null) {
            throw new CookieRestrictionViolationException("Cookie domain may not be null");
        }
        if (!domain.equals(host)) {
            if (domain.indexOf(46) == -1) {
                throw new CookieRestrictionViolationException("Domain attribute \"" + domain + "\" does not match the host \"" + host + "\"");
            }
            if (!domain.startsWith(".")) {
                throw new CookieRestrictionViolationException("Domain attribute \"" + domain + "\" violates RFC 2109: domain must start with a dot");
            }
            int dotIndex = domain.indexOf(46, 1);
            if (dotIndex < 0 || dotIndex == domain.length() - 1) {
                throw new CookieRestrictionViolationException("Domain attribute \"" + domain + "\" violates RFC 2109: domain must contain an embedded dot");
            }
            String host2 = host.toLowerCase(Locale.ROOT);
            if (!host2.endsWith(domain)) {
                throw new CookieRestrictionViolationException("Illegal domain attribute \"" + domain + "\". Domain of origin: \"" + host2 + "\"");
            }
            String hostWithoutDomain = host2.substring(0, host2.length() - domain.length());
            if (hostWithoutDomain.indexOf(46) != -1) {
                throw new CookieRestrictionViolationException("Domain attribute \"" + domain + "\" violates RFC 2109: host minus domain may not contain any dots");
            }
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public boolean match(Cookie cookie, CookieOrigin origin) {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        String host = origin.getHost();
        String domain = cookie.getDomain();
        if (domain == null) {
            return false;
        }
        return host.equals(domain) || (domain.startsWith(".") && host.endsWith(domain));
    }

    @Override // cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler
    public String getAttributeName() {
        return "domain";
    }
}
