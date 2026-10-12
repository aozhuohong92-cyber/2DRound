package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.TextUtils;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class LaxMaxAgeHandler extends AbstractCookieAttributeHandler implements CommonCookieAttributeHandler {
    private static final Pattern MAX_AGE_PATTERN = Pattern.compile("^\\-?[0-9]+$");

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException, NumberFormatException {
        Args.notNull(cookie, SM.COOKIE);
        if (!TextUtils.isBlank(value)) {
            Matcher matcher = MAX_AGE_PATTERN.matcher(value);
            if (matcher.matches()) {
                try {
                    int age = Integer.parseInt(value);
                    Date expiryDate = age >= 0 ? new Date(System.currentTimeMillis() + (age * 1000)) : new Date(Long.MIN_VALUE);
                    cookie.setExpiryDate(expiryDate);
                } catch (NumberFormatException e) {
                }
            }
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler
    public String getAttributeName() {
        return "max-age";
    }
}
