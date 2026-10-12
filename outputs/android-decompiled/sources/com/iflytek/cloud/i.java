package com.iflytek.cloud;

import android.os.Bundle;
import android.os.Message;
import android.os.RemoteException;
import com.iflytek.cloud.SpeechRecognizer;
import com.iflytek.speech.RecognizerListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class i extends RecognizerListener.Stub {
    final /* synthetic */ SpeechRecognizer a;
    final /* synthetic */ SpeechRecognizer.a b;

    i(SpeechRecognizer.a aVar, SpeechRecognizer speechRecognizer) {
        this.b = aVar;
        this.a = speechRecognizer;
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onBeginOfSpeech() throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(2));
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onEndOfSpeech() throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(3));
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onError(int i) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(0, new SpeechError(i)));
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onEvent(int i, int i2, int i3, Bundle bundle) throws RemoteException {
        Message message = new Message();
        message.what = i;
        message.arg1 = i2;
        message.arg2 = i3;
        message.obj = bundle;
        this.b.d.sendMessage(this.b.d.obtainMessage(6, 0, 0, message));
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onResult(com.iflytek.speech.RecognizerResult recognizerResult, boolean z) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(4, !z ? 0 : 1, 0, new RecognizerResult(recognizerResult.getResultString())));
    }

    @Override // com.iflytek.speech.RecognizerListener
    public void onVolumeChanged(int i, byte[] bArr) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(1, i, 0, bArr));
    }
}
