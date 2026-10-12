package com.iflytek.cloud;

import android.content.Context;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.C0035ax;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeakerVerifier extends AbstractC0062z {
    private static SpeakerVerifier a = null;
    private C0035ax c;

    protected SpeakerVerifier(Context context, InitListener initListener) {
        this.c = null;
        if (MSC.isLoaded()) {
            this.c = new C0035ax(context);
        }
    }

    public static SpeakerVerifier createVerifier(Context context, InitListener initListener) {
        if (a == null) {
            a = new SpeakerVerifier(context, initListener);
        }
        return a;
    }

    public static SpeakerVerifier getVerifier() {
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

    public String generatePassword(int i) {
        if (this.c != null) {
            return this.c.a(i);
        }
        C0020ai.b("SpeakerVerifier getPasswordList failed, is not running");
        return null;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public void getPasswordList(SpeechListener speechListener) {
        if (this.c == null) {
            C0020ai.b("SpeakerVerifier getPasswordList failed, is not running");
            return;
        }
        this.c.setParameter(SpeechConstant.PARAMS, null);
        this.b.a(SpeechConstant.SUBJECT, SpeechConstant.ENG_IVP, true);
        this.b.a("rse", "gb2312", false);
        this.c.setParameter(this.b);
        this.c.a(speechListener);
    }

    public boolean isListening() {
        return this.c != null && this.c.f();
    }

    public void sendRequest(String str, String str2, SpeechListener speechListener) {
        this.c.setParameter(this.b);
        this.c.a(str, str2, speechListener);
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startListening(VerifierListener verifierListener) {
        if (this.c == null) {
            return 21001;
        }
        this.c.setParameter(this.b);
        return this.c.a(verifierListener);
    }

    public void stopListening() {
        if (this.c == null || !this.c.f()) {
            C0020ai.b("SpeakerVerifier stopListening failed, is not running");
        } else {
            this.c.e();
        }
    }

    public int writeAudio(byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.f()) {
            return this.c.a(bArr, i, i2);
        }
        C0020ai.b("SpeakerVerifier writeAudio failed, is not running");
        return ErrorCode.ERROR_ENGINE_CALL_FAIL;
    }
}
