package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.HttpEntity;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DeflateDecompressingEntity extends DecompressingEntity {
    public DeflateDecompressingEntity(HttpEntity entity) {
        super(entity, new InputStreamFactory() { // from class: cz.msebera.android.httpclient.client.entity.DeflateDecompressingEntity.1
            @Override // cz.msebera.android.httpclient.client.entity.InputStreamFactory
            public InputStream create(InputStream instream) throws IOException {
                return new DeflateInputStream(instream);
            }
        });
    }
}
