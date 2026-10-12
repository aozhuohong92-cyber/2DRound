package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.util.Map;

@ThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpRequestHandlerRegistry implements HttpRequestHandlerResolver {
    private final UriPatternMatcher<HttpRequestHandler> matcher = new UriPatternMatcher<>();

    public void register(String pattern, HttpRequestHandler handler) {
        Args.notNull(pattern, "URI request pattern");
        Args.notNull(handler, "Request handler");
        this.matcher.register(pattern, handler);
    }

    public void unregister(String pattern) {
        this.matcher.unregister(pattern);
    }

    public void setHandlers(Map<String, HttpRequestHandler> map) {
        this.matcher.setObjects(map);
    }

    public Map<String, HttpRequestHandler> getHandlers() {
        return this.matcher.getObjects();
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpRequestHandlerResolver
    public HttpRequestHandler lookup(String requestURI) {
        return this.matcher.lookup(requestURI);
    }
}
