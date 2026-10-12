package org.apache.commons.httpclient.protocol;

import java.io.IOException;
import java.net.Socket;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface SecureProtocolSocketFactory extends ProtocolSocketFactory {
    Socket createSocket(Socket socket, String str, int i, boolean z) throws IOException;
}
