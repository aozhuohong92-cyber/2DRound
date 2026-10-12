package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.cookie.SetCookie2;
import java.util.Date;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicClientCookie2 extends BasicClientCookie implements SetCookie2 {
    private static final long serialVersionUID = -7744598295706617057L;
    private String commentURL;
    private boolean discard;
    private int[] ports;

    public BasicClientCookie2(String name, String value) {
        super(name, value);
    }

    @Override // cz.msebera.android.httpclient.impl.cookie.BasicClientCookie, cz.msebera.android.httpclient.cookie.Cookie
    public int[] getPorts() {
        return this.ports;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie2
    public void setPorts(int[] ports) {
        this.ports = ports;
    }

    @Override // cz.msebera.android.httpclient.impl.cookie.BasicClientCookie, cz.msebera.android.httpclient.cookie.Cookie
    public String getCommentURL() {
        return this.commentURL;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie2
    public void setCommentURL(String commentURL) {
        this.commentURL = commentURL;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie2
    public void setDiscard(boolean discard) {
        this.discard = discard;
    }

    @Override // cz.msebera.android.httpclient.impl.cookie.BasicClientCookie, cz.msebera.android.httpclient.cookie.Cookie
    public boolean isPersistent() {
        return !this.discard && super.isPersistent();
    }

    @Override // cz.msebera.android.httpclient.impl.cookie.BasicClientCookie, cz.msebera.android.httpclient.cookie.Cookie
    public boolean isExpired(Date date) {
        return this.discard || super.isExpired(date);
    }

    @Override // cz.msebera.android.httpclient.impl.cookie.BasicClientCookie
    public Object clone() throws CloneNotSupportedException {
        BasicClientCookie2 clone = (BasicClientCookie2) super.clone();
        if (this.ports != null) {
            clone.ports = (int[]) this.ports.clone();
        }
        return clone;
    }
}
