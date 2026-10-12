package com.iflytek.thridparty;

import android.content.Context;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SynthesizerListener;
import com.iflytek.thridparty.G;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aF extends A implements G.a {
    private Context f;
    private G g;
    private G h;

    public aF(Context context) {
        super(context);
        this.f = null;
        this.g = null;
        this.h = null;
        this.f = context.getApplicationContext();
    }

    private void a(String str, SynthesizerListener synthesizerListener, String str2) {
        C0020ai.a("new Session Start");
        this.g = new G(this.f);
        this.g.a(this);
        this.g.a(str, this.b, synthesizerListener, true);
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        this.h = new G(this.f);
        this.h.a(this);
        this.h.a(str2, this.b);
    }

    public int a(String str, SynthesizerListener synthesizerListener) {
        C0020ai.a("startSpeaking enter");
        synchronized (this) {
            String strD = this.b.d(SpeechConstant.NEXT_TEXT);
            if (this.g != null && this.g.h()) {
                this.g.cancel(this.b.a(SpeechConstant.TTS_INTERRUPT_ERROR, false));
            }
            if (this.h == null) {
                a(str, synthesizerListener, strD);
            } else if (str.equals(this.h.h) && this.h.i == null && this.h.f) {
                G g = this.h;
                this.h = null;
                if (!TextUtils.isEmpty(strD)) {
                    this.h = new G(this.f);
                    this.h.a(this);
                    this.h.a(strD, this.b);
                }
                this.g = g;
                this.g.a(synthesizerListener);
                this.g.i();
                if (this.g.g) {
                    a();
                    C0020ai.a("startSpeaking NextSession pause");
                }
            } else {
                this.h.cancel(false);
                this.h = null;
                a(str, synthesizerListener, strD);
            }
        }
        C0020ai.a("startSpeaking leave");
        return 0;
    }

    @Override // com.iflytek.thridparty.G.a
    public void a() {
        synchronized (this) {
            if (this.h != null) {
                this.h.e();
            }
        }
    }

    public void a(String str, String str2, SynthesizerListener synthesizerListener) {
        C0020ai.a("synthesizeToUri enter");
        synchronized (this) {
            if (this.g != null && this.g.h()) {
                this.g.cancel(this.b.a(SpeechConstant.TTS_INTERRUPT_ERROR, false));
            }
            this.g = new G(this.f);
            this.g.a(str, str2, this.b, synthesizerListener);
        }
        C0020ai.a("synthesizeToUri leave");
    }

    public void a(boolean z) {
        C0020ai.a("stopSpeaking enter:" + z);
        synchronized (this) {
            if (this.g != null) {
                C0020ai.a("-->stopSpeaking cur");
                this.g.cancel(z);
                this.g = null;
            }
            if (this.h != null) {
                C0020ai.a("-->stopSpeaking cur next");
                this.h.cancel(false);
                this.h = null;
            }
        }
        C0020ai.a("stopSpeaking leave");
    }

    @Override // com.iflytek.thridparty.A
    public boolean destroy() {
        a(false);
        super.destroy();
        return true;
    }

    public void e() {
        C0020ai.a("pauseSpeaking enter");
        synchronized (this) {
            if (this.g != null) {
                this.g.g();
            }
        }
        C0020ai.a("pauseSpeaking leave");
    }

    public void f() {
        C0020ai.a("resumeSpeaking enter");
        synchronized (this) {
            if (this.g != null) {
                this.g.i();
            }
        }
        C0020ai.a("resumeSpeaking leave");
    }

    public boolean g() {
        boolean zH;
        C0020ai.a("isSpeaking enter");
        synchronized (this) {
            zH = this.g != null ? this.g.h() : false;
        }
        C0020ai.a("isSpeaking leave");
        return zH;
    }

    public int h() {
        int iF;
        C0020ai.a("getState enter");
        synchronized (this) {
            iF = this.g != null ? this.g.f() : 4;
        }
        C0020ai.a("getState leave");
        return iF;
    }
}
