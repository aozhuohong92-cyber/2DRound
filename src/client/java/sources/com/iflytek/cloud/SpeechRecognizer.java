package com.iflytek.cloud;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.util.ResourceUtil;
import com.iflytek.msc.MSC;
import com.iflytek.speech.SpeechRecognizerAidl;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.aB;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class SpeechRecognizer extends AbstractC0062z {
    private static SpeechRecognizer a = null;
    private aB c;
    private SpeechRecognizerAidl d;
    private InitListener f;
    private a e = null;
    private Handler g = new f(this, Looper.getMainLooper());

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements RecognizerListener {
        private RecognizerListener b;
        private com.iflytek.speech.RecognizerListener c;
        private Handler d = new j(this, Looper.getMainLooper());

        public a(RecognizerListener recognizerListener) {
            this.b = null;
            this.c = null;
            this.b = recognizerListener;
            this.c = new i(this, SpeechRecognizer.this);
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onBeginOfSpeech() {
            this.d.sendMessage(this.d.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEndOfSpeech() {
            this.d.sendMessage(this.d.obtainMessage(3, 0, 0, null));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onError(SpeechError speechError) {
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
            this.d.sendMessage(this.d.obtainMessage(4, !z ? 0 : 1, 0, recognizerResult));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onVolumeChanged(int i, byte[] bArr) {
            this.d.sendMessage(this.d.obtainMessage(1, i, 0, bArr));
        }
    }

    protected SpeechRecognizer(Context context, InitListener initListener) {
        this.c = null;
        this.d = null;
        this.f = null;
        this.f = initListener;
        if (MSC.isLoaded()) {
            this.c = new aB(context);
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null && utility.a() && utility.getEngineMode() != AbstractC0062z.a.MSC) {
            this.d = new SpeechRecognizerAidl(context.getApplicationContext(), initListener);
        } else if (initListener != null) {
            Message.obtain(this.g, 0, 0, 0, null).sendToTarget();
        }
    }

    public static synchronized SpeechRecognizer createRecognizer(Context context, InitListener initListener) {
        if (a == null) {
            a = new SpeechRecognizer(context, initListener);
        }
        return a;
    }

    public static SpeechRecognizer getRecognizer() {
        return a;
    }

    protected void a(Context context) {
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility == null || !utility.a() || utility.getEngineMode() == AbstractC0062z.a.MSC) {
            if (this.f == null || this.d == null) {
                return;
            }
            this.d.destory();
            this.d = null;
            return;
        }
        if (this.d != null && !this.d.isAvailable()) {
            this.d.destory();
            this.d = null;
        }
        this.d = new SpeechRecognizerAidl(context.getApplicationContext(), this.f);
    }

    public int buildGrammar(String str, String str2, GrammarListener grammarListener) {
        AbstractC0062z.a aVarA = a("asr", this.d);
        C0020ai.a("start engine mode = " + aVarA.toString());
        if (aVarA != AbstractC0062z.a.PLUS) {
            if (this.c == null) {
                return 21001;
            }
            this.c.setParameter(this.b);
            return this.c.a(str, str2, grammarListener);
        }
        if (this.d == null) {
            return 21001;
        }
        this.d.setParameter(SpeechConstant.PARAMS, null);
        this.d.setParameter(SpeechConstant.PARAMS, this.b.toString());
        return this.d.buildGrammar(str, str2, new g(this, grammarListener));
    }

    public void cancel() {
        if (this.c != null && this.c.f()) {
            this.c.cancel(false);
            return;
        }
        if (this.d == null || !this.d.isListening()) {
            C0020ai.b("SpeechRecognizer cancel failed, is not running");
        } else if (this.e != null) {
            this.d.cancel(this.e.c);
        }
    }

    public boolean destroy() {
        if (this.d != null) {
            this.d.destory();
            this.d = null;
        }
        boolean zDestroy = this.c != null ? this.c.destroy() : true;
        if (zDestroy) {
            a = null;
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null) {
            C0020ai.a("Destory asr engine.");
            utility.setParameter(ResourceUtil.ENGINE_DESTROY, "asr");
        }
        return zDestroy;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isListening() {
        if (this.c == null || !this.c.f()) {
            return this.d != null && this.d.isListening();
        }
        return true;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startListening(RecognizerListener recognizerListener) {
        AbstractC0062z.a aVarA = a("asr", this.d);
        C0020ai.a("start engine mode = " + aVarA.toString());
        if (aVarA != AbstractC0062z.a.PLUS) {
            if (this.c == null) {
                return 21001;
            }
            this.c.setParameter(this.b);
            return this.c.a(recognizerListener);
        }
        if (this.d == null) {
            return 21001;
        }
        this.d.setParameter(SpeechConstant.PARAMS, null);
        this.d.setParameter(SpeechConstant.PARAMS, this.b.toString());
        this.e = new a(recognizerListener);
        return this.d.startListening(this.e.c);
    }

    public void stopListening() {
        if (this.c != null && this.c.f()) {
            this.c.e();
            return;
        }
        if (this.d == null || !this.d.isListening()) {
            C0020ai.b("SpeechRecognizer stopListening failed, is not running");
        } else if (this.e != null) {
            this.d.stopListening(this.e.c);
        }
    }

    public int updateLexicon(String str, String str2, LexiconListener lexiconListener) {
        AbstractC0062z.a aVarA = a("asr", this.d);
        C0020ai.a("start engine mode = " + aVarA.toString());
        if (aVarA != AbstractC0062z.a.PLUS) {
            if (this.c == null) {
                return 21001;
            }
            this.c.setParameter(this.b);
            return this.c.a(str, str2, lexiconListener);
        }
        if (this.d == null) {
            return 21001;
        }
        this.d.setParameter(SpeechConstant.PARAMS, null);
        this.d.setParameter(SpeechConstant.PARAMS, this.b.toString());
        return this.d.updateLexicon(str, str2, new h(this, lexiconListener));
    }

    public int writeAudio(byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.f()) {
            return this.c.a(bArr, i, i2);
        }
        if (this.d != null && this.d.isListening()) {
            return this.d.writeAudio(bArr, i, i2);
        }
        C0020ai.b("SpeechRecognizer writeAudio failed, is not running");
        return ErrorCode.ERROR_ENGINE_CALL_FAIL;
    }
}
