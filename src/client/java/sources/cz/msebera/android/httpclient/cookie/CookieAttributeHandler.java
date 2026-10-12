package cz.msebera.android.httpclient.cookie;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface CookieAttributeHandler {
    boolean match(Cookie cookie, CookieOrigin cookieOrigin);

    void parse(SetCookie setCookie, String str) throws MalformedCookieException;

    void validate(Cookie cookie, CookieOrigin cookieOrigin) throws MalformedCookieException;
}
