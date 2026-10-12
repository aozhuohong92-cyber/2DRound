package cz.msebera.android.httpclient.conn.socket;

import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.net.Socket;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface LayeredConnectionSocketFactory extends ConnectionSocketFactory {
    Socket createLayeredSocket(Socket socket, String str, int i, HttpContext httpContext) throws IOException;
}
