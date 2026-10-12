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
import cz.msebera.android.httpclient.util.TextUtils;
import org.apache.commons.httpclient.cookie.CookieSpec;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicPathHandler implements CommonCookieAttributeHandler {
    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        if (TextUtils.isBlank(value)) {
            value = CookieSpec.PATH_DELIM;
        }
        cookie.setPath(value);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
        if (!match(cookie, origin)) {
            throw new CookieRestrictionViolationException("Illegal 'path' attribute \"" + cookie.getPath() + "\". Path of origin: \"" + origin.getPath() + "\"");
        }
    }

    static boolean pathMatch(String uriPath, String cookiePath) {
        String normalizedCookiePath = cookiePath;
        if (normalizedCookiePath == null) {
            normalizedCookiePath = CookieSpec.PATH_DELIM;
        }
        if (normalizedCookiePath.length() > 1 && normalizedCookiePath.endsWith(CookieSpec.PATH_DELIM)) {
            normalizedCookiePath = normalizedCookiePath.substring(0, normalizedCookiePath.length() - 1);
        }
        return uriPath.startsWith(normalizedCookiePath) && (normalizedCookiePath.equals(CookieSpec.PATH_DELIM) || uriPath.length() == normalizedCookiePath.length() || uriPath.charAt(normalizedCookiePath.length()) == '/');
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public boolean match(Cookie cookie, CookieOrigin origin) {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        return pathMatch(origin.getPath(), cookie.getPath());
    }

    @Override // cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler
    public String getAttributeName() {
        return "path";
    }
}
