package com.iflytek.cloud;

import android.os.Bundle;
import android.os.Message;
import android.os.RemoteException;
import com.iflytek.cloud.SpeechUnderstander;
import com.iflytek.speech.SpeechUnderstanderListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class o extends SpeechUnderstanderListener.Stub {
    final /* synthetic */ SpeechUnderstander a;
    final /* synthetic */ SpeechUnderstander.a b;

    o(SpeechUnderstander.a aVar, SpeechUnderstander speechUnderstander) {
        this.b = aVar;
        this.a = speechUnderstander;
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onBeginOfSpeech() throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(2));
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onEndOfSpeech() throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(3));
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onError(int i) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(0, new SpeechError(i)));
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onEvent(int i, int i2, int i3, Bundle bundle) throws RemoteException {
        Message message = new Message();
        message.what = i;
        message.arg1 = i2;
        message.arg2 = i3;
        message.obj = bundle;
        this.b.d.sendMessage(this.b.d.obtainMessage(6, 0, 0, message));
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onResult(com.iflytek.speech.UnderstanderResult understanderResult) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(4, new UnderstanderResult(understanderResult.getResultString())));
    }

    @Override // com.iflytek.speech.SpeechUnderstanderListener
    public void onVolumeChanged(int i, byte[] bArr) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(1, i, 0, bArr));
    }
}
