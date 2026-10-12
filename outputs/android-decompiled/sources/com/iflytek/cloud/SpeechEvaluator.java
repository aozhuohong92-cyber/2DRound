package com.iflytek.cloud;

import android.content.Context;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.C0037az;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeechEvaluator extends AbstractC0062z {
    private static SpeechEvaluator a = null;
    private C0037az c;

    protected SpeechEvaluator(Context context, InitListener initListener) {
        this.c = null;
        if (MSC.isLoaded()) {
            this.c = new C0037az(context);
        }
        if (initListener != null) {
        }
    }

    public static SpeechEvaluator createEvaluator(Context context, InitListener initListener) {
        if (a == null) {
            a = new SpeechEvaluator(context, null);
        }
        return a;
    }

    public static SpeechEvaluator getEvaluator() {
        return a;
    }

    public void cancel() {
        if (this.c == null || !this.c.f()) {
            return;
        }
        this.c.cancel(false);
    }

    public boolean destroy() {
        boolean zDestroy = this.c != null ? this.c.destroy() : true;
        if (zDestroy) {
            a = null;
        }
        return zDestroy;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isEvaluating() {
        return this.c != null && this.c.f();
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startEvaluating(String str, String str2, EvaluatorListener evaluatorListener) {
        if (this.c == null) {
            return 21001;
        }
        this.c.setParameter(this.b);
        return this.c.a(str, str2, evaluatorListener);
    }

    public int startEvaluating(byte[] bArr, String str, EvaluatorListener evaluatorListener) {
        if (this.c == null) {
            return 21001;
        }
        this.c.setParameter(this.b);
        return this.c.a(bArr, str, evaluatorListener);
    }

    public void stopEvaluating() {
        if (this.c == null || !this.c.f()) {
            C0020ai.b("SpeechEvaluator stopEvaluating failed, is not running");
        } else {
            this.c.e();
        }
    }

    public boolean writeAudio(byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.f()) {
            return this.c.a(bArr, i, i2);
        }
        C0020ai.b("SpeechEvaluator writeAudio failed, is not running");
        return false;
    }
}
