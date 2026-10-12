package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.util.Collection;
import org.apache.commons.httpclient.ConnectMethod;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RequestDefaultHeaders implements HttpRequestInterceptor {
    private final Collection<? extends Header> defaultHeaders;

    public RequestDefaultHeaders(Collection<? extends Header> defaultHeaders) {
        this.defaultHeaders = defaultHeaders;
    }

    public RequestDefaultHeaders() {
        this(null);
    }

    @Override // cz.msebera.android.httpclient.HttpRequestInterceptor
    public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        String method = request.getRequestLine().getMethod();
        if (!method.equalsIgnoreCase(ConnectMethod.NAME)) {
            Collection<? extends Header> defHeaders = (Collection) request.getParams().getParameter("http.default-headers");
            if (defHeaders == null) {
                defHeaders = this.defaultHeaders;
            }
            if (defHeaders != null) {
                for (Header defHeader : defHeaders) {
                    request.addHeader(defHeader);
                }
            }
        }
    }
}
