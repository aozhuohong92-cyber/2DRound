package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.aB;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aE extends Handler {
    final /* synthetic */ aB.c a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aE(aB.c cVar, Looper looper) {
        super(looper);
        this.a = cVar;
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
            case 1:
                this.a.b.onVolumeChanged(message.arg1, (byte[]) message.obj);
                break;
            case 2:
                this.a.b.onBeginOfSpeech();
                break;
            case 3:
                this.a.b.onEndOfSpeech();
                break;
            case 4:
                this.a.b.onResult((RecognizerResult) message.obj, message.arg1 == 1);
                if (!this.a.c) {
                    aB.this.b("ui_frs");
                    this.a.c = true;
                }
                if (1 == message.arg1) {
                    aB.this.b("ui_lrs");
                    break;
                }
                break;
            case 6:
                Message message2 = (Message) message.obj;
                this.a.b.onEvent(message2.what, message2.arg1, message2.arg2, (Bundle) message2.obj);
                break;
        }
        super.handleMessage(message);
    }
}
