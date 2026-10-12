package org.apache.http.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.entity.ContentType;
import org.apache.http.protocol.HTTP;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class EntityUtils {
    private static final int DEFAULT_BUFFER_SIZE = 4096;

    private EntityUtils() {
    }

    public static void consumeQuietly(HttpEntity entity) {
        try {
            consume(entity);
        } catch (IOException e) {
        }
    }

    public static void consume(HttpEntity entity) throws IOException {
        InputStream inStream;
        if (entity != null && entity.isStreaming() && (inStream = entity.getContent()) != null) {
            inStream.close();
        }
    }

    public static void updateEntity(HttpResponse response, HttpEntity entity) throws IOException {
        Args.notNull(response, "Response");
        consume(response.getEntity());
        response.setEntity(entity);
    }

    public static byte[] toByteArray(HttpEntity entity) throws UnsupportedOperationException, IOException {
        Args.notNull(entity, "Entity");
        InputStream inStream = entity.getContent();
        if (inStream == null) {
            return null;
        }
        try {
            Args.check(entity.getContentLength() <= 2147483647L, "HTTP entity too large to be buffered in memory");
            int capacity = (int) entity.getContentLength();
            if (capacity < 0) {
                capacity = 4096;
            }
            ByteArrayBuffer buffer = new ByteArrayBuffer(capacity);
            byte[] tmp = new byte[4096];
            while (true) {
                int l = inStream.read(tmp);
                if (l != -1) {
                    buffer.append(tmp, 0, l);
                } else {
                    return buffer.toByteArray();
                }
            }
        } finally {
            inStream.close();
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

    private static String toString(HttpEntity entity, ContentType contentType) throws UnsupportedOperationException, IOException {
        String string = null;
        InputStream inStream = entity.getContent();
        if (inStream != null) {
            try {
                Args.check(entity.getContentLength() <= 2147483647L, "HTTP entity too large to be buffered in memory");
                int capacity = (int) entity.getContentLength();
                if (capacity < 0) {
                    capacity = 4096;
                }
                Charset charset = null;
                if (contentType != null && (charset = contentType.getCharset()) == null) {
                    ContentType defaultContentType = ContentType.getByMimeType(contentType.getMimeType());
                    charset = defaultContentType != null ? defaultContentType.getCharset() : null;
                }
                if (charset == null) {
                    charset = HTTP.DEF_CONTENT_CHARSET;
                }
                Reader reader = new InputStreamReader(inStream, charset);
                CharArrayBuffer buffer = new CharArrayBuffer(capacity);
                char[] tmp = new char[1024];
                while (true) {
                    int l = reader.read(tmp);
                    if (l == -1) {
                        break;
                    }
                    buffer.append(tmp, 0, l);
                }
                string = buffer.toString();
            } finally {
                inStream.close();
            }
        }
        return string;
    }

    public static String toString(HttpEntity entity, Charset defaultCharset) throws ParseException, IOException {
        Args.notNull(entity, "Entity");
        ContentType contentType = null;
        try {
            contentType = ContentType.get(entity);
        } catch (UnsupportedCharsetException ex) {
            if (defaultCharset == null) {
                throw new UnsupportedEncodingException(ex.getMessage());
            }
        }
        if (contentType != null) {
            if (contentType.getCharset() == null) {
                contentType = contentType.withCharset(defaultCharset);
            }
        } else {
            contentType = ContentType.DEFAULT_TEXT.withCharset(defaultCharset);
        }
        return toString(entity, contentType);
    }

    public static String toString(HttpEntity entity, String defaultCharset) throws ParseException, IOException {
        return toString(entity, defaultCharset != null ? Charset.forName(defaultCharset) : null);
    }

    public static String toString(HttpEntity entity) throws ParseException, IOException {
        Args.notNull(entity, "Entity");
        return toString(entity, ContentType.get(entity));
    }
}
