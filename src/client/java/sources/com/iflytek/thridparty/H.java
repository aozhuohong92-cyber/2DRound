package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Message;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class H implements F {
    final /* synthetic */ G a;

    H(G g) {
        this.a = g;
    }

    @Override // com.iflytek.thridparty.F
    public void a(SpeechError speechError) {
        this.a.i = speechError;
        if (speechError == null) {
            this.a.g = true;
            this.a.k.b(this.a.d != null ? this.a.d.u().b(SpeechConstant.AUDIO_FORMAT, null) : null);
            if (this.a.n != null) {
                this.a.n.a();
                C0020ai.a("onCompleted NextSession pause");
            }
        }
        Bundle bundle = new Bundle();
        bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, this.a.d.f());
        Message.obtain(this.a.s, 7, bundle).sendToTarget();
        if (this.a.l == null || speechError == null) {
            return;
        }
        Message.obtain(this.a.s, 6, speechError).sendToTarget();
        if (this.a.j != null) {
            this.a.j.e();
        }
    }

    @Override // com.iflytek.thridparty.F
    public void a(ArrayList<byte[]> arrayList, int i, int i2, int i3, String str) {
        Bundle bundle = new Bundle();
        bundle.putInt("percent", i);
        bundle.putInt("begpos", i2);
        bundle.putInt("endpos", i3);
        bundle.putString("spellinfo", str);
        if (this.a.l != null) {
            Message.obtain(this.a.s, 2, bundle).sendToTarget();
        }
        try {
            this.a.k.a(arrayList, i, i2, i3);
            this.a.j();
        } catch (IOException e) {
            C0020ai.a(e);
            this.a.i = new SpeechError(ErrorCode.ERROR_FILE_ACCESS);
            Message.obtain(this.a.s, 6, this.a.i).sendToTarget();
            this.a.cancel(false);
        }
    }
}
