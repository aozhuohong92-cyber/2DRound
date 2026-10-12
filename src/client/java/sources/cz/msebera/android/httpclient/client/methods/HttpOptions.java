package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.net.URI;
import java.util.HashSet;
import java.util.Set;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpOptions extends HttpRequestBase {
    public static final String METHOD_NAME = "OPTIONS";

    public HttpOptions() {
    }

    public HttpOptions(URI uri) {
        setURI(uri);
    }

    public HttpOptions(String uri) {
        setURI(URI.create(uri));
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpRequestBase, cz.msebera.android.httpclient.client.methods.HttpUriRequest
    public String getMethod() {
        return "OPTIONS";
    }

    public Set<String> getAllowedMethods(HttpResponse response) throws ParseException {
        Args.notNull(response, "HTTP response");
        HeaderIterator it2 = response.headerIterator("Allow");
        Set<String> methods = new HashSet<>();
        while (it2.hasNext()) {
            Header header = it2.nextHeader();
            HeaderElement[] elements = header.getElements();
            for (HeaderElement element : elements) {
                methods.add(element.getName());
            }
        }
        return methods;
    }
}
