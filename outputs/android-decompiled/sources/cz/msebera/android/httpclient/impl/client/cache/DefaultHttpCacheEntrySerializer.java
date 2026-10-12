package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntrySerializationException;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntrySerializer;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultHttpCacheEntrySerializer implements HttpCacheEntrySerializer {
    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheEntrySerializer
    public void writeTo(HttpCacheEntry cacheEntry, OutputStream os) throws IOException {
        ObjectOutputStream oos = new ObjectOutputStream(os);
        try {
            oos.writeObject(cacheEntry);
        } finally {
            oos.close();
        }
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheEntrySerializer
    public HttpCacheEntry readFrom(InputStream is) throws IOException {
        ObjectInputStream ois = new ObjectInputStream(is);
        try {
            try {
                return (HttpCacheEntry) ois.readObject();
            } catch (ClassNotFoundException ex) {
                throw new HttpCacheEntrySerializationException("Class not found: " + ex.getMessage(), ex);
            }
        } finally {
            ois.close();
        }
    }
}
