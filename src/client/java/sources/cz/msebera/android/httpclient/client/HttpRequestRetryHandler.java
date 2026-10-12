package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpRequestRetryHandler {
    boolean retryRequest(IOException iOException, int i, HttpContext httpContext);
}
