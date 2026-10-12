package cz.msebera.android.httpclient.impl.client;

import com.iflytek.cloud.SpeechConstant;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HeaderElementIterator;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.ConnectionKeepAliveStrategy;
import cz.msebera.android.httpclient.message.BasicHeaderElementIterator;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DefaultConnectionKeepAliveStrategy implements ConnectionKeepAliveStrategy {
    public static final DefaultConnectionKeepAliveStrategy INSTANCE = new DefaultConnectionKeepAliveStrategy();

    @Override // cz.msebera.android.httpclient.conn.ConnectionKeepAliveStrategy
    public long getKeepAliveDuration(HttpResponse response, HttpContext context) {
        Args.notNull(response, "HTTP response");
        HeaderElementIterator it2 = new BasicHeaderElementIterator(response.headerIterator("Keep-Alive"));
        while (it2.hasNext()) {
            HeaderElement he = it2.nextElement();
            String param = he.getName();
            String value = he.getValue();
            if (value != null && param.equalsIgnoreCase(SpeechConstant.NET_TIMEOUT)) {
                try {
                    return Long.parseLong(value) * 1000;
                } catch (NumberFormatException e) {
                }
            }
        }
        return -1L;
    }
}
