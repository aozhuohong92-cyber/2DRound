package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.A;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class B extends Handler {
    final /* synthetic */ A.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    B(A.a aVar, Looper looper) {
        super(looper);
        this.a = aVar;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.b == null) {
            return;
        }
        C0020ai.a("SpeechListener onMsg = " + message.what);
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
