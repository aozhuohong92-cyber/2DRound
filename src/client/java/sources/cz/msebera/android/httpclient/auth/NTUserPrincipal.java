package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.LangUtils;
import java.io.Serializable;
import java.security.Principal;
import java.util.Locale;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NTUserPrincipal implements Principal, Serializable {
    private static final long serialVersionUID = -6870169797924406894L;
    private final String domain;
    private final String ntname;
    private final String username;

    public NTUserPrincipal(String domain, String username) {
        Args.notNull(username, "User name");
        this.username = username;
        if (domain != null) {
            this.domain = domain.toUpperCase(Locale.ROOT);
        } else {
            this.domain = null;
        }
        if (this.domain != null && !this.domain.isEmpty()) {
            this.ntname = this.domain + '\\' + this.username;
            return;
        }
        this.ntname = this.username;
    }

    @Override // java.security.Principal
    public String getName() {
        return this.ntname;
    }

    public String getDomain() {
        return this.domain;
    }

    public String getUsername() {
        return this.username;
    }

    @Override // java.security.Principal
    public int hashCode() {
        int hash = LangUtils.hashCode(17, this.username);
        return LangUtils.hashCode(hash, this.domain);
    }

    @Override // java.security.Principal
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o instanceof NTUserPrincipal) {
            NTUserPrincipal that = (NTUserPrincipal) o;
            if (LangUtils.equals(this.username, that.username) && LangUtils.equals(this.domain, that.domain)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.security.Principal
    public String toString() {
        return this.ntname;
    }
}
