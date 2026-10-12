package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.FormattedHeader;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.cookie.ClientCookie;
import cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.CookiePriorityComparator;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.message.BufferedHeader;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.message.TokenParser;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class RFC6265CookieSpecBase implements CookieSpec {
    private static final char COMMA_CHAR = ',';
    private static final char DQUOTE_CHAR = '\"';
    private static final char EQUAL_CHAR = '=';
    private static final char ESCAPE_CHAR = '\\';
    private static final char PARAM_DELIMITER = ';';
    private final Map<String, CookieAttributeHandler> attribHandlerMap;
    private final CookieAttributeHandler[] attribHandlers;
    private final TokenParser tokenParser;
    private static final BitSet TOKEN_DELIMS = TokenParser.INIT_BITSET(61, 59);
    private static final BitSet VALUE_DELIMS = TokenParser.INIT_BITSET(59);
    private static final BitSet SPECIAL_CHARS = TokenParser.INIT_BITSET(32, 34, 44, 59, 92);

    RFC6265CookieSpecBase(CommonCookieAttributeHandler... handlers) {
        this.attribHandlers = (CookieAttributeHandler[]) handlers.clone();
        this.attribHandlerMap = new ConcurrentHashMap(handlers.length);
        for (CommonCookieAttributeHandler handler : handlers) {
            this.attribHandlerMap.put(handler.getAttributeName().toLowerCase(Locale.ROOT), handler);
        }
        this.tokenParser = TokenParser.INSTANCE;
    }

    static String getDefaultPath(CookieOrigin origin) {
        String defaultPath = origin.getPath();
        int lastSlashIndex = defaultPath.lastIndexOf(47);
        if (lastSlashIndex >= 0) {
            if (lastSlashIndex == 0) {
                lastSlashIndex = 1;
            }
            return defaultPath.substring(0, lastSlashIndex);
        }
        return defaultPath;
    }

    static String getDefaultDomain(CookieOrigin origin) {
        return origin.getHost();
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public final List<Cookie> parse(Header header, CookieOrigin origin) throws MalformedCookieException {
        CharArrayBuffer buffer;
        ParserCursor cursor;
        Args.notNull(header, "Header");
        Args.notNull(origin, "Cookie origin");
        if (!header.getName().equalsIgnoreCase(SM.SET_COOKIE)) {
            throw new MalformedCookieException("Unrecognized cookie header: '" + header.toString() + "'");
        }
        if (header instanceof FormattedHeader) {
            buffer = ((FormattedHeader) header).getBuffer();
            cursor = new ParserCursor(((FormattedHeader) header).getValuePos(), buffer.length());
        } else {
            String s = header.getValue();
            if (s == null) {
                throw new MalformedCookieException("Header value is null");
            }
            buffer = new CharArrayBuffer(s.length());
            buffer.append(s);
            cursor = new ParserCursor(0, buffer.length());
        }
        String name = this.tokenParser.parseToken(buffer, cursor, TOKEN_DELIMS);
        if (name.length() == 0) {
            throw new MalformedCookieException("Cookie name is invalid: '" + header.toString() + "'");
        }
        if (cursor.atEnd()) {
            throw new MalformedCookieException("Cookie value is invalid: '" + header.toString() + "'");
        }
        int valueDelim = buffer.charAt(cursor.getPos());
        cursor.updatePos(cursor.getPos() + 1);
        if (valueDelim != 61) {
            throw new MalformedCookieException("Cookie value is invalid: '" + header.toString() + "'");
        }
        String value = this.tokenParser.parseValue(buffer, cursor, VALUE_DELIMS);
        if (!cursor.atEnd()) {
            cursor.updatePos(cursor.getPos() + 1);
        }
        BasicClientCookie cookie = new BasicClientCookie(name, value);
        cookie.setPath(getDefaultPath(origin));
        cookie.setDomain(getDefaultDomain(origin));
        cookie.setCreationDate(new Date());
        Map<String, String> attribMap = new LinkedHashMap<>();
        while (!cursor.atEnd()) {
            String paramName = this.tokenParser.parseToken(buffer, cursor, TOKEN_DELIMS);
            String paramValue = null;
            if (!cursor.atEnd()) {
                int paramDelim = buffer.charAt(cursor.getPos());
                cursor.updatePos(cursor.getPos() + 1);
                if (paramDelim == 61) {
                    paramValue = this.tokenParser.parseToken(buffer, cursor, VALUE_DELIMS);
                    if (!cursor.atEnd()) {
                        cursor.updatePos(cursor.getPos() + 1);
                    }
                }
            }
            cookie.setAttribute(paramName.toLowerCase(Locale.ROOT), paramValue);
            attribMap.put(paramName, paramValue);
        }
        if (attribMap.containsKey("max-age")) {
            attribMap.remove(ClientCookie.EXPIRES_ATTR);
        }
        for (Map.Entry<String, String> entry : attribMap.entrySet()) {
            String paramName2 = entry.getKey();
            String paramValue2 = entry.getValue();
            CookieAttributeHandler handler = this.attribHandlerMap.get(paramName2);
            if (handler != null) {
                handler.parse(cookie, paramValue2);
            }
        }
        return Collections.singletonList(cookie);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public final void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        for (CookieAttributeHandler handler : this.attribHandlers) {
            handler.validate(cookie, origin);
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public final boolean match(Cookie cookie, CookieOrigin origin) {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        for (CookieAttributeHandler handler : this.attribHandlers) {
            if (!handler.match(cookie, origin)) {
                return false;
            }
        }
        return true;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public List<Header> formatCookies(List<Cookie> cookies) {
        List<? extends Cookie> sortedCookies;
        Args.notEmpty(cookies, "List of cookies");
        if (cookies.size() > 1) {
            sortedCookies = new ArrayList<>(cookies);
            Collections.sort(sortedCookies, CookiePriorityComparator.INSTANCE);
        } else {
            sortedCookies = cookies;
        }
        CharArrayBuffer buffer = new CharArrayBuffer(sortedCookies.size() * 20);
        buffer.append(SM.COOKIE);
        buffer.append(": ");
        for (int n = 0; n < sortedCookies.size(); n++) {
            Cookie cookie = sortedCookies.get(n);
            if (n > 0) {
                buffer.append(PARAM_DELIMITER);
                buffer.append(' ');
            }
            buffer.append(cookie.getName());
            String s = cookie.getValue();
            if (s != null) {
                buffer.append(EQUAL_CHAR);
                if (containsSpecialChar(s)) {
                    buffer.append('\"');
                    for (int i = 0; i < s.length(); i++) {
                        char ch = s.charAt(i);
                        if (ch == '\"' || ch == '\\') {
                            buffer.append('\\');
                        }
                        buffer.append(ch);
                    }
                    buffer.append('\"');
                } else {
                    buffer.append(s);
                }
            }
        }
        List<Header> headers = new ArrayList<>(1);
        headers.add(new BufferedHeader(buffer));
        return headers;
    }

    boolean containsSpecialChar(CharSequence s) {
        return containsChars(s, SPECIAL_CHARS);
    }

    boolean containsChars(CharSequence s, BitSet chars) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (chars.get(ch)) {
                return true;
            }
        }
        return false;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public final int getVersion() {
        return 0;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public final Header getVersionHeader() {
        return null;
    }
}
