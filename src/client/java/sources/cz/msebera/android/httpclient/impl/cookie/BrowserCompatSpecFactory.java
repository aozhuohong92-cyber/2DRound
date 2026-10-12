package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.cookie.CookieSpecFactory;
import cz.msebera.android.httpclient.cookie.CookieSpecProvider;
import cz.msebera.android.httpclient.cookie.params.CookieSpecPNames;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.util.Collection;

@Immutable
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BrowserCompatSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    private final CookieSpec cookieSpec;
    private final SecurityLevel securityLevel;

    public enum SecurityLevel {
        SECURITYLEVEL_DEFAULT,
        SECURITYLEVEL_IE_MEDIUM
    }

    public BrowserCompatSpecFactory(String[] datepatterns, SecurityLevel securityLevel) {
        this.securityLevel = securityLevel;
        this.cookieSpec = new BrowserCompatSpec(datepatterns, securityLevel);
    }

    public BrowserCompatSpecFactory(String[] datepatterns) {
        this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
    }

    public BrowserCompatSpecFactory() {
        this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecFactory
    public CookieSpec newInstance(HttpParams params) {
        if (params == null) {
            return new BrowserCompatSpec(null, this.securityLevel);
        }
        String[] patterns = null;
        Collection<?> param = (Collection) params.getParameter(CookieSpecPNames.DATE_PATTERNS);
        if (param != null) {
            String[] patterns2 = new String[param.size()];
            patterns = (String[]) param.toArray(patterns2);
        }
        return new BrowserCompatSpec(patterns, this.securityLevel);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        return this.cookieSpec;
    }
}
