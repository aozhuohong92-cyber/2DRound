package org.apache.http.message;

import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHeaderElement implements HeaderElement, Cloneable {
    private final String name;
    private final NameValuePair[] parameters;
    private final String value;

    public BasicHeaderElement(String name, String value, NameValuePair[] parameters) {
        this.name = (String) Args.notNull(name, "Name");
        this.value = value;
        if (parameters != null) {
            this.parameters = parameters;
        } else {
            this.parameters = new NameValuePair[0];
        }
    }

    public BasicHeaderElement(String name, String value) {
        this(name, value, null);
    }

    @Override // org.apache.http.HeaderElement
    public String getName() {
        return this.name;
    }

    @Override // org.apache.http.HeaderElement
    public String getValue() {
        return this.value;
    }

    @Override // org.apache.http.HeaderElement
    public NameValuePair[] getParameters() {
        return (NameValuePair[]) this.parameters.clone();
    }

    @Override // org.apache.http.HeaderElement
    public int getParameterCount() {
        return this.parameters.length;
    }

    @Override // org.apache.http.HeaderElement
    public NameValuePair getParameter(int index) {
        return this.parameters[index];
    }

    @Override // org.apache.http.HeaderElement
    public NameValuePair getParameterByName(String name) {
        Args.notNull(name, "Name");
        NameValuePair[] arr$ = this.parameters;
        for (NameValuePair current : arr$) {
            if (current.getName().equalsIgnoreCase(name)) {
                return current;
            }
        }
        return null;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof HeaderElement)) {
            return false;
        }
        BasicHeaderElement that = (BasicHeaderElement) object;
        return this.name.equals(that.name) && LangUtils.equals(this.value, that.value) && LangUtils.equals((Object[]) this.parameters, (Object[]) that.parameters);
    }

    public int hashCode() {
        int hash = LangUtils.hashCode(17, this.name);
        int hash2 = LangUtils.hashCode(hash, this.value);
        NameValuePair[] arr$ = this.parameters;
        for (NameValuePair parameter : arr$) {
            hash2 = LangUtils.hashCode(hash2, parameter);
        }
        return hash2;
    }

    public String toString() {
        StringBuilder buffer = new StringBuilder();
        buffer.append(this.name);
        if (this.value != null) {
            buffer.append("=");
            buffer.append(this.value);
        }
        NameValuePair[] arr$ = this.parameters;
        for (NameValuePair parameter : arr$) {
            buffer.append("; ");
            buffer.append(parameter);
        }
        return buffer.toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
