package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.HttpEntity;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class GzipDecompressingEntity extends DecompressingEntity {
    public GzipDecompressingEntity(HttpEntity entity) {
        super(entity, new InputStreamFactory() { // from class: cz.msebera.android.httpclient.client.entity.GzipDecompressingEntity.1
            @Override // cz.msebera.android.httpclient.client.entity.InputStreamFactory
            public InputStream create(InputStream instream) throws IOException {
                return new GZIPInputStream(instream);
            }
        });
    }
}
