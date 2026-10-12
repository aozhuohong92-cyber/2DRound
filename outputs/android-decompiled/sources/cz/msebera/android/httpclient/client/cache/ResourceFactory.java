package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ResourceFactory {
    Resource copy(String str, Resource resource) throws IOException;

    Resource generate(String str, InputStream inputStream, InputLimit inputLimit) throws IOException;
}
