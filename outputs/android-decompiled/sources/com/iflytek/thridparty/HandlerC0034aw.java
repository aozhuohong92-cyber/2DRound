package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.IdentityResult;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.C0033av;

/* renamed from: com.iflytek.thridparty.aw, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class HandlerC0034aw extends Handler {
    final /* synthetic */ C0033av.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    HandlerC0034aw(C0033av.a aVar, Looper looper) {
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
                this.a.b.onError((SpeechError) message.obj);
                break;
            case 4:
                this.a.b.onResult((IdentityResult) message.obj, message.arg1 == 1);
                if (!this.a.c) {
                    C0033av.this.b("ui_frs");
                    this.a.c = true;
                }
                if (1 == message.arg1) {
                    C0033av.this.b("ui_lrs");
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
