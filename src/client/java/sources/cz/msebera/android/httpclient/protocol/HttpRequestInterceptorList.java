package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpRequestInterceptor;
import java.util.List;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpRequestInterceptorList {
    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor);

    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor, int i);

    void clearRequestInterceptors();

    HttpRequestInterceptor getRequestInterceptor(int i);

    int getRequestInterceptorCount();

    void removeRequestInterceptorByClass(Class<? extends HttpRequestInterceptor> cls);

    void setInterceptors(List<?> list);
}
