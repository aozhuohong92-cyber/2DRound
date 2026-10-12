package com.iflytek.cloud;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.util.ResourceUtil;
import com.iflytek.msc.MSC;
import com.iflytek.speech.SpeechSynthesizerAidl;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.aF;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeechSynthesizer extends AbstractC0062z {
    private static SpeechSynthesizer c = null;
    InitListener a;
    private aF d;
    private SpeechSynthesizerAidl e;
    private a f = null;
    private Handler g = new k(this, Looper.getMainLooper());

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements SynthesizerListener {
        private SynthesizerListener b;
        private com.iflytek.speech.SynthesizerListener c;
        private Handler d = new m(this, Looper.getMainLooper());

        public a(SynthesizerListener synthesizerListener) {
            this.b = null;
            this.c = null;
            this.b = synthesizerListener;
            this.c = new l(this, SpeechSynthesizer.this);
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onBufferProgress(int i, int i2, int i3, String str) {
            if (this.b != null) {
                Bundle bundle = new Bundle();
                bundle.putInt("percent", i);
                bundle.putInt("begpos", i2);
                bundle.putInt("endpos", i3);
                bundle.putString("spellinfo", str);
                if (this.b != null) {
                    Message.obtain(this.d, 2, bundle).sendToTarget();
                }
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onCompleted(SpeechError speechError) {
            if (this.b != null) {
                Message.obtain(this.d, 6, speechError).sendToTarget();
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            if (this.b != null) {
                Message messageObtain = Message.obtain();
                messageObtain.what = i;
                messageObtain.arg1 = 0;
                messageObtain.arg2 = 0;
                messageObtain.obj = bundle;
                Message.obtain(this.d, 7, 0, 0, messageObtain).sendToTarget();
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onSpeakBegin() {
            if (this.b != null) {
                Message.obtain(this.d, 1).sendToTarget();
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onSpeakPaused() {
            if (this.b != null) {
                Message.obtain(this.d, 3).sendToTarget();
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onSpeakProgress(int i, int i2, int i3) {
            if (this.b != null) {
                Message.obtain(this.d, 5, i, i2, Integer.valueOf(i3)).sendToTarget();
            }
        }

        @Override // com.iflytek.cloud.SynthesizerListener
        public void onSpeakResumed() {
            if (this.b != null) {
                Message.obtain(this.d, 4).sendToTarget();
            }
        }
    }

    protected SpeechSynthesizer(Context context, InitListener initListener) {
        this.d = null;
        this.e = null;
        this.a = null;
        this.a = initListener;
        if (MSC.isLoaded()) {
            this.d = new aF(context);
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility == null || !utility.a() || utility.getEngineMode() == AbstractC0062z.a.MSC) {
            Message.obtain(this.g, 0, 0, 0, null).sendToTarget();
        } else {
            this.e = new SpeechSynthesizerAidl(context.getApplicationContext(), initListener);
        }
    }

    public static SpeechSynthesizer createSynthesizer(Context context, InitListener initListener) {
        if (c == null) {
            c = new SpeechSynthesizer(context, initListener);
        }
        return c;
    }

    public static SpeechSynthesizer getSynthesizer() {
        return c;
    }

    protected void a(Context context) {
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility == null || !utility.a() || utility.getEngineMode() == AbstractC0062z.a.MSC) {
            if (this.a == null || this.e == null) {
                return;
            }
            this.e.destory();
            this.e = null;
            return;
        }
        if (this.e != null && !this.e.isAvailable()) {
            this.e.destory();
            this.e = null;
        }
        this.e = new SpeechSynthesizerAidl(context.getApplicationContext(), this.a);
    }

    public boolean destroy() {
        if (this.e != null) {
            this.e.destory();
        }
        boolean zDestroy = this.d != null ? this.d.destroy() : true;
        if (zDestroy) {
            c = null;
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null) {
            C0020ai.a("Destory tts engine.");
            utility.setParameter(ResourceUtil.ENGINE_DESTROY, "tts");
        }
        return zDestroy;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        if (SpeechConstant.LOCAL_SPEAKERS.equals(str) && this.e != null) {
            return this.e.getParameter(str);
        }
        if (SpeechConstant.TTS_PLAY_STATE.equals(str)) {
            if (a("tts", this.e) == AbstractC0062z.a.PLUS && this.e != null) {
                return this.e.getParameter(str);
            }
            if (this.d != null) {
                return "" + this.d.h();
            }
        }
        return super.getParameter(str);
    }

    public boolean isSpeaking() {
        if (this.d == null || !this.d.g()) {
            return this.e != null && this.e.isSpeaking();
        }
        return true;
    }

    public void pauseSpeaking() {
        if (this.d != null && this.d.g()) {
            this.d.e();
        } else {
            if (this.e == null || !this.e.isSpeaking() || this.f == null) {
                return;
            }
            this.e.pauseSpeaking(this.f.c);
        }
    }

    public void resumeSpeaking() {
        if (this.d != null && this.d.g()) {
            this.d.f();
        } else {
            if (this.e == null || !this.e.isSpeaking() || this.f == null) {
                return;
            }
            this.e.resumeSpeaking(this.f.c);
        }
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startSpeaking(String str, SynthesizerListener synthesizerListener) {
        if (a("tts", this.e) != AbstractC0062z.a.PLUS) {
            if (this.d == null) {
                return 21001;
            }
            this.d.setParameter(this.b);
            this.b.c(SpeechConstant.NEXT_TEXT);
            return this.d.a(str, synthesizerListener);
        }
        if (this.e == null) {
            return 21001;
        }
        this.e.setParameter(SpeechConstant.PARAMS, null);
        this.e.setParameter(SpeechConstant.PARAMS, this.b.toString());
        this.b.c(SpeechConstant.NEXT_TEXT);
        this.f = new a(synthesizerListener);
        return this.e.startSpeaking(str, this.f.c);
    }

    public void stopSpeaking() {
        if (this.d != null && this.d.g()) {
            this.d.a(false);
        } else {
            if (this.e == null || !this.e.isSpeaking() || this.f == null) {
                return;
            }
            this.e.stopSpeaking(this.f.c);
        }
    }

    public int synthesizeToUri(String str, String str2, SynthesizerListener synthesizerListener) {
        if (a("tts", this.e) != AbstractC0062z.a.PLUS) {
            if (this.d == null) {
                return 21001;
            }
            this.d.setParameter(this.b);
            this.d.a(str, str2, synthesizerListener);
            return 0;
        }
        if (this.e == null) {
            return 21001;
        }
        this.e.setParameter(SpeechConstant.PARAMS, null);
        this.e.setParameter(SpeechConstant.PARAMS, this.b.toString());
        this.e.setParameter("tts_audio_uri", str2);
        this.f = new a(synthesizerListener);
        return this.e.synthesizeToUrl(str, this.f.c);
    }
}
