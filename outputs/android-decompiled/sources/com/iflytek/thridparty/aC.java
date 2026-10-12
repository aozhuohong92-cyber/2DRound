package com.iflytek.thridparty;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.aB;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aC extends Handler {
    final /* synthetic */ aB.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aC(aB.a aVar, Looper looper) {
        super(looper);
        this.a = aVar;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.b == null) {
            return;
        }
        switch (message.what) {
            case 0:
                this.a.b.onBuildFinish(null, (SpeechError) message.obj);
                break;
            case 1:
                this.a.b.onBuildFinish((String) message.obj, null);
                break;
        }
        super.handleMessage(message);
    }
}
