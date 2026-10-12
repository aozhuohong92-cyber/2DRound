package com.iflytek.cloud;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class d extends Handler {
    final /* synthetic */ IdentityVerifier a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    d(IdentityVerifier identityVerifier, Looper looper) {
        super(looper);
        this.a = identityVerifier;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.a.d == null) {
            return;
        }
        this.a.d.onInit(message.what);
    }
}
