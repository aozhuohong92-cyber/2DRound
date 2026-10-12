package com.iflytek.thridparty;

import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.record.c;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class I implements c.a {
    final /* synthetic */ G a;

    I(G g) {
        this.a = g;
    }

    @Override // com.iflytek.cloud.record.c.a
    public void a() {
        if (this.a.l != null) {
            Message.obtain(this.a.s, 3).sendToTarget();
        }
    }

    @Override // com.iflytek.cloud.record.c.a
    public void a(int i, int i2, int i3) {
        Message.obtain(this.a.s, 5, i, i2, Integer.valueOf(i3)).sendToTarget();
    }

    @Override // com.iflytek.cloud.record.c.a
    public void a(SpeechError speechError) {
        Message.obtain(this.a.s, 6, speechError).sendToTarget();
        if (this.a.j != null) {
            this.a.j.e();
        }
        this.a.cancel(false);
    }

    @Override // com.iflytek.cloud.record.c.a
    public void b() {
        if (this.a.l != null) {
            Message.obtain(this.a.s, 4).sendToTarget();
        }
    }

    @Override // com.iflytek.cloud.record.c.a
    public void c() {
        Message.obtain(this.a.s, 6, null).sendToTarget();
    }
}
