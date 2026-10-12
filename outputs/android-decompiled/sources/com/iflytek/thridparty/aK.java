package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.WakeuperResult;
import com.iflytek.thridparty.aI;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aK extends Handler {
    final /* synthetic */ aI.b a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aK(aI.b bVar, Looper looper) {
        super(looper);
        this.a = bVar;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.b == null) {
            return;
        }
        switch (message.what) {
            case 0:
                this.a.b.onError((SpeechError) message.obj);
                break;
            case 2:
                if (!(this.a.b instanceof aI.b)) {
                    this.a.b.onBeginOfSpeech();
                    break;
                }
                break;
            case 4:
                this.a.b.onResult((WakeuperResult) message.obj);
                break;
            case 5:
                this.a.b.onVolumeChanged(message.arg1);
                break;
            case 6:
                Message message2 = (Message) message.obj;
                if (message2 != null) {
                    this.a.b.onEvent(message2.what, message2.arg1, message2.arg2, (Bundle) message2.obj);
                    break;
                }
                break;
        }
        super.handleMessage(message);
    }
}
