package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.utils.CloneUtils;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class HttpEntityEnclosingRequestBase extends HttpRequestBase implements HttpEntityEnclosingRequest {
    private HttpEntity entity;

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public HttpEntity getEntity() {
        return this.entity;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public void setEntity(HttpEntity entity) {
        this.entity = entity;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public boolean expectContinue() {
        Header expect = getFirstHeader("Expect");
        return expect != null && "100-continue".equalsIgnoreCase(expect.getValue());
    }

    @Override // cz.msebera.android.httpclient.client.methods.AbstractExecutionAwareRequest
    public Object clone() throws CloneNotSupportedException {
        HttpEntityEnclosingRequestBase clone = (HttpEntityEnclosingRequestBase) super.clone();
        if (this.entity != null) {
            clone.entity = (HttpEntity) CloneUtils.cloneObject(this.entity);
        }
        return clone;
    }
}
