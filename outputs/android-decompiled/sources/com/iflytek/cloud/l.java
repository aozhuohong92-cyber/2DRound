package com.iflytek.cloud;

import android.os.Bundle;
import android.os.Message;
import android.os.RemoteException;
import com.iflytek.cloud.SpeechSynthesizer;
import com.iflytek.speech.SynthesizerListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class l extends SynthesizerListener.Stub {
    final /* synthetic */ SpeechSynthesizer a;
    final /* synthetic */ SpeechSynthesizer.a b;

    l(SpeechSynthesizer.a aVar, SpeechSynthesizer speechSynthesizer) {
        this.b = aVar;
        this.a = speechSynthesizer;
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onBufferProgress(int i, int i2, int i3, String str) throws RemoteException {
        if (this.b.b != null) {
            Bundle bundle = new Bundle();
            bundle.putInt("percent", i);
            bundle.putInt("begpos", i2);
            bundle.putInt("endpos", i3);
            bundle.putString("spellinfo", "");
            if (this.b.b != null) {
                Message.obtain(this.b.d, 2, bundle).sendToTarget();
            }
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onCompleted(int i) throws RemoteException {
        if (this.b.b != null) {
            Message.obtain(this.b.d, 6, i == 0 ? null : new SpeechError(i)).sendToTarget();
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onEvent(int i, int i2, int i3, Bundle bundle) throws RemoteException {
        if (this.b.b != null) {
            Message messageObtain = Message.obtain();
            messageObtain.what = i;
            messageObtain.arg1 = 0;
            messageObtain.arg2 = 0;
            messageObtain.obj = bundle;
            Message.obtain(this.b.d, 7, 0, 0, messageObtain).sendToTarget();
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onSpeakBegin() throws RemoteException {
        if (this.b.b != null) {
            Message.obtain(this.b.d, 1).sendToTarget();
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onSpeakPaused() throws RemoteException {
        if (this.b.b != null) {
            Message.obtain(this.b.d, 3).sendToTarget();
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onSpeakProgress(int i, int i2, int i3) throws RemoteException {
        if (this.b.b != null) {
            Message.obtain(this.b.d, 5, i, i2, Integer.valueOf(i3)).sendToTarget();
        }
    }

    @Override // com.iflytek.speech.SynthesizerListener
    public void onSpeakResumed() throws RemoteException {
        if (this.b.b != null) {
            Message.obtain(this.b.d, 4, 0, 0, null).sendToTarget();
        }
    }
}
