package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class K extends Handler {
    final /* synthetic */ G a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    K(G g, Looper looper) {
        super(looper);
        this.a = g;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        try {
            if (this.a.m != null) {
                switch (message.what) {
                    case 2:
                        Bundle bundle = (Bundle) message.obj;
                        this.a.m.onBufferProgress(bundle.getInt("percent"), bundle.getInt("begpos"), bundle.getInt("endpos"), bundle.getString("spellinfo"));
                        break;
                    case 6:
                        this.a.m.onCompleted((SpeechError) message.obj);
                        break;
                    case 7:
                        Message message2 = (Message) message.obj;
                        if (message2 != null) {
                            this.a.m.onEvent(message2.what, message2.arg1, message2.arg2, (Bundle) message2.obj);
                            break;
                        }
                        break;
                }
            }
        } catch (Exception e) {
            C0020ai.b("SpeakSession mUiHandler error:" + e);
        }
    }
}
