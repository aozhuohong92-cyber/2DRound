package cz.msebera.android.httpclient.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.Serializable;
import java.util.Comparator;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class CookiePathComparator implements Serializable, Comparator<Cookie> {
    public static final CookiePathComparator INSTANCE = new CookiePathComparator();
    private static final long serialVersionUID = 7523645369616405818L;

    private String normalizePath(Cookie cookie) {
        String path = cookie.getPath();
        if (path == null) {
            path = org.apache.commons.httpclient.cookie.CookieSpec.PATH_DELIM;
        }
        if (!path.endsWith(org.apache.commons.httpclient.cookie.CookieSpec.PATH_DELIM)) {
            return path + '/';
        }
        return path;
    }

    @Override // java.util.Comparator
    public int compare(Cookie c1, Cookie c2) {
        String path1 = normalizePath(c1);
        String path2 = normalizePath(c2);
        if (path1.equals(path2)) {
            return 0;
        }
        if (path1.startsWith(path2)) {
            return -1;
        }
        return path2.startsWith(path1) ? 1 : 0;
    }
}
