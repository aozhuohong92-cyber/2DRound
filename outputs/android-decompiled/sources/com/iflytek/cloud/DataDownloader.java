package com.iflytek.cloud;

import android.content.Context;
import com.iflytek.thridparty.A;
import com.iflytek.thridparty.D;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class DataDownloader extends A {
    public DataDownloader(Context context) {
        super(context);
    }

    @Override // com.iflytek.thridparty.A
    protected boolean b_() {
        return true;
    }

    public void downloadData(SpeechListener speechListener) {
        this.d = new D(this.a, this.b, a("download"));
        ((D) this.d).a(new A.a(speechListener));
    }
}
