package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.FormattedHeader;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.annotation.Obsolete;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.cookie.CommonCookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.message.BufferedHeader;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.ArrayList;
import java.util.List;

@Obsolete
@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NetscapeDraftSpec extends CookieSpecBase {
    protected static final String EXPIRES_PATTERN = "EEE, dd-MMM-yy HH:mm:ss z";

    /* JADX WARN: Illegal instructions before constructor call */
    public NetscapeDraftSpec(String[] datepatterns) {
        CommonCookieAttributeHandler[] commonCookieAttributeHandlerArr = new CommonCookieAttributeHandler[5];
        commonCookieAttributeHandlerArr[0] = new BasicPathHandler();
        commonCookieAttributeHandlerArr[1] = new NetscapeDomainHandler();
        commonCookieAttributeHandlerArr[2] = new BasicSecureHandler();
        commonCookieAttributeHandlerArr[3] = new BasicCommentHandler();
        commonCookieAttributeHandlerArr[4] = new BasicExpiresHandler(datepatterns != null ? (String[]) datepatterns.clone() : new String[]{EXPIRES_PATTERN});
        super(commonCookieAttributeHandlerArr);
    }

    NetscapeDraftSpec(CommonCookieAttributeHandler... handlers) {
        super(handlers);
    }

    public NetscapeDraftSpec() {
        this((String[]) null);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public List<Cookie> parse(Header header, CookieOrigin origin) throws MalformedCookieException {
        CharArrayBuffer buffer;
        ParserCursor cursor;
        Args.notNull(header, "Header");
        Args.notNull(origin, "Cookie origin");
        if (!header.getName().equalsIgnoreCase(SM.SET_COOKIE)) {
            throw new MalformedCookieException("Unrecognized cookie header '" + header.toString() + "'");
        }
        NetscapeDraftHeaderParser parser = NetscapeDraftHeaderParser.DEFAULT;
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
        return parse(new HeaderElement[]{parser.parseHeader(buffer, cursor)}, origin);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public List<Header> formatCookies(List<Cookie> cookies) {
        Args.notEmpty(cookies, "List of cookies");
        CharArrayBuffer buffer = new CharArrayBuffer(cookies.size() * 20);
        buffer.append(SM.COOKIE);
        buffer.append(": ");
        for (int i = 0; i < cookies.size(); i++) {
            Cookie cookie = cookies.get(i);
            if (i > 0) {
                buffer.append("; ");
            }
            buffer.append(cookie.getName());
            String s = cookie.getValue();
            if (s != null) {
                buffer.append("=");
                buffer.append(s);
            }
        }
        List<Header> headers = new ArrayList<>(1);
        headers.add(new BufferedHeader(buffer));
        return headers;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public int getVersion() {
        return 0;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpec
    public Header getVersionHeader() {
        return null;
    }

    public String toString() {
        return "netscape";
    }
}
