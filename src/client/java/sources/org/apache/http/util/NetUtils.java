package org.apache.http.util;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class NetUtils {
    public static void formatAddress(StringBuilder sb, SocketAddress socketAddress) {
        Args.notNull(sb, "Buffer");
        Args.notNull(socketAddress, "Socket address");
        if (socketAddress instanceof InetSocketAddress) {
            InetSocketAddress inetSocketAddress = (InetSocketAddress) socketAddress;
            InetAddress address = inetSocketAddress.getAddress();
            String hostAddress = address;
            if (address != null) {
                hostAddress = address.getHostAddress();
            }
            sb.append((Object) hostAddress).append(':').append(inetSocketAddress.getPort());
            return;
        }
        sb.append(socketAddress);
    }
}
