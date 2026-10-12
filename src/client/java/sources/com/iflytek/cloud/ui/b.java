package com.iflytek.cloud.ui;

import android.os.Bundle;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class b implements RecognizerListener {
    final /* synthetic */ a a;

    b(a aVar) {
        this.a = aVar;
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onBeginOfSpeech() {
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onEndOfSpeech() {
        this.a.j();
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onError(SpeechError speechError) {
        if (speechError == null || !this.a.b) {
            this.a.f();
        } else {
            this.a.a(speechError);
        }
        if (this.a.h != null) {
            this.a.h.onError(speechError);
        }
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onEvent(int i, int i2, int i3, Bundle bundle) {
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onResult(RecognizerResult recognizerResult, boolean z) {
        if (z) {
            this.a.f();
        }
        if (this.a.h != null) {
            this.a.h.onResult(recognizerResult, z);
        }
    }

    @Override // com.iflytek.cloud.RecognizerListener
    public void onVolumeChanged(int i, byte[] bArr) {
        if (this.a.k == 1) {
            this.a.e.a((i + 2) / 5);
            this.a.e.invalidate();
        }
    }
}
