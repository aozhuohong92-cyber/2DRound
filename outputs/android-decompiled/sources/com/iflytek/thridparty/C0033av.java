package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.IdentityListener;
import com.iflytek.cloud.IdentityResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;

/* renamed from: com.iflytek.thridparty.av, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0033av extends A {
    private boolean f;

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: com.iflytek.thridparty.av$a */
    final class a implements IdentityListener {
        private IdentityListener b;
        private boolean c = false;
        private Handler d = new HandlerC0034aw(this, Looper.getMainLooper());

        public a(IdentityListener identityListener) {
            this.b = null;
            this.b = identityListener;
        }

        protected void a() throws Throwable {
            ((HandlerC0058v) C0033av.this.d).a().a();
            V.b(C0033av.this.a, Boolean.valueOf(C0033av.this.f), null);
        }

        @Override // com.iflytek.cloud.IdentityListener
        public void onError(SpeechError speechError) throws Throwable {
            a();
            this.d.sendMessage(this.d.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.IdentityListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message message = new Message();
            message.what = i;
            message.arg1 = i2;
            message.arg2 = i3;
            message.obj = bundle;
            this.d.sendMessage(this.d.obtainMessage(6, 0, 0, message));
        }

        @Override // com.iflytek.cloud.IdentityListener
        public void onResult(IdentityResult identityResult, boolean z) throws Throwable {
            if (z) {
                a();
            }
            this.d.sendMessage(this.d.obtainMessage(4, !z ? 0 : 1, 0, identityResult));
        }
    }

    public C0033av(Context context) {
        super(context);
        this.f = false;
    }

    public int a(IdentityListener identityListener) {
        synchronized (this.c) {
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
            if (this.d != null && this.d.s()) {
                this.d.b(this.b.a(SpeechConstant.MFV_INTERRUPT_ERROR, false));
            }
            this.d = new HandlerC0058v(this.a, this.b, a("mfv"));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0058v) this.d).a(new a(identityListener));
        }
        return 0;
    }

    public int a(String str, String str2, byte[] bArr, int i, int i2) {
        int i3 = ErrorCode.MSP_ERROR_INVALID_DATA;
        synchronized (this.c) {
            if (this.d == null) {
                C0020ai.b("writeAudio error, no active session.");
                i3 = ErrorCode.ERROR_ENGINE_CALL_FAIL;
            } else if (i2 < 0) {
                C0020ai.b("writeAudio error, length < 0.");
            } else if (bArr == null || bArr.length >= i2 + i) {
                ((HandlerC0058v) this.d).a(str, str2, bArr, i, i2);
                i3 = 0;
            } else {
                C0020ai.b("writeAudio error, buffer length < offset + length.");
            }
        }
        return i3;
    }

    public void a(String str, String str2, String str3, IdentityListener identityListener) {
        setParameter("sst", str2);
        a(identityListener);
        a(str, str3, null, 0, 0);
        c(str);
    }

    public void b(String str) {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0058v) this.d).k().a(str);
            }
        }
    }

    public void c(String str) {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0058v) this.d).a(str, true);
            }
        }
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        V.b(this.a, Boolean.valueOf(this.f), null);
        super.cancel(z);
    }

    public boolean e() {
        return d();
    }
}
