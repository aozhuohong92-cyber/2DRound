package com.iflytek.cloud;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.C0033av;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class IdentityVerifier extends AbstractC0062z {
    private static IdentityVerifier a = null;
    private C0033av c;
    private InitListener d;
    private Handler e = new d(this, Looper.getMainLooper());

    protected IdentityVerifier(Context context, InitListener initListener) {
        this.c = null;
        this.d = null;
        this.d = initListener;
        if (MSC.isLoaded()) {
            this.c = new C0033av(context);
        }
        if (initListener != null) {
            Message.obtain(this.e, 0, 0, 0, null).sendToTarget();
        }
    }

    public static synchronized IdentityVerifier createVerifier(Context context, InitListener initListener) {
        if (a == null) {
            a = new IdentityVerifier(context, initListener);
        }
        return a;
    }

    public static IdentityVerifier getVerifier() {
        return a;
    }

    public void cancel() {
        if (this.c == null || !this.c.e()) {
            C0020ai.b("IdentityVerifier cancel failed, is not running");
        } else {
            this.c.cancel(false);
        }
    }

    public boolean destroy() {
        boolean zDestroy = this.c != null ? this.c.destroy() : true;
        if (zDestroy) {
            a = null;
        }
        return zDestroy;
    }

    public void execute(String str, String str2, String str3, IdentityListener identityListener) {
        if (this.c == null) {
            C0020ai.b("IdentityVerifier execute failed, is not running");
        } else {
            this.c.setParameter(this.b);
            this.c.a(str, str2, str3, identityListener);
        }
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isWorking() {
        return this.c != null && this.c.e();
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startWorking(IdentityListener identityListener) {
        if (this.c == null) {
            return 21001;
        }
        this.c.setParameter(this.b);
        return this.c.a(identityListener);
    }

    public void stopWrite(String str) {
        if (this.c == null || !this.c.e()) {
            C0020ai.b("IdentityVerifier stopListening failed, is not running");
        } else {
            this.c.c(str);
        }
    }

    public int writeData(String str, String str2, byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.e()) {
            return this.c.a(str, str2, bArr, i, i2);
        }
        C0020ai.b("IdentityVerifier writeAudio failed, is not running");
        return ErrorCode.ERROR_ENGINE_CALL_FAIL;
    }
}
