package com.iflytek.thridparty;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.aI;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aJ extends Handler {
    final /* synthetic */ aI.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aJ(aI.a aVar, Looper looper) {
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
                this.a.b.onStart();
                break;
            case 1:
                this.a.b.onProgress(message.arg1);
                break;
            case 2:
                this.a.b.onCompleted((String) message.obj, null);
                break;
            case 3:
                this.a.b.onCompleted(null, (SpeechError) message.obj);
                break;
        }
        super.handleMessage(message);
    }
}
