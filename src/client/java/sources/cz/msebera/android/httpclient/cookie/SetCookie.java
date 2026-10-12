package cz.msebera.android.httpclient.cookie;

import cz.msebera.android.httpclient.annotation.Obsolete;
import java.util.Date;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface SetCookie extends Cookie {
    @Obsolete
    void setComment(String str);

    void setDomain(String str);

    void setExpiryDate(Date date);

    void setPath(String str);

    void setSecure(boolean z);

    void setValue(String str);

    @Obsolete
    void setVersion(int i);
}
