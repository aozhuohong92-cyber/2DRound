package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.InetAddress;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HostNameResolver {
    InetAddress resolve(String str) throws IOException;
}
