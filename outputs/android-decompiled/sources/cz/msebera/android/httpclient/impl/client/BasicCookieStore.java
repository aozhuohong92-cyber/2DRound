package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.GuardedBy;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.CookieStore;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieIdentityComparator;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicCookieStore implements CookieStore, Serializable {
    private static final long serialVersionUID = -7581093305228232025L;

    @GuardedBy("this")
    private final TreeSet<Cookie> cookies = new TreeSet<>(new CookieIdentityComparator());

    @Override // cz.msebera.android.httpclient.client.CookieStore
    public synchronized void addCookie(Cookie cookie) {
        if (cookie != null) {
            this.cookies.remove(cookie);
            if (!cookie.isExpired(new Date())) {
                this.cookies.add(cookie);
            }
        }
    }

    public synchronized void addCookies(Cookie[] cookies) {
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                addCookie(cooky);
            }
        }
    }

    @Override // cz.msebera.android.httpclient.client.CookieStore
    public synchronized List<Cookie> getCookies() {
        return new ArrayList(this.cookies);
    }

    @Override // cz.msebera.android.httpclient.client.CookieStore
    public synchronized boolean clearExpired(Date date) {
        boolean removed;
        if (date == null) {
            removed = false;
        } else {
            removed = false;
            Iterator<Cookie> it2 = this.cookies.iterator();
            while (it2.hasNext()) {
                if (it2.next().isExpired(date)) {
                    it2.remove();
                    removed = true;
                }
            }
        }
        return removed;
    }

    @Override // cz.msebera.android.httpclient.client.CookieStore
    public synchronized void clear() {
        this.cookies.clear();
    }

    public synchronized String toString() {
        return this.cookies.toString();
    }
}
