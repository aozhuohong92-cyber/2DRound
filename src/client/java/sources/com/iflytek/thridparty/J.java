package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class J extends Handler {
    final /* synthetic */ G a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    J(G g, Looper looper) {
        super(looper);
        this.a = g;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        try {
            if (this.a.l != null) {
                switch (message.what) {
                    case 1:
                        C0020ai.a("tts-onSpeakBegin");
                        this.a.l.onSpeakBegin();
                        break;
                    case 2:
                        Bundle bundle = (Bundle) message.obj;
                        int i = bundle.getInt("percent");
                        int i2 = bundle.getInt("begpos");
                        int i3 = bundle.getInt("endpos");
                        String string = bundle.getString("spellinfo");
                        if (this.a.l != null) {
                            C0020ai.a("tts-onBufferProgress");
                            this.a.l.onBufferProgress(i, i2, i3, string);
                            break;
                        }
                        break;
                    case 3:
                        C0020ai.a("tts-onSpeakPaused");
                        this.a.l.onSpeakPaused();
                        break;
                    case 4:
                        C0020ai.a("tts-onSpeakResumed");
                        this.a.l.onSpeakResumed();
                        break;
                    case 5:
                        int iIntValue = ((Integer) message.obj).intValue();
                        if (this.a.l != null) {
                            C0020ai.a("tts-onSpeakProgress");
                            this.a.l.onSpeakProgress(message.arg1, message.arg2, iIntValue);
                            break;
                        }
                        break;
                    case 6:
                        C0020ai.a("tts-onCompleted");
                        this.a.l.onCompleted((SpeechError) message.obj);
                        break;
                    case 7:
                        this.a.l.onEvent(20001, 0, 0, (Bundle) message.obj);
                        break;
                }
            }
        } catch (Exception e) {
            C0020ai.b("SpeakSession mUiHandler error:" + e);
        }
    }
}
