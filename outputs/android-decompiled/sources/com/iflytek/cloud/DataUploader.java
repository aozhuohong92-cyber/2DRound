package com.iflytek.cloud;

import android.content.Context;
import com.iflytek.thridparty.A;
import com.iflytek.thridparty.D;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DataUploader extends A {
    public DataUploader(Context context) {
        super(context);
    }

    @Override // com.iflytek.thridparty.A
    protected boolean b_() {
        return true;
    }

    public void uploadData(SpeechListener speechListener, String str, byte[] bArr) {
        this.d = new D(this.a, this.b, a("upload"));
        ((D) this.d).a(new A.a(speechListener), str, bArr);
    }
}
