package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.EvaluatorListener;
import com.iflytek.cloud.EvaluatorResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;

/* renamed from: com.iflytek.thridparty.az, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0037az extends A {
    private boolean f;

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: com.iflytek.thridparty.az$a */
    final class a implements EvaluatorListener {
        private EvaluatorListener b;
        private Handler c = new aA(this, Looper.getMainLooper());

        public a(EvaluatorListener evaluatorListener) {
            this.b = null;
            this.b = evaluatorListener;
        }

        protected void a() {
            String strE = C0037az.this.d.u().e(SpeechConstant.ISE_AUDIO_PATH);
            if (!TextUtils.isEmpty(strE) && U.a(((HandlerC0046j) C0037az.this.d).d(), strE)) {
                U.a(C0037az.this.d.u().b(SpeechConstant.AUDIO_FORMAT, null), strE, C0037az.this.d.u().a(SpeechConstant.SAMPLE_RATE, C0037az.this.d.q));
            }
            V.b(C0037az.this.a, Boolean.valueOf(C0037az.this.f), null);
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onBeginOfSpeech() {
            C0020ai.a("onBeginOfSpeech");
            this.c.sendMessage(this.c.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onEndOfSpeech() {
            this.c.sendMessage(this.c.obtainMessage(3, 0, 0, null));
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onError(SpeechError speechError) {
            a();
            this.c.sendMessage(this.c.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message message = new Message();
            message.what = i;
            message.arg1 = i2;
            message.arg2 = i3;
            message.obj = bundle;
            Message.obtain(this.c, 6, message).sendToTarget();
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onResult(EvaluatorResult evaluatorResult, boolean z) {
            if (z) {
                a();
            }
            this.c.sendMessage(this.c.obtainMessage(4, !z ? 0 : 1, 0, evaluatorResult));
        }

        @Override // com.iflytek.cloud.EvaluatorListener
        public void onVolumeChanged(int i, byte[] bArr) {
            this.c.sendMessage(this.c.obtainMessage(1, i, 0, bArr));
        }
    }

    public C0037az(Context context) {
        super(context);
        this.f = false;
    }

    public int a(String str, String str2, EvaluatorListener evaluatorListener) {
        synchronized (this.c) {
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
            if (this.d != null && this.d.s()) {
                this.d.b(this.b.a(SpeechConstant.ISE_INTERRUPT_ERROR, false));
            }
            this.d = new HandlerC0046j(this.a, this.b, a(SpeechConstant.ENG_EVA));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0046j) this.d).a(str, str2, new a(evaluatorListener));
        }
        return 0;
    }

    public int a(byte[] bArr, String str, EvaluatorListener evaluatorListener) {
        synchronized (this.c) {
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
            if (this.d != null && this.d.s()) {
                this.d.b(this.b.a(SpeechConstant.ISE_INTERRUPT_ERROR, false));
            }
            this.d = new HandlerC0046j(this.a, this.b, a(SpeechConstant.ENG_EVA));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0046j) this.d).a(bArr, str, new a(evaluatorListener));
        }
        return 0;
    }

    public boolean a(byte[] bArr, int i, int i2) {
        boolean z = false;
        synchronized (this.c) {
            if (this.d == null) {
                C0020ai.a("writeAudio error, no active session.");
            } else if (bArr == null || bArr.length <= 0) {
                C0020ai.a("writeAudio error,buffer is null.");
            } else if (bArr.length < i2 + i) {
                C0020ai.a("writeAudio error,buffer length < length.");
            } else {
                ((HandlerC0046j) this.d).onRecordBuffer(bArr, i, i2);
                z = true;
            }
        }
        return z;
    }

    @Override // com.iflytek.thridparty.A
    protected boolean b_() {
        return super.b_();
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        super.cancel(z);
    }

    public void e() {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0046j) this.d).a(true);
            }
        }
    }

    public boolean f() {
        return d();
    }
}
