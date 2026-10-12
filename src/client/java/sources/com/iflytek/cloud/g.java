package com.iflytek.cloud;

import android.os.RemoteException;
import com.iflytek.speech.GrammarListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class g extends GrammarListener.Stub {
    final /* synthetic */ GrammarListener a;
    final /* synthetic */ SpeechRecognizer b;

    g(SpeechRecognizer speechRecognizer, GrammarListener grammarListener) {
        this.b = speechRecognizer;
        this.a = grammarListener;
    }

    @Override // com.iflytek.speech.GrammarListener
    public void onBuildFinish(String str, int i) throws RemoteException {
        if (this.a != null) {
            this.a.onBuildFinish(str, i == 0 ? null : new SpeechError(i));
        }
    }
}
