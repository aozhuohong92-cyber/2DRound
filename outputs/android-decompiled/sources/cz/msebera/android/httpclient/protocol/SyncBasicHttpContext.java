package cz.msebera.android.httpclient.protocol;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SyncBasicHttpContext extends BasicHttpContext {
    public SyncBasicHttpContext(HttpContext parentContext) {
        super(parentContext);
    }

    public SyncBasicHttpContext() {
    }

    @Override // cz.msebera.android.httpclient.protocol.BasicHttpContext, cz.msebera.android.httpclient.protocol.HttpContext
    public synchronized Object getAttribute(String id) {
        return super.getAttribute(id);
    }

    @Override // cz.msebera.android.httpclient.protocol.BasicHttpContext, cz.msebera.android.httpclient.protocol.HttpContext
    public synchronized void setAttribute(String id, Object obj) {
        super.setAttribute(id, obj);
    }

    @Override // cz.msebera.android.httpclient.protocol.BasicHttpContext, cz.msebera.android.httpclient.protocol.HttpContext
    public synchronized Object removeAttribute(String id) {
        return super.removeAttribute(id);
    }

    @Override // cz.msebera.android.httpclient.protocol.BasicHttpContext
    public synchronized void clear() {
        super.clear();
    }
}
