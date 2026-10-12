package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.Resource;
import cz.msebera.android.httpclient.client.cache.ResourceFactory;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FileResourceFactory implements ResourceFactory {
    private final File cacheDir;
    private final BasicIdGenerator idgen = new BasicIdGenerator();

    public FileResourceFactory(File cacheDir) {
        this.cacheDir = cacheDir;
    }

    private File generateUniqueCacheFile(String requestId) {
        StringBuilder buffer = new StringBuilder();
        this.idgen.generate(buffer);
        buffer.append('.');
        int len = Math.min(requestId.length(), 100);
        for (int i = 0; i < len; i++) {
            char ch = requestId.charAt(i);
            if (Character.isLetterOrDigit(ch) || ch == '.') {
                buffer.append(ch);
            } else {
                buffer.append('-');
            }
        }
        return new File(this.cacheDir, buffer.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0026, code lost:
    
        r11.reached();
     */
    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.client.cache.Resource generate(java.lang.String r9, java.io.InputStream r10, cz.msebera.android.httpclient.client.cache.InputLimit r11) throws java.io.IOException {
        /*
            r8 = this;
            java.io.File r1 = r8.generateUniqueCacheFile(r9)
            java.io.FileOutputStream r3 = new java.io.FileOutputStream
            r3.<init>(r1)
            r6 = 2048(0x800, float:2.87E-42)
            byte[] r0 = new byte[r6]     // Catch: java.lang.Throwable -> L32
            r4 = 0
        Lf:
            int r2 = r10.read(r0)     // Catch: java.lang.Throwable -> L32
            r6 = -1
            if (r2 == r6) goto L29
            r6 = 0
            r3.write(r0, r6, r2)     // Catch: java.lang.Throwable -> L32
            long r6 = (long) r2     // Catch: java.lang.Throwable -> L32
            long r4 = r4 + r6
            if (r11 == 0) goto Lf
            long r6 = r11.getValue()     // Catch: java.lang.Throwable -> L32
            int r6 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r6 <= 0) goto Lf
            r11.reached()     // Catch: java.lang.Throwable -> L32
        L29:
            r3.close()
            cz.msebera.android.httpclient.impl.client.cache.FileResource r6 = new cz.msebera.android.httpclient.impl.client.cache.FileResource
            r6.<init>(r1)
            return r6
        L32:
            r6 = move-exception
            r3.close()
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.client.cache.FileResourceFactory.generate(java.lang.String, java.io.InputStream, cz.msebera.android.httpclient.client.cache.InputLimit):cz.msebera.android.httpclient.client.cache.Resource");
    }

    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    public Resource copy(String requestId, Resource resource) throws IOException {
        File file = generateUniqueCacheFile(requestId);
        if (resource instanceof FileResource) {
            File src = ((FileResource) resource).getFile();
            IOUtils.copyFile(src, file);
        } else {
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copyAndClose(resource.getInputStream(), out);
        }
        return new FileResource(file);
    }
}
