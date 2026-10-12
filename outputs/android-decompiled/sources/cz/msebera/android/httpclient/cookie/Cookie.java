package cz.msebera.android.httpclient.cookie;

import cz.msebera.android.httpclient.annotation.Obsolete;
import java.util.Date;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface Cookie {
    @Obsolete
    String getComment();

    @Obsolete
    String getCommentURL();

    String getDomain();

    Date getExpiryDate();

    String getName();

    String getPath();

    @Obsolete
    int[] getPorts();

    String getValue();

    @Obsolete
    int getVersion();

    boolean isExpired(Date date);

    boolean isPersistent();

    boolean isSecure();
}
