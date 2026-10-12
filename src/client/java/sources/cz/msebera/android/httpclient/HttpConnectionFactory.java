package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.HttpConnection;
import java.io.IOException;
import java.net.Socket;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpConnectionFactory<T extends HttpConnection> {
    T createConnection(Socket socket) throws IOException;
}
