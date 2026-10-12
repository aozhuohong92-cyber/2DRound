package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class A extends AbstractC0062z {
    protected Context a;
    protected Object c = new Object();
    protected volatile AbstractHandlerC0059w d = null;
    protected volatile HandlerThread e = null;

    protected class a implements SpeechListener {
        private SpeechListener b;
        private Handler c = new B(this, Looper.getMainLooper());

        public a(SpeechListener speechListener) {
            this.b = null;
            this.b = speechListener;
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onBufferReceived(byte[] bArr) {
            this.c.sendMessage(this.c.obtainMessage(1, bArr));
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onCompleted(SpeechError speechError) {
            this.c.sendMessage(this.c.obtainMessage(2, speechError));
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onEvent(int i, Bundle bundle) {
            this.c.sendMessage(this.c.obtainMessage(0, i, 0, bundle));
        }
    }

    protected A(Context context) {
        this.a = null;
        if (context == null) {
            this.a = null;
            return;
        }
        O.a(context.getApplicationContext());
        this.a = context.getApplicationContext();
        try {
            b();
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    protected HandlerThread a(String str) {
        this.e = new HandlerThread(str);
        this.e.start();
        return this.e;
    }

    protected void b() throws Exception {
    }

    protected boolean b_() {
        if (this.e == null || !this.e.isAlive()) {
            return true;
        }
        HandlerThread handlerThread = this.e;
        this.e = null;
        handlerThread.interrupt();
        return true;
    }

    protected String c() {
        return getClass().toString();
    }

    public void cancel(boolean z) {
        if (this.d != null) {
            this.d.b(z);
        }
    }

    protected boolean d() {
        return this.d != null && this.d.s();
    }

    public boolean destroy() {
        boolean zB_ = false;
        synchronized (this.c) {
            if (d()) {
                this.d.b(false);
            } else {
                zB_ = b_();
                C0020ai.c(c() + "destory =" + zB_);
            }
        }
        return zB_;
    }

    protected void finalize() throws Throwable {
        C0020ai.a(c() + " finalize called");
        super.finalize();
    }

    public int getSampleRate() {
        return this.b.a(SpeechConstant.SAMPLE_RATE, 16000);
    }
}
