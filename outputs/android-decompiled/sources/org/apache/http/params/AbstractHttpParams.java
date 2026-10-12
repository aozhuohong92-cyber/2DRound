package org.apache.http.params;

import java.util.Set;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractHttpParams implements HttpParams, HttpParamsNames {
    protected AbstractHttpParams() {
    }

    @Override // org.apache.http.params.HttpParams
    public long getLongParameter(String name, long defaultValue) {
        Object param = getParameter(name);
        if (param == null) {
            return defaultValue;
        }
        long defaultValue2 = ((Long) param).longValue();
        return defaultValue2;
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setLongParameter(String name, long value) {
        setParameter(name, Long.valueOf(value));
        return this;
    }

    @Override // org.apache.http.params.HttpParams
    public int getIntParameter(String name, int defaultValue) {
        Object param = getParameter(name);
        if (param == null) {
            return defaultValue;
        }
        int defaultValue2 = ((Integer) param).intValue();
        return defaultValue2;
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setIntParameter(String name, int value) {
        setParameter(name, Integer.valueOf(value));
        return this;
    }

    @Override // org.apache.http.params.HttpParams
    public double getDoubleParameter(String name, double defaultValue) {
        Object param = getParameter(name);
        if (param == null) {
            return defaultValue;
        }
        double defaultValue2 = ((Double) param).doubleValue();
        return defaultValue2;
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setDoubleParameter(String name, double value) {
        setParameter(name, Double.valueOf(value));
        return this;
    }

    @Override // org.apache.http.params.HttpParams
    public boolean getBooleanParameter(String name, boolean defaultValue) {
        Object param = getParameter(name);
        if (param == null) {
            return defaultValue;
        }
        boolean defaultValue2 = ((Boolean) param).booleanValue();
        return defaultValue2;
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setBooleanParameter(String name, boolean value) {
        setParameter(name, value ? Boolean.TRUE : Boolean.FALSE);
        return this;
    }

    @Override // org.apache.http.params.HttpParams
    public boolean isParameterTrue(String name) {
        return getBooleanParameter(name, false);
    }

    @Override // org.apache.http.params.HttpParams
    public boolean isParameterFalse(String name) {
        return !getBooleanParameter(name, false);
    }

    @Override // org.apache.http.params.HttpParamsNames
    public Set<String> getNames() {
        throw new UnsupportedOperationException();
    }
}
