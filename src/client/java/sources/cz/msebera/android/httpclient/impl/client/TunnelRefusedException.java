package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class TunnelRefusedException extends HttpException {
    private static final long serialVersionUID = -8646722842745617323L;
    private final HttpResponse response;

    public TunnelRefusedException(String message, HttpResponse response) {
        super(message);
        this.response = response;
    }

    public HttpResponse getResponse() {
        return this.response;
    }
}
