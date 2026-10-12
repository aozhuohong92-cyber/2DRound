package org.apache.commons.httpclient;

import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpMethodRetryHandler {
    boolean retryMethod(HttpMethod httpMethod, IOException iOException, int i);
}
