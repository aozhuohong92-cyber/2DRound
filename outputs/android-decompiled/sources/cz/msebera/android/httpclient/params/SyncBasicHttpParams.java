package cz.msebera.android.httpclient.params;

import cz.msebera.android.httpclient.annotation.ThreadSafe;

@ThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SyncBasicHttpParams extends BasicHttpParams {
    private static final long serialVersionUID = 5387834869062660642L;

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams, cz.msebera.android.httpclient.params.HttpParams
    public synchronized boolean removeParameter(String name) {
        return super.removeParameter(name);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams, cz.msebera.android.httpclient.params.HttpParams
    public synchronized HttpParams setParameter(String name, Object value) {
        return super.setParameter(name, value);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams, cz.msebera.android.httpclient.params.HttpParams
    public synchronized Object getParameter(String name) {
        return super.getParameter(name);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams
    public synchronized boolean isParameterSet(String name) {
        return super.isParameterSet(name);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams
    public synchronized boolean isParameterSetLocally(String name) {
        return super.isParameterSetLocally(name);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams
    public synchronized void setParameters(String[] names, Object value) {
        super.setParameters(names, value);
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams
    public synchronized void clear() {
        super.clear();
    }

    @Override // cz.msebera.android.httpclient.params.BasicHttpParams
    public synchronized Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
