package com.iflytek.cloud;

import android.os.RemoteException;
import com.iflytek.cloud.TextUnderstander;
import com.iflytek.speech.TextUnderstanderListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class r extends TextUnderstanderListener.Stub {
    final /* synthetic */ TextUnderstander a;
    final /* synthetic */ TextUnderstander.a b;

    r(TextUnderstander.a aVar, TextUnderstander textUnderstander) {
        this.b = aVar;
        this.a = textUnderstander;
    }

    @Override // com.iflytek.speech.TextUnderstanderListener
    public void onError(int i) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(0, new SpeechError(i)));
    }

    @Override // com.iflytek.speech.TextUnderstanderListener
    public void onResult(com.iflytek.speech.UnderstanderResult understanderResult) throws RemoteException {
        this.b.d.sendMessage(this.b.d.obtainMessage(4, new UnderstanderResult(understanderResult.getResultString())));
    }
}
