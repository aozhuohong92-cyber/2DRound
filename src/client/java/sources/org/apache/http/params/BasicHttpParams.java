package org.apache.http.params;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;

@Contract(threading = ThreadingBehavior.SAFE)
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHttpParams extends AbstractHttpParams implements Serializable, Cloneable {
    private static final long serialVersionUID = -7086398485908701455L;
    private final Map<String, Object> parameters = new ConcurrentHashMap();

    @Override // org.apache.http.params.HttpParams
    public Object getParameter(String name) {
        return this.parameters.get(name);
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setParameter(String name, Object value) {
        if (name != null) {
            if (value != null) {
                this.parameters.put(name, value);
            } else {
                this.parameters.remove(name);
            }
        }
        return this;
    }

    @Override // org.apache.http.params.HttpParams
    public boolean removeParameter(String name) {
        if (!this.parameters.containsKey(name)) {
            return false;
        }
        this.parameters.remove(name);
        return true;
    }

    public void setParameters(String[] names, Object value) {
        for (String name : names) {
            setParameter(name, value);
        }
    }

    public boolean isParameterSet(String name) {
        return getParameter(name) != null;
    }

    public boolean isParameterSetLocally(String name) {
        return this.parameters.get(name) != null;
    }

    public void clear() {
        this.parameters.clear();
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams copy() {
        try {
            return (HttpParams) clone();
        } catch (CloneNotSupportedException e) {
            throw new UnsupportedOperationException("Cloning not supported");
        }
    }

    public Object clone() throws CloneNotSupportedException {
        BasicHttpParams clone = (BasicHttpParams) super.clone();
        copyParams(clone);
        return clone;
    }

    public void copyParams(HttpParams target) {
        for (Map.Entry<String, Object> me : this.parameters.entrySet()) {
            target.setParameter(me.getKey(), me.getValue());
        }
    }

    @Override // org.apache.http.params.AbstractHttpParams, org.apache.http.params.HttpParamsNames
    public Set<String> getNames() {
        return new HashSet(this.parameters.keySet());
    }

    public String toString() {
        return "[parameters=" + this.parameters + "]";
    }
}
