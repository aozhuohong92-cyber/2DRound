package com.iflytek.cloud.record;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class e extends Handler {
    final /* synthetic */ c a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    e(c cVar, Looper looper) {
        super(looper);
        this.a = cVar;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (message.what) {
            case 0:
                if (this.a.f != null) {
                    this.a.f.a((SpeechError) message.obj);
                    this.a.f = null;
                    break;
                }
                break;
            case 1:
                if (this.a.f != null) {
                    this.a.f.a();
                    break;
                }
                break;
            case 2:
                if (this.a.f != null) {
                    this.a.f.b();
                    break;
                }
                break;
            case 3:
                if (this.a.f != null) {
                    this.a.f.a(message.arg1, message.arg2, this.a.o);
                    break;
                }
                break;
            case 4:
                if (this.a.f != null) {
                    this.a.f.c();
                    this.a.f = null;
                    break;
                }
                break;
        }
    }
}
