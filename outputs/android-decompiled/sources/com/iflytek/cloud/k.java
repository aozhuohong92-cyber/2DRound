package com.iflytek.cloud;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class k extends Handler {
    final /* synthetic */ SpeechSynthesizer a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    k(SpeechSynthesizer speechSynthesizer, Looper looper) {
        super(looper);
        this.a = speechSynthesizer;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.a == null) {
            return;
        }
        this.a.a.onInit(0);
    }
}
