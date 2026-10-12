package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.Socket;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface LayeredSocketFactory extends SocketFactory {
    Socket createSocket(Socket socket, String str, int i, boolean z) throws IOException;
}
