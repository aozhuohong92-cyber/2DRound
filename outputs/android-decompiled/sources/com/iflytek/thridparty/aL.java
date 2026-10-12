package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.aI;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aL extends Handler {
    final /* synthetic */ aI.c a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aL(aI.c cVar, Looper looper) {
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
                this.a.b.onEvent(message.arg1, (Bundle) message.obj);
                break;
            case 1:
                this.a.b.onBufferReceived((byte[]) message.obj);
                break;
            case 2:
                this.a.b.onCompleted((SpeechError) message.obj);
                break;
        }
        super.handleMessage(message);
    }
}
