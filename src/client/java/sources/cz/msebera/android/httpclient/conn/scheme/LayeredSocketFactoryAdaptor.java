package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.Socket;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class LayeredSocketFactoryAdaptor extends SocketFactoryAdaptor implements LayeredSocketFactory {
    private final LayeredSchemeSocketFactory factory;

    LayeredSocketFactoryAdaptor(LayeredSchemeSocketFactory factory) {
        super(factory);
        this.factory = factory;
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.LayeredSocketFactory
    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException {
        return this.factory.createLayeredSocket(socket, host, port, autoClose);
    }
}
