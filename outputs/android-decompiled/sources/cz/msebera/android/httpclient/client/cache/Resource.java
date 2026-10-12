package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface Resource extends Serializable {
    void dispose();

    InputStream getInputStream() throws IOException;

    long length();
}
