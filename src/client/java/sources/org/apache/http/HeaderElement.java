package org.apache.http;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HeaderElement {
    String getName();

    NameValuePair getParameter(int i);

    NameValuePair getParameterByName(String str);

    int getParameterCount();

    NameValuePair[] getParameters();

    String getValue();
}
