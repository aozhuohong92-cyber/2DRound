package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.concurrent.Cancellable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ConnectionRequest extends Cancellable {
    HttpClientConnection get(long j, TimeUnit timeUnit) throws ExecutionException, InterruptedException, ConnectionPoolTimeoutException;
}
