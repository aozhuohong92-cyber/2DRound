package cz.msebera.android.httpclient.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.impl.cookie.BasicClientCookie;
import java.util.Comparator;
import java.util.Date;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class CookiePriorityComparator implements Comparator<Cookie> {
    public static final CookiePriorityComparator INSTANCE = new CookiePriorityComparator();

    private int getPathLength(Cookie cookie) {
        String path = cookie.getPath();
        if (path != null) {
            return path.length();
        }
        return 1;
    }

    @Override // java.util.Comparator
    public int compare(Cookie c1, Cookie c2) {
        int l1 = getPathLength(c1);
        int l2 = getPathLength(c2);
        int result = l2 - l1;
        if (result == 0 && (c1 instanceof BasicClientCookie) && (c2 instanceof BasicClientCookie)) {
            Date d1 = ((BasicClientCookie) c1).getCreationDate();
            Date d2 = ((BasicClientCookie) c2).getCreationDate();
            if (d1 != null && d2 != null) {
                return (int) (d1.getTime() - d2.getTime());
            }
            return result;
        }
        return result;
    }
}
