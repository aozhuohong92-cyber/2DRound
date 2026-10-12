package cz.msebera.android.httpclient.entity;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ContentProducer {
    void writeTo(OutputStream outputStream) throws IOException;
}
