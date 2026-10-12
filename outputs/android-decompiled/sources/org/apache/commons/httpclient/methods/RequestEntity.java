package org.apache.commons.httpclient.methods;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface RequestEntity {
    long getContentLength();

    String getContentType();

    boolean isRepeatable();

    void writeRequest(OutputStream outputStream) throws IOException;
}
