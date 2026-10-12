package cz.msebera.android.httpclient.client.utils;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.HttpClient;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.Closeable;
import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpClientUtils {
    private HttpClientUtils() {
    }

    public static void closeQuietly(HttpResponse response) {
        HttpEntity entity;
        if (response != null && (entity = response.getEntity()) != null) {
            try {
                EntityUtils.consume(entity);
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(CloseableHttpResponse response) {
        try {
            if (response != null) {
                try {
                    EntityUtils.consume(response.getEntity());
                } finally {
                    response.close();
                }
            }
        } catch (IOException e) {
        }
    }

    public static void closeQuietly(HttpClient httpClient) throws IOException {
        if (httpClient != null && (httpClient instanceof Closeable)) {
            try {
                ((Closeable) httpClient).close();
            } catch (IOException e) {
            }
        }
    }
}
