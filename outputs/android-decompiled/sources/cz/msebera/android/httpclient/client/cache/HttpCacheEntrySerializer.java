package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpCacheEntrySerializer {
    HttpCacheEntry readFrom(InputStream inputStream) throws IOException;

    void writeTo(HttpCacheEntry httpCacheEntry, OutputStream outputStream) throws IOException;
}
