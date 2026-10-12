package org.apache.commons.httpclient.protocol;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import org.apache.commons.httpclient.params.HttpConnectionParams;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ProtocolSocketFactory {
    Socket createSocket(String str, int i) throws IOException;

    Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException;

    Socket createSocket(String str, int i, InetAddress inetAddress, int i2, HttpConnectionParams httpConnectionParams) throws IOException;
}
