package com.iflytek.cloud;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class q extends Handler {
    final /* synthetic */ TextUnderstander a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    q(TextUnderstander textUnderstander, Looper looper) {
        super(looper);
        this.a = textUnderstander;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.f == null) {
            return;
        }
        this.a.f.onInit(0);
    }
}
