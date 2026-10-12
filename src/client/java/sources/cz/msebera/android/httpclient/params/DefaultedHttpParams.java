package cz.msebera.android.httpclient.params;

import cz.msebera.android.httpclient.util.Args;
import java.util.HashSet;
import java.util.Set;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class DefaultedHttpParams extends AbstractHttpParams {
    private final HttpParams defaults;
    private final HttpParams local;

    public DefaultedHttpParams(HttpParams local, HttpParams defaults) {
        this.local = (HttpParams) Args.notNull(local, "Local HTTP parameters");
        this.defaults = defaults;
    }

    @Override // cz.msebera.android.httpclient.params.HttpParams
    public HttpParams copy() {
        HttpParams clone = this.local.copy();
        return new DefaultedHttpParams(clone, this.defaults);
    }

    @Override // cz.msebera.android.httpclient.params.HttpParams
    public Object getParameter(String name) {
        Object obj = this.local.getParameter(name);
        if (obj == null && this.defaults != null) {
            return this.defaults.getParameter(name);
        }
        return obj;
    }

    @Override // cz.msebera.android.httpclient.params.HttpParams
    public boolean removeParameter(String name) {
        return this.local.removeParameter(name);
    }

    @Override // cz.msebera.android.httpclient.params.HttpParams
    public HttpParams setParameter(String name, Object value) {
        return this.local.setParameter(name, value);
    }

    public HttpParams getDefaults() {
        return this.defaults;
    }

    @Override // cz.msebera.android.httpclient.params.AbstractHttpParams, cz.msebera.android.httpclient.params.HttpParamsNames
    public Set<String> getNames() {
        Set<String> combined = new HashSet<>(getNames(this.defaults));
        combined.addAll(getNames(this.local));
        return combined;
    }

    public Set<String> getDefaultNames() {
        return new HashSet(getNames(this.defaults));
    }

    public Set<String> getLocalNames() {
        return new HashSet(getNames(this.local));
    }

    private Set<String> getNames(HttpParams params) {
        if (params instanceof HttpParamsNames) {
            return ((HttpParamsNames) params).getNames();
        }
        throw new UnsupportedOperationException("HttpParams instance does not implement HttpParamsNames");
    }
}
