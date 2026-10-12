package cz.msebera.android.httpclient.entity;

import com.loopj.android.http.RequestParams;
import cz.msebera.android.httpclient.Consts;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.message.BasicHeaderValueFormatter;
import cz.msebera.android.httpclient.message.BasicHeaderValueParser;
import cz.msebera.android.httpclient.message.BasicNameValuePair;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import cz.msebera.android.httpclient.util.TextUtils;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.httpclient.methods.MultipartPostMethod;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class ContentType implements Serializable {
    private static final long serialVersionUID = -7768694718232371896L;
    private final Charset charset;
    private final String mimeType;
    private final NameValuePair[] params;
    public static final ContentType APPLICATION_ATOM_XML = create("application/atom+xml", Consts.ISO_8859_1);
    public static final ContentType APPLICATION_FORM_URLENCODED = create("application/x-www-form-urlencoded", Consts.ISO_8859_1);
    public static final ContentType APPLICATION_JSON = create(RequestParams.APPLICATION_JSON, Consts.UTF_8);
    public static final ContentType APPLICATION_OCTET_STREAM = create("application/octet-stream", (Charset) null);
    public static final ContentType APPLICATION_SVG_XML = create("application/svg+xml", Consts.ISO_8859_1);
    public static final ContentType APPLICATION_XHTML_XML = create("application/xhtml+xml", Consts.ISO_8859_1);
    public static final ContentType APPLICATION_XML = create("application/xml", Consts.ISO_8859_1);
    public static final ContentType MULTIPART_FORM_DATA = create(MultipartPostMethod.MULTIPART_FORM_CONTENT_TYPE, Consts.ISO_8859_1);
    public static final ContentType TEXT_HTML = create("text/html", Consts.ISO_8859_1);
    public static final ContentType TEXT_PLAIN = create("text/plain", Consts.ISO_8859_1);
    public static final ContentType TEXT_XML = create("text/xml", Consts.ISO_8859_1);
    public static final ContentType WILDCARD = create("*/*", (Charset) null);
    public static final ContentType DEFAULT_TEXT = TEXT_PLAIN;
    public static final ContentType DEFAULT_BINARY = APPLICATION_OCTET_STREAM;

    ContentType(String mimeType, Charset charset) {
        this.mimeType = mimeType;
        this.charset = charset;
        this.params = null;
    }

    ContentType(String mimeType, Charset charset, NameValuePair[] params) {
        this.mimeType = mimeType;
        this.charset = charset;
        this.params = params;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public Charset getCharset() {
        return this.charset;
    }

    public String getParameter(String name) {
        Args.notEmpty(name, "Parameter name");
        if (this.params == null) {
            return null;
        }
        for (NameValuePair param : this.params) {
            if (param.getName().equalsIgnoreCase(name)) {
                return param.getValue();
            }
        }
        return null;
    }

    public String toString() {
        CharArrayBuffer buf = new CharArrayBuffer(64);
        buf.append(this.mimeType);
        if (this.params != null) {
            buf.append("; ");
            BasicHeaderValueFormatter.INSTANCE.formatParameters(buf, this.params, false);
        } else if (this.charset != null) {
            buf.append("; charset=");
            buf.append(this.charset.name());
        }
        return buf.toString();
    }

    private static boolean valid(String s) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch == '\"' || ch == ',' || ch == ';') {
                return false;
            }
        }
        return true;
    }

    public static ContentType create(String mimeType, Charset charset) {
        String type = ((String) Args.notBlank(mimeType, "MIME type")).toLowerCase(Locale.ROOT);
        Args.check(valid(type), "MIME type may not contain reserved characters");
        return new ContentType(type, charset);
    }

    public static ContentType create(String mimeType) {
        return new ContentType(mimeType, (Charset) null);
    }

    public static ContentType create(String mimeType, String charset) throws UnsupportedCharsetException {
        return create(mimeType, !TextUtils.isBlank(charset) ? Charset.forName(charset) : null);
    }

    private static ContentType create(HeaderElement helem, boolean strict) {
        return create(helem.getName(), helem.getParameters(), strict);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0023, code lost:
    
        if (r9 == null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0026, code lost:
    
        if (r9.length <= 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002b, code lost:
    
        return new cz.msebera.android.httpclient.entity.ContentType(r8, r0, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0033, code lost:
    
        r9 = null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static cz.msebera.android.httpclient.entity.ContentType create(java.lang.String r8, cz.msebera.android.httpclient.NameValuePair[] r9, boolean r10) {
        /*
            r0 = 0
            int r5 = r9.length
            r4 = 0
        L3:
            if (r4 >= r5) goto L21
            r2 = r9[r4]
            java.lang.String r6 = r2.getName()
            java.lang.String r7 = "charset"
            boolean r6 = r6.equalsIgnoreCase(r7)
            if (r6 == 0) goto L30
            java.lang.String r3 = r2.getValue()
            boolean r4 = cz.msebera.android.httpclient.util.TextUtils.isBlank(r3)
            if (r4 != 0) goto L21
            java.nio.charset.Charset r0 = java.nio.charset.Charset.forName(r3)     // Catch: java.nio.charset.UnsupportedCharsetException -> L2c
        L21:
            cz.msebera.android.httpclient.entity.ContentType r4 = new cz.msebera.android.httpclient.entity.ContentType
            if (r9 == 0) goto L33
            int r5 = r9.length
            if (r5 <= 0) goto L33
        L28:
            r4.<init>(r8, r0, r9)
            return r4
        L2c:
            r1 = move-exception
            if (r10 == 0) goto L21
            throw r1
        L30:
            int r4 = r4 + 1
            goto L3
        L33:
            r9 = 0
            goto L28
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.entity.ContentType.create(java.lang.String, cz.msebera.android.httpclient.NameValuePair[], boolean):cz.msebera.android.httpclient.entity.ContentType");
    }

    public static ContentType create(String mimeType, NameValuePair... params) throws UnsupportedCharsetException {
        String type = ((String) Args.notBlank(mimeType, "MIME type")).toLowerCase(Locale.ROOT);
        Args.check(valid(type), "MIME type may not contain reserved characters");
        return create(mimeType, params, true);
    }

    public static ContentType parse(String s) throws ParseException, UnsupportedCharsetException {
        Args.notNull(s, "Content type");
        CharArrayBuffer buf = new CharArrayBuffer(s.length());
        buf.append(s);
        ParserCursor cursor = new ParserCursor(0, s.length());
        HeaderElement[] elements = BasicHeaderValueParser.INSTANCE.parseElements(buf, cursor);
        if (elements.length > 0) {
            return create(elements[0], true);
        }
        throw new ParseException("Invalid content type: " + s);
    }

    public static ContentType get(HttpEntity entity) throws ParseException, UnsupportedCharsetException {
        Header header;
        if (entity == null || (header = entity.getContentType()) == null) {
            return null;
        }
        HeaderElement[] elements = header.getElements();
        if (elements.length > 0) {
            return create(elements[0], true);
        }
        return null;
    }

    public static ContentType getLenient(HttpEntity entity) {
        Header header;
        if (entity == null || (header = entity.getContentType()) == null) {
            return null;
        }
        try {
            HeaderElement[] elements = header.getElements();
            if (elements.length > 0) {
                return create(elements[0], false);
            }
            return null;
        } catch (ParseException e) {
            return null;
        }
    }

    public static ContentType getOrDefault(HttpEntity entity) throws ParseException, UnsupportedCharsetException {
        ContentType contentType = get(entity);
        return contentType != null ? contentType : DEFAULT_TEXT;
    }

    public static ContentType getLenientOrDefault(HttpEntity entity) throws ParseException, UnsupportedCharsetException {
        ContentType contentType = get(entity);
        return contentType != null ? contentType : DEFAULT_TEXT;
    }

    public ContentType withCharset(Charset charset) {
        return create(getMimeType(), charset);
    }

    public ContentType withCharset(String charset) {
        return create(getMimeType(), charset);
    }

    public ContentType withParameters(NameValuePair... params) throws UnsupportedCharsetException {
        if (params.length != 0) {
            Map<String, String> paramMap = new LinkedHashMap<>();
            if (this.params != null) {
                for (NameValuePair param : this.params) {
                    paramMap.put(param.getName(), param.getValue());
                }
            }
            for (NameValuePair param2 : params) {
                paramMap.put(param2.getName(), param2.getValue());
            }
            List<NameValuePair> newParams = new ArrayList<>(paramMap.size() + 1);
            if (this.charset != null && !paramMap.containsKey("charset")) {
                newParams.add(new BasicNameValuePair("charset", this.charset.name()));
            }
            for (Map.Entry<String, String> entry : paramMap.entrySet()) {
                newParams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
            }
            return create(getMimeType(), (NameValuePair[]) newParams.toArray(new NameValuePair[newParams.size()]), true);
        }
        return this;
    }
}
