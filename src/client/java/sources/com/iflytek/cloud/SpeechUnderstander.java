package com.iflytek.cloud;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.msc.MSC;
import com.iflytek.speech.SpeechUnderstanderAidl;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.aG;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeechUnderstander extends AbstractC0062z {
    protected static SpeechUnderstander a = null;
    private aG c;
    private SpeechUnderstanderAidl d;
    private InitListener f;
    private a e = null;
    private Handler g = new n(this, Looper.getMainLooper());

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements SpeechUnderstanderListener {
        private SpeechUnderstanderListener b;
        private com.iflytek.speech.SpeechUnderstanderListener c;
        private Handler d = new p(this, Looper.getMainLooper());

        public a(SpeechUnderstanderListener speechUnderstanderListener) {
            this.b = null;
            this.c = null;
            this.b = speechUnderstanderListener;
            this.c = new o(this, SpeechUnderstander.this);
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onBeginOfSpeech() {
            this.d.sendMessage(this.d.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onEndOfSpeech() {
            this.d.sendMessage(this.d.obtainMessage(3, 0, 0, null));
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onError(SpeechError speechError) {
            this.d.sendMessage(this.d.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message message = new Message();
            message.what = i;
            message.arg1 = i2;
            message.arg2 = i3;
            message.obj = bundle;
            this.d.sendMessage(this.d.obtainMessage(6, 0, 0, message));
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onResult(UnderstanderResult understanderResult) {
            this.d.sendMessage(this.d.obtainMessage(4, understanderResult));
        }

        @Override // com.iflytek.cloud.SpeechUnderstanderListener
        public void onVolumeChanged(int i, byte[] bArr) {
            this.d.sendMessage(this.d.obtainMessage(1, i, 0, bArr));
        }
    }

    protected SpeechUnderstander(Context context, InitListener initListener) {
        this.c = null;
        this.d = null;
        this.f = null;
        this.f = initListener;
        if (MSC.isLoaded()) {
            this.c = new aG(context);
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null && utility.a() && utility.getEngineMode() != AbstractC0062z.a.MSC) {
            this.d = new SpeechUnderstanderAidl(context.getApplicationContext(), initListener);
        } else if (initListener != null) {
            Message.obtain(this.g, 0, 0, 0, null).sendToTarget();
        }
    }

    public static synchronized SpeechUnderstander createUnderstander(Context context, InitListener initListener) {
        if (a == null) {
            a = new SpeechUnderstander(context, initListener);
        }
        return a;
    }

    public static SpeechUnderstander getUnderstander() {
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
        this.d = new SpeechUnderstanderAidl(context.getApplicationContext(), this.f);
    }

    public void cancel() {
        if (this.c != null && this.c.a()) {
            this.c.a(false);
        } else if (this.d == null || !this.d.isUnderstanding()) {
            C0020ai.b("SpeechUnderstander cancel failed, is not running");
        } else {
            this.d.cancel(this.e.c);
        }
    }

    public boolean destroy() {
        if (this.d != null) {
            this.d.destory();
            this.d = null;
        }
        boolean zC = this.c != null ? this.c.c() : true;
        if (zC) {
            a = null;
        }
        return zC;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isUnderstanding() {
        if (this.c == null || !this.c.a()) {
            return this.d != null && this.d.isUnderstanding();
        }
        return true;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startUnderstanding(SpeechUnderstanderListener speechUnderstanderListener) {
        AbstractC0062z.a aVarA = a(SpeechConstant.ENG_NLU, this.d);
        C0020ai.a("start engine mode = " + aVarA.toString());
        if (aVarA != AbstractC0062z.a.PLUS) {
            if (this.c == null) {
                return 21001;
            }
            this.c.a(this.b);
            return this.c.a(speechUnderstanderListener);
        }
        if (this.d == null) {
            return 21001;
        }
        this.d.setParameter(SpeechConstant.PARAMS, null);
        this.d.setParameter(SpeechConstant.PARAMS, this.b.toString());
        this.e = new a(speechUnderstanderListener);
        return this.d.startUnderstanding(this.e.c);
    }

    public void stopUnderstanding() {
        if (this.c != null && this.c.a()) {
            this.c.b();
        } else if (this.d == null || !this.d.isUnderstanding()) {
            C0020ai.a("SpeechUnderstander stopUnderstanding, is not understanding");
        } else {
            this.d.stopUnderstanding(this.e.c);
        }
    }

    public int writeAudio(byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.a()) {
            return this.c.a(bArr, i, i2);
        }
        if (this.d != null && this.d.isUnderstanding()) {
            return this.d.writeAudio(bArr, i, i2);
        }
        C0020ai.a("SpeechUnderstander writeAudio, is not understanding");
        return ErrorCode.ERROR_ENGINE_CALL_FAIL;
    }
}
