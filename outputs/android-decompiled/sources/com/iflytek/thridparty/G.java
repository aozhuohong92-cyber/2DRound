package com.iflytek.thridparty;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SynthesizerListener;
import com.iflytek.cloud.record.c;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class G extends A {
    public boolean f;
    public boolean g;
    public String h;
    public SpeechError i;
    private com.iflytek.cloud.record.c j;
    private com.iflytek.cloud.record.b k;
    private SynthesizerListener l;
    private SynthesizerListener m;
    private a n;
    private int o;
    private boolean p;
    private F q;
    private c.a r;
    private Handler s;
    private boolean t;

    public interface a {
        void a();
    }

    public G(Context context) {
        super(context);
        this.j = null;
        this.k = null;
        this.l = null;
        this.m = null;
        this.n = null;
        this.o = 0;
        this.p = false;
        this.f = false;
        this.g = false;
        this.h = null;
        this.i = null;
        this.q = new H(this);
        this.r = new I(this);
        this.s = new J(this, Looper.getMainLooper());
        this.t = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void j() {
        if (this.p || this.j == null || !this.k.a(this.o)) {
            return;
        }
        this.p = true;
        this.j.a(this.k, this.r);
        if (this.l != null) {
            Message.obtain(this.s, 1).sendToTarget();
        }
    }

    public void a(SynthesizerListener synthesizerListener) {
        this.l = synthesizerListener;
    }

    public void a(a aVar) {
        this.n = aVar;
    }

    public void a(String str, C0027ap c0027ap) {
        setParameter(c0027ap);
        this.h = str;
    }

    public synchronized void a(String str, C0027ap c0027ap, SynthesizerListener synthesizerListener, boolean z) {
        C0020ai.a("tts start:" + System.currentTimeMillis());
        this.l = synthesizerListener;
        this.h = str;
        setParameter(c0027ap);
        int iA = c0027ap.a(SpeechConstant.STREAM_TYPE, 3);
        boolean zA = c0027ap.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
        if (z) {
            this.j = new com.iflytek.cloud.record.c(this.a, iA, zA);
        }
        this.d = new E(this.a, c0027ap, a("tts"));
        this.k = new com.iflytek.cloud.record.b(this.a, this.d.r(), c0027ap.e(SpeechConstant.TTS_AUDIO_PATH));
        this.k.a(str);
        this.o = c0027ap.a(SpeechConstant.TTS_BUFFER_TIME, 0);
        C0020ai.a("minPlaySec:" + this.o);
        this.p = false;
        ((E) this.d).a(str, this.q);
        this.f = true;
    }

    public void a(String str, String str2, C0027ap c0027ap, SynthesizerListener synthesizerListener) {
        this.t = c0027ap.a("message_main_thread", true);
        this.m = synthesizerListener;
        this.d = new E(this.a, c0027ap, a("tts"));
        this.k = new com.iflytek.cloud.record.b(this.a, this.d.r(), str2);
        this.k.a(str);
        ((E) this.d).a(str, new L(this, new K(this, Looper.getMainLooper()), str2));
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        C0020ai.a("SpeakSession cancel notifyError:" + z);
        if (h()) {
            if (this.l != null) {
                this.l.onEvent(21002, 0, 0, null);
            }
            if (this.m != null) {
                this.m.onEvent(21002, 0, 0, null);
            }
            if (z) {
                if (this.l != null) {
                    C0020ai.a("tts-onCompleted-cancel");
                    Message.obtain(this.s, 6, new SpeechError(ErrorCode.ERROR_INTERRUPT)).sendToTarget();
                }
                if (this.m != null) {
                    this.m.onCompleted(new SpeechError(ErrorCode.ERROR_INTERRUPT));
                }
            }
        }
        this.l = null;
        this.m = null;
        super.cancel(false);
        if (this.j != null) {
            this.j.e();
        }
    }

    @Override // com.iflytek.thridparty.A
    public boolean d() {
        return super.d();
    }

    @Override // com.iflytek.thridparty.A
    public boolean destroy() {
        synchronized (this.c) {
            cancel(false);
        }
        return true;
    }

    public void e() {
        if (this.g) {
            return;
        }
        a(this.h, this.b, (SynthesizerListener) null, false);
    }

    public int f() {
        if (this.k == null || this.j == null) {
            return 4;
        }
        return this.j.a();
    }

    public void g() {
        if (this.k == null || this.j == null) {
            return;
        }
        this.j.c();
    }

    public boolean h() {
        if (d()) {
            return true;
        }
        return (f() == 4 || f() == 0) ? false : true;
    }

    public void i() {
        if (this.k != null && this.j != null) {
            this.j.d();
        } else {
            this.j = new com.iflytek.cloud.record.c(this.a);
            j();
        }
    }
}
