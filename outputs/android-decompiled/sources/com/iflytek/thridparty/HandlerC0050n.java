package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.HandlerC0049m;

/* renamed from: com.iflytek.thridparty.n, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class HandlerC0050n extends Handler {
    final /* synthetic */ HandlerC0049m.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    HandlerC0050n(HandlerC0049m.a aVar, Looper looper) {
        super(looper);
        this.a = aVar;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.a == null) {
        }
        switch (message.what) {
            case 0:
                this.a.a.onEvent(message.arg1, (Bundle) message.obj);
                break;
            case 1:
                this.a.a.onBufferReceived((byte[]) message.obj);
                break;
            case 2:
                this.a.a.onCompleted((SpeechError) message.obj);
                break;
        }
    }
}
