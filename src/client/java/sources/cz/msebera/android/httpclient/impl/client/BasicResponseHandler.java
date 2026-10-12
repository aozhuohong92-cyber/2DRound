package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicResponseHandler extends AbstractResponseHandler<String> {
    @Override // cz.msebera.android.httpclient.impl.client.AbstractResponseHandler
    public String handleEntity(HttpEntity entity) throws IOException {
        return EntityUtils.toString(entity);
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractResponseHandler, cz.msebera.android.httpclient.client.ResponseHandler
    public String handleResponse(HttpResponse response) throws IOException {
        return (String) super.handleResponse(response);
    }
}
