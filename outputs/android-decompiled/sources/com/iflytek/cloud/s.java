package com.iflytek.cloud;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.TextUnderstander;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class s extends Handler {
    final /* synthetic */ TextUnderstander.a a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    s(TextUnderstander.a aVar, Looper looper) {
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
                this.a.b.onResult((UnderstanderResult) message.obj);
                break;
        }
        super.handleMessage(message);
    }
}
