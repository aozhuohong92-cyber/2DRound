package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechUnderstanderListener;
import com.iflytek.cloud.UnderstanderResult;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aG {
    protected static aG a = null;
    private aB b;

    private class a implements RecognizerListener {
        private final SpeechUnderstanderListener b;

        public a(SpeechUnderstanderListener speechUnderstanderListener) {
            this.b = speechUnderstanderListener;
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onBeginOfSpeech() {
            if (this.b != null) {
                this.b.onBeginOfSpeech();
            }
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEndOfSpeech() {
            if (this.b != null) {
                this.b.onEndOfSpeech();
            }
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onError(SpeechError speechError) {
            if (this.b == null || speechError == null) {
                return;
            }
            this.b.onError(speechError);
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            if (this.b != null) {
                this.b.onEvent(i, i2, i3, bundle);
            }
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onResult(RecognizerResult recognizerResult, boolean z) {
            if (this.b != null) {
                this.b.onResult(new UnderstanderResult(recognizerResult.getResultString()));
            }
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onVolumeChanged(int i, byte[] bArr) {
            if (this.b != null) {
                this.b.onVolumeChanged(i, bArr);
            }
        }
    }

    public aG(Context context) {
        this.b = null;
        this.b = new aB(context);
    }

    public int a(SpeechUnderstanderListener speechUnderstanderListener) {
        a aVar = new a(speechUnderstanderListener);
        if (TextUtils.isEmpty(this.b.getParameter("asr_sch"))) {
            this.b.setParameter("asr_sch", "1");
        }
        if (TextUtils.isEmpty(this.b.getParameter(SpeechConstant.NLP_VERSION))) {
            this.b.setParameter(SpeechConstant.NLP_VERSION, "2.0");
        }
        if (TextUtils.isEmpty(this.b.getParameter(SpeechConstant.RESULT_TYPE))) {
            this.b.setParameter(SpeechConstant.RESULT_TYPE, "json");
        }
        this.b.a(aVar);
        return 0;
    }

    public int a(byte[] bArr, int i, int i2) {
        return this.b.a(bArr, i, i2);
    }

    public void a(boolean z) {
        this.b.cancel(z);
    }

    public boolean a() {
        return this.b.f();
    }

    public boolean a(C0027ap c0027ap) {
        return this.b.setParameter(c0027ap);
    }

    public void b() {
        this.b.e();
    }

    public boolean c() {
        boolean zDestroy = this.b.destroy();
        if (zDestroy) {
            a = null;
        }
        return zDestroy;
    }
}
