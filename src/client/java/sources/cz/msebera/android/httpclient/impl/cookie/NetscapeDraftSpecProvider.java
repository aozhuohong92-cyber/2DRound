package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.annotation.Obsolete;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.cookie.CookieSpecProvider;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Obsolete
@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NetscapeDraftSpecProvider implements CookieSpecProvider {
    private volatile CookieSpec cookieSpec;
    private final String[] datepatterns;

    public NetscapeDraftSpecProvider(String[] datepatterns) {
        this.datepatterns = datepatterns;
    }

    public NetscapeDraftSpecProvider() {
        this(null);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        if (this.cookieSpec == null) {
            synchronized (this) {
                if (this.cookieSpec == null) {
                    this.cookieSpec = new NetscapeDraftSpec(this.datepatterns);
                }
            }
        }
        return this.cookieSpec;
    }
}
