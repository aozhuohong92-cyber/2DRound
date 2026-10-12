package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpInetConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import javax.net.ssl.SSLSession;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpRoutedConnection extends HttpInetConnection {
    HttpRoute getRoute();

    SSLSession getSSLSession();

    boolean isSecure();
}
