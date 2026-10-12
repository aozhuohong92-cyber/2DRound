package org.apache.commons.httpclient.params;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HostParams extends DefaultHttpParams {
    public static final String DEFAULT_HEADERS = "http.default-headers";

    public HostParams() {
    }

    public HostParams(HttpParams defaults) {
        super(defaults);
    }

    public void setVirtualHost(String hostname) {
        setParameter("http.virtual-host", hostname);
    }

    public String getVirtualHost() {
        return (String) getParameter("http.virtual-host");
    }
}
