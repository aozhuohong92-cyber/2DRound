package cz.msebera.android.httpclient.impl.auth;

import java.io.IOException;

@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface SpnegoTokenGenerator {
    byte[] generateSpnegoDERObject(byte[] bArr) throws IOException;
}
