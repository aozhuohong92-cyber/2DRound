package com.iflytek.cloud;

import android.os.RemoteException;
import com.iflytek.speech.LexiconListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class h extends LexiconListener.Stub {
    final /* synthetic */ LexiconListener a;
    final /* synthetic */ SpeechRecognizer b;

    h(SpeechRecognizer speechRecognizer, LexiconListener lexiconListener) {
        this.b = speechRecognizer;
        this.a = lexiconListener;
    }

    @Override // com.iflytek.speech.LexiconListener
    public void onLexiconUpdated(String str, int i) throws RemoteException {
        if (this.a != null) {
            this.a.onLexiconUpdated(str, i == 0 ? null : new SpeechError(i));
        }
    }
}
