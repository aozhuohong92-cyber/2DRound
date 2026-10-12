package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.Resource;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HeapResource implements Resource {
    private static final long serialVersionUID = -2078599905620463394L;
    private final byte[] b;

    public HeapResource(byte[] b) {
        this.b = b;
    }

    byte[] getByteArray() {
        return this.b;
    }

    @Override // cz.msebera.android.httpclient.client.cache.Resource
    public InputStream getInputStream() {
        return new ByteArrayInputStream(this.b);
    }

    @Override // cz.msebera.android.httpclient.client.cache.Resource
    public long length() {
        return this.b.length;
    }

    @Override // cz.msebera.android.httpclient.client.cache.Resource
    public void dispose() {
    }
}
