package cz.msebera.android.httpclient.util;

import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.protocol.HTTP;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class EntityUtils {
    private EntityUtils() {
    }

    public static void consumeQuietly(HttpEntity entity) {
        try {
            consume(entity);
        } catch (IOException e) {
        }
    }

    public static void consume(HttpEntity entity) throws IOException {
        InputStream instream;
        if (entity != null && entity.isStreaming() && (instream = entity.getContent()) != null) {
            instream.close();
        }
    }

    public static void updateEntity(HttpResponse response, HttpEntity entity) throws IOException {
        Args.notNull(response, "Response");
        consume(response.getEntity());
        response.setEntity(entity);
    }

    public static byte[] toByteArray(HttpEntity entity) throws UnsupportedOperationException, IOException {
        Args.notNull(entity, "Entity");
        InputStream instream = entity.getContent();
        if (instream == null) {
            return null;
        }
        try {
            Args.check(entity.getContentLength() <= 2147483647L, "HTTP entity too large to be buffered in memory");
            int i = (int) entity.getContentLength();
            if (i < 0) {
                i = 4096;
            }
            ByteArrayBuffer buffer = new ByteArrayBuffer(i);
            byte[] tmp = new byte[4096];
            while (true) {
                int l = instream.read(tmp);
                if (l != -1) {
                    buffer.append(tmp, 0, l);
                } else {
                    return buffer.toByteArray();
                }
            }
        } finally {
            instream.close();
        }
    }

    @Deprecated
    public static String getContentCharSet(HttpEntity entity) throws ParseException {
        NameValuePair param;
        Args.notNull(entity, "Entity");
        if (entity.getContentType() == null) {
            return null;
        }
        HeaderElement[] values = entity.getContentType().getElements();
        if (values.length <= 0 || (param = values[0].getParameterByName("charset")) == null) {
            return null;
        }
        String charset = param.getValue();
        return charset;
    }

    @Deprecated
    public static String getContentMimeType(HttpEntity entity) throws ParseException {
        Args.notNull(entity, "Entity");
        if (entity.getContentType() == null) {
            return null;
        }
        HeaderElement[] values = entity.getContentType().getElements();
        if (values.length <= 0) {
            return null;
        }
        String mimeType = values[0].getName();
        return mimeType;
    }

    public static String toString(HttpEntity entity, Charset defaultCharset) throws UnsupportedOperationException, ParseException, IOException {
        Args.notNull(entity, "Entity");
        InputStream instream = entity.getContent();
        if (instream == null) {
            return null;
        }
        try {
            Args.check(entity.getContentLength() <= 2147483647L, "HTTP entity too large to be buffered in memory");
            int i = (int) entity.getContentLength();
            if (i < 0) {
                i = 4096;
            }
            Charset charset = null;
            try {
                ContentType contentType = ContentType.get(entity);
                if (contentType != null) {
                    charset = contentType.getCharset();
                }
            } catch (UnsupportedCharsetException ex) {
                if (defaultCharset == null) {
                    throw new UnsupportedEncodingException(ex.getMessage());
                }
            }
            if (charset == null) {
                charset = defaultCharset;
            }
            if (charset == null) {
                charset = HTTP.DEF_CONTENT_CHARSET;
            }
            Reader reader = new InputStreamReader(instream, charset);
            CharArrayBuffer buffer = new CharArrayBuffer(i);
            char[] tmp = new char[1024];
            while (true) {
                int l = reader.read(tmp);
                if (l != -1) {
                    buffer.append(tmp, 0, l);
                } else {
                    return buffer.toString();
                }
            }
        } finally {
            instream.close();
        }
    }

    public static String toString(HttpEntity entity, String defaultCharset) throws ParseException, IOException {
        return toString(entity, defaultCharset != null ? Charset.forName(defaultCharset) : null);
    }

    public static String toString(HttpEntity entity) throws ParseException, IOException {
        return toString(entity, (Charset) null);
    }
}
