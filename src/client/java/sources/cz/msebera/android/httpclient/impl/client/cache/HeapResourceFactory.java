package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.InputLimit;
import cz.msebera.android.httpclient.client.cache.Resource;
import cz.msebera.android.httpclient.client.cache.ResourceFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HeapResourceFactory implements ResourceFactory {
    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    public Resource generate(String requestId, InputStream instream, InputLimit limit) throws IOException {
        ByteArrayOutputStream outstream = new ByteArrayOutputStream();
        byte[] buf = new byte[2048];
        long total = 0;
        while (true) {
            int l = instream.read(buf);
            if (l == -1) {
                break;
            }
            outstream.write(buf, 0, l);
            total += l;
            if (limit != null && total > limit.getValue()) {
                limit.reached();
                break;
            }
        }
        return createResource(outstream.toByteArray());
    }

    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    public Resource copy(String requestId, Resource resource) throws IOException {
        byte[] body;
        if (resource instanceof HeapResource) {
            body = ((HeapResource) resource).getByteArray();
        } else {
            ByteArrayOutputStream outstream = new ByteArrayOutputStream();
            IOUtils.copyAndClose(resource.getInputStream(), outstream);
            body = outstream.toByteArray();
        }
        return createResource(body);
    }

    Resource createResource(byte[] buf) {
        return new HeapResource(buf);
    }
}
