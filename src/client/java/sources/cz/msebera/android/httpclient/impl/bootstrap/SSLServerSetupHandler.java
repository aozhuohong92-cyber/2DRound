package cz.msebera.android.httpclient.impl.bootstrap;

import javax.net.ssl.SSLException;
import javax.net.ssl.SSLServerSocket;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface SSLServerSetupHandler {
    void initialize(SSLServerSocket sSLServerSocket) throws SSLException;
}
