package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.GrammarListener;
import com.iflytek.cloud.LexiconListener;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import java.io.UnsupportedEncodingException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aB extends A {
    private boolean f;

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements GrammarListener {
        private GrammarListener b;
        private Handler c = new aC(this, Looper.getMainLooper());

        public a(GrammarListener grammarListener) {
            this.b = null;
            this.b = grammarListener;
        }

        @Override // com.iflytek.cloud.GrammarListener
        public void onBuildFinish(String str, SpeechError speechError) {
            if (speechError != null) {
                this.c.sendMessage(this.c.obtainMessage(0, speechError));
            } else {
                this.c.sendMessage(this.c.obtainMessage(1, str));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    final class b implements LexiconListener {
        private LexiconListener b;
        private Handler c = new aD(this, Looper.getMainLooper());

        public b(LexiconListener lexiconListener) {
            this.b = null;
            this.b = lexiconListener;
        }

        @Override // com.iflytek.cloud.LexiconListener
        public void onLexiconUpdated(String str, SpeechError speechError) {
            if (speechError != null) {
                this.c.sendMessage(this.c.obtainMessage(0, speechError));
            } else {
                this.c.sendMessage(this.c.obtainMessage(1, str));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    final class c implements RecognizerListener {
        private RecognizerListener b;
        private boolean c = false;
        private Handler d = new aE(this, Looper.getMainLooper());

        public c(RecognizerListener recognizerListener) {
            this.b = null;
            this.b = recognizerListener;
        }

        protected void a() {
            String strE = aB.this.d.u().e(SpeechConstant.ASR_AUDIO_PATH);
            if (!TextUtils.isEmpty(strE) && U.a(((HandlerC0048l) aB.this.d).b(), strE)) {
                U.a(aB.this.d.u().b(SpeechConstant.AUDIO_FORMAT, null), strE, aB.this.d.u().a(SpeechConstant.SAMPLE_RATE, aB.this.d.q));
            }
            V.b(aB.this.a, Boolean.valueOf(aB.this.f), null);
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onBeginOfSpeech() {
            C0020ai.a("onBeginOfSpeech");
            this.d.sendMessage(this.d.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEndOfSpeech() {
            this.d.sendMessage(this.d.obtainMessage(3, 0, 0, null));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onError(SpeechError speechError) {
            a();
            this.d.sendMessage(this.d.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message message = new Message();
            message.what = i;
            message.arg1 = i2;
            message.arg2 = i3;
            message.obj = bundle;
            this.d.sendMessage(this.d.obtainMessage(6, 0, 0, message));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onResult(RecognizerResult recognizerResult, boolean z) {
            if (z) {
                a();
            }
            this.d.sendMessage(this.d.obtainMessage(4, !z ? 0 : 1, 0, recognizerResult));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onVolumeChanged(int i, byte[] bArr) {
            this.d.sendMessage(this.d.obtainMessage(1, i, 0, bArr));
        }
    }

    public aB(Context context) {
        super(context);
        this.f = false;
    }

    public int a(RecognizerListener recognizerListener) {
        synchronized (this.c) {
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
            if (this.d != null && this.d.s()) {
                this.d.b(this.b.a(SpeechConstant.ASR_INTERRUPT_ERROR, false));
            }
            this.d = new HandlerC0048l(this.a, this.b, a("iat"));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0048l) this.d).a(new c(recognizerListener));
        }
        return 0;
    }

    public int a(String str, String str2, GrammarListener grammarListener) throws UnsupportedEncodingException {
        if (TextUtils.isEmpty(str2)) {
            return ErrorCode.ERROR_EMPTY_UTTERANCE;
        }
        if (TextUtils.isEmpty(str) || grammarListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        new C0047k().a(str, str2, new a(grammarListener), this.b);
        return 0;
    }

    public int a(String str, String str2, LexiconListener lexiconListener) throws UnsupportedEncodingException {
        if (TextUtils.isEmpty(str2)) {
            return ErrorCode.ERROR_EMPTY_UTTERANCE;
        }
        if (TextUtils.isEmpty(str) || lexiconListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        C0047k c0047k = new C0047k();
        this.b.a(SpeechConstant.SUBJECT, "uup", false);
        String parameter = getParameter(SpeechConstant.LEXICON_TYPE);
        if (TextUtils.isEmpty(parameter)) {
            parameter = str;
        }
        this.b.a(SpeechConstant.DATA_TYPE, parameter, false);
        c0047k.a(str, str2, new b(lexiconListener), this.b);
        return 0;
    }

    public int a(byte[] bArr, int i, int i2) {
        int i3 = ErrorCode.MSP_ERROR_INVALID_DATA;
        synchronized (this.c) {
            if (this.d == null) {
                C0020ai.a("writeAudio error, no active session.");
                i3 = ErrorCode.ERROR_ENGINE_CALL_FAIL;
            } else if (bArr == null || bArr.length <= 0) {
                C0020ai.a("writeAudio error,buffer is null.");
            } else if (bArr.length < i2 + i) {
                C0020ai.a("writeAudio error,buffer length < length.");
            } else if (((HandlerC0048l) this.d).a() != -1) {
                i3 = ErrorCode.MSP_ERROR_INVALID_PARA;
            } else {
                ((HandlerC0048l) this.d).onRecordBuffer(bArr, i, i2);
                i3 = 0;
            }
        }
        return i3;
    }

    public void b(String str) {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0048l) this.d).m().a(str);
            }
        }
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        V.b(this.a, Boolean.valueOf(this.f), null);
        super.cancel(z);
    }

    public void e() {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0048l) this.d).a(true);
            }
        }
    }

    public boolean f() {
        return d();
    }
}
