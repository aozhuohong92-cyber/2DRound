package org.apache.http.entity;

import com.loopj.android.http.RequestParams;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.httpclient.methods.MultipartPostMethod;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.message.BasicHeaderValueFormatter;
import org.apache.http.message.BasicHeaderValueParser;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.TextUtils;

@Contract(threading = ThreadingBehavior.IMMUTABLE)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class ContentType implements Serializable {
    private static final Map<String, ContentType> CONTENT_TYPE_MAP;
    public static final ContentType DEFAULT_BINARY;
    public static final ContentType DEFAULT_TEXT;
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
    public static final ContentType IMAGE_BMP = create("image/bmp");
    public static final ContentType IMAGE_GIF = create("image/gif");
    public static final ContentType IMAGE_JPEG = create("image/jpeg");
    public static final ContentType IMAGE_PNG = create("image/png");
    public static final ContentType IMAGE_SVG = create("image/svg+xml");
    public static final ContentType IMAGE_TIFF = create("image/tiff");
    public static final ContentType IMAGE_WEBP = create("image/webp");
    public static final ContentType MULTIPART_FORM_DATA = create(MultipartPostMethod.MULTIPART_FORM_CONTENT_TYPE, Consts.ISO_8859_1);
    public static final ContentType TEXT_HTML = create("text/html", Consts.ISO_8859_1);
    public static final ContentType TEXT_PLAIN = create("text/plain", Consts.ISO_8859_1);
    public static final ContentType TEXT_XML = create("text/xml", Consts.ISO_8859_1);
    public static final ContentType WILDCARD = create("*/*", (Charset) null);

    static {
        ContentType[] contentTypes = {APPLICATION_ATOM_XML, APPLICATION_FORM_URLENCODED, APPLICATION_JSON, APPLICATION_SVG_XML, APPLICATION_XHTML_XML, APPLICATION_XML, IMAGE_BMP, IMAGE_GIF, IMAGE_JPEG, IMAGE_PNG, IMAGE_SVG, IMAGE_TIFF, IMAGE_WEBP, MULTIPART_FORM_DATA, TEXT_HTML, TEXT_PLAIN, TEXT_XML};
        HashMap<String, ContentType> map = new HashMap<>();
        for (ContentType contentType : contentTypes) {
            map.put(contentType.getMimeType(), contentType);
        }
        CONTENT_TYPE_MAP = Collections.unmodifiableMap(map);
        DEFAULT_TEXT = TEXT_PLAIN;
        DEFAULT_BINARY = APPLICATION_OCTET_STREAM;
    }

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
        NameValuePair[] arr$ = this.params;
        for (NameValuePair param : arr$) {
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
        String normalizedMimeType = ((String) Args.notBlank(mimeType, "MIME type")).toLowerCase(Locale.ROOT);
        Args.check(valid(normalizedMimeType), "MIME type may not contain reserved characters");
        return new ContentType(normalizedMimeType, charset);
    }

    public static ContentType create(String mimeType) {
        return create(mimeType, (Charset) null);
    }

    public static ContentType create(String mimeType, String charset) throws UnsupportedCharsetException {
        return create(mimeType, !TextUtils.isBlank(charset) ? Charset.forName(charset) : null);
    }

    private static ContentType create(HeaderElement helem, boolean strict) {
        return create(helem.getName(), helem.getParameters(), strict);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0024, code lost:
    
        if (r10 == null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0027, code lost:
    
        if (r10.length <= 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002c, code lost:
    
        return new org.apache.http.entity.ContentType(r9, r1, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0034, code lost:
    
        r10 = null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static org.apache.http.entity.ContentType create(java.lang.String r9, org.apache.http.NameValuePair[] r10, boolean r11) {
        /*
            r1 = 0
            r0 = r10
            int r4 = r0.length
            r3 = 0
        L4:
            if (r3 >= r4) goto L22
            r5 = r0[r3]
            java.lang.String r7 = r5.getName()
            java.lang.String r8 = "charset"
            boolean r7 = r7.equalsIgnoreCase(r8)
            if (r7 == 0) goto L31
            java.lang.String r6 = r5.getValue()
            boolean r7 = org.apache.http.util.TextUtils.isBlank(r6)
            if (r7 != 0) goto L22
            java.nio.charset.Charset r1 = java.nio.charset.Charset.forName(r6)     // Catch: java.nio.charset.UnsupportedCharsetException -> L2d
        L22:
            org.apache.http.entity.ContentType r7 = new org.apache.http.entity.ContentType
            if (r10 == 0) goto L34
            int r8 = r10.length
            if (r8 <= 0) goto L34
        L29:
            r7.<init>(r9, r1, r10)
            return r7
        L2d:
            r2 = move-exception
            if (r11 == 0) goto L22
            throw r2
        L31:
            int r3 = r3 + 1
            goto L4
        L34:
            r10 = 0
            goto L29
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.entity.ContentType.create(java.lang.String, org.apache.http.NameValuePair[], boolean):org.apache.http.entity.ContentType");
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

    public static ContentType getByMimeType(String mimeType) {
        if (mimeType == null) {
            return null;
        }
        return CONTENT_TYPE_MAP.get(mimeType);
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
                NameValuePair[] arr$ = this.params;
                for (NameValuePair param : arr$) {
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
