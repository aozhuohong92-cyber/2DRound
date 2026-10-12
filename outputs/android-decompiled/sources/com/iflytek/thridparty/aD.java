package com.iflytek.thridparty;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.aB;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class aD extends Handler {
    final /* synthetic */ aB.b a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    aD(aB.b bVar, Looper looper) {
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
                this.a.b.onLexiconUpdated(null, (SpeechError) message.obj);
                break;
            case 1:
                this.a.b.onLexiconUpdated((String) message.obj, null);
                break;
        }
        super.handleMessage(message);
    }
}
