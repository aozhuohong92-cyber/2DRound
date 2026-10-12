package org.apache.commons.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface MethodRetryHandler {
    boolean retryMethod(HttpMethod httpMethod, HttpConnection httpConnection, HttpRecoverableException httpRecoverableException, int i, boolean z);
}
