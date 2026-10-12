package com.iflytek.thridparty;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import java.io.IOException;

/* renamed from: com.iflytek.thridparty.w, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractHandlerC0059w extends Handler {
    private C0027ap a;
    private volatile b b;
    private HandlerThread c;
    private long d;
    protected int p;
    public int q;
    protected Context r;
    protected volatile boolean s;
    protected long t;
    protected int u;

    /* renamed from: com.iflytek.thridparty.w$a */
    protected enum a {
        max,
        normal
    }

    /* renamed from: com.iflytek.thridparty.w$b */
    protected enum b {
        init,
        start,
        recording,
        waitresult,
        exiting,
        exited
    }

    public AbstractHandlerC0059w(Context context) {
        super(context.getMainLooper());
        this.p = 60000;
        this.q = 16000;
        this.r = null;
        this.a = new C0027ap();
        this.s = false;
        this.b = b.init;
        this.t = 0L;
        this.u = 20000;
        this.d = 0L;
        this.r = context;
        this.s = false;
    }

    public AbstractHandlerC0059w(Context context, HandlerThread handlerThread) {
        super(handlerThread.getLooper());
        this.p = 60000;
        this.q = 16000;
        this.r = null;
        this.a = new C0027ap();
        this.s = false;
        this.b = b.init;
        this.t = 0L;
        this.u = 20000;
        this.d = 0L;
        this.c = handlerThread;
        this.r = context;
        this.s = false;
    }

    private void a() {
        if (this.c.isAlive()) {
            v();
            this.c.quit();
            this.c = null;
        }
    }

    private void b() {
        this.d = System.currentTimeMillis();
    }

    private void c(SpeechError speechError) {
        bq bqVarD;
        try {
            if (!bq.b() || (bqVarD = bq.d()) == null) {
                return;
            }
            String strG = g();
            if (TextUtils.isEmpty(strG)) {
                return;
            }
            bqVarD.a(bq.b, strG);
            bqVarD.a(bq.c, h());
            C0027ap c0027apU = u();
            if (c0027apU == null || !SpeechConstant.TYPE_LOCAL.equals(c0027apU.e(SpeechConstant.ENGINE_TYPE))) {
                bqVarD.a(bq.a, "sid:" + f());
            } else {
                bqVarD.a(bq.a, "csid:" + e());
            }
            bqVarD.a(bq.e, speechError == null ? 0 : speechError.getErrorCode());
            bqVarD.a(bq.d, System.currentTimeMillis());
            bqVarD.e();
        } catch (Exception e) {
            C0020ai.b("DC exception:");
            C0020ai.a(e);
        }
    }

    private long h() {
        return this.d;
    }

    protected void a(int i) {
        a(obtainMessage(i), a.normal, false, 0);
    }

    protected void a(int i, a aVar, boolean z, int i2) {
        a(obtainMessage(i), aVar, z, i2);
    }

    protected void a(Message message) throws Exception {
    }

    protected void a(Message message, a aVar, boolean z, int i) {
        if (t() == b.exited || t() == b.exiting) {
            return;
        }
        switch (message.what) {
            case 0:
                b();
                a(b.start);
                break;
            case 3:
                a(b.waitresult);
                break;
            case MotionEventCompat.AXIS_WHEEL /* 21 */:
                a(b.exiting);
                break;
        }
        if (aVar != a.max || i > 0) {
            sendMessageDelayed(message, i);
        } else {
            sendMessageAtFrontOfQueue(message);
        }
    }

    protected void a(SpeechError speechError) {
        a(b.exited);
        v();
        C0022ak.a(this.r).b();
    }

    protected void a(C0027ap c0027ap) {
        this.a = c0027ap.clone();
        c();
    }

    protected synchronized void a(b bVar) {
        C0020ai.a("curStatus=" + this.b + ",setStatus=" + bVar);
        if (this.b != b.exited && (this.b != b.exiting || bVar == b.exited)) {
            C0020ai.a("setStatus success=" + bVar);
            this.b = bVar;
            this.t = SystemClock.elapsedRealtime();
        }
    }

    protected void a_() {
        a(0, a.max, false, 0);
    }

    protected synchronized void b(SpeechError speechError) {
        if (speechError != null) {
            v();
            c(speechError);
            d(obtainMessage(21, speechError));
        } else {
            c(speechError);
            d(obtainMessage(21, speechError));
        }
    }

    public void b(boolean z) {
        this.s = true;
        v();
        b((SpeechError) null);
    }

    protected void c() {
        this.u = this.a.a(SpeechConstant.NET_TIMEOUT, this.u);
        this.q = this.a.a(SpeechConstant.SAMPLE_RATE, this.q);
    }

    protected void d(Message message) {
        a(message, a.normal, false, 0);
    }

    public abstract String e();

    public abstract String f();

    protected abstract String g();

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (message.what) {
            case MotionEventCompat.AXIS_WHEEL /* 21 */:
                a((SpeechError) message.obj);
                a();
                return;
            default:
                SpeechError speechError = null;
                try {
                    try {
                        try {
                            try {
                                try {
                                    switch (message.what) {
                                        case 8:
                                            throw new SpeechError(ErrorCode.ERROR_NETWORK_TIMEOUT);
                                        default:
                                            a(message);
                                            if (speechError != null) {
                                                return;
                                            } else {
                                                return;
                                            }
                                    }
                                } catch (SpeechError e) {
                                    C0020ai.a(e);
                                    if (e != null) {
                                        C0020ai.a(w() + " occur Error = " + e.toString());
                                        b(e);
                                        return;
                                    }
                                    return;
                                }
                            } catch (UnsatisfiedLinkError e2) {
                                C0020ai.a(e2);
                                SpeechError speechError2 = new SpeechError(ErrorCode.ERROR_UNSATISFIED_LINK);
                                if (speechError2 != null) {
                                    C0020ai.a(w() + " occur Error = " + speechError2.toString());
                                    b(speechError2);
                                    return;
                                }
                                return;
                            }
                        } catch (Exception e3) {
                            C0020ai.a(e3);
                            SpeechError speechError3 = new SpeechError(e3);
                            if (speechError3 != null) {
                                C0020ai.a(w() + " occur Error = " + speechError3.toString());
                                b(speechError3);
                                return;
                            }
                            return;
                        }
                    } catch (IOException e4) {
                        C0020ai.a(e4);
                        SpeechError speechError4 = new SpeechError(ErrorCode.ERROR_FILE_ACCESS);
                        if (speechError4 != null) {
                            C0020ai.a(w() + " occur Error = " + speechError4.toString());
                            b(speechError4);
                            return;
                        }
                        return;
                    } catch (Throwable th) {
                        C0020ai.a(th);
                        SpeechError speechError5 = new SpeechError(ErrorCode.ERROR_UNKNOWN);
                        if (speechError5 != null) {
                            C0020ai.a(w() + " occur Error = " + speechError5.toString());
                            b(speechError5);
                            return;
                        }
                        return;
                    }
                } finally {
                    if (0 != 0) {
                        C0020ai.a(w() + " occur Error = " + speechError.toString());
                        b((SpeechError) null);
                    }
                }
        }
    }

    public boolean l() {
        return false;
    }

    protected void n() {
        removeMessages(8);
        a(8, a.normal, false, this.u);
    }

    public String o() {
        return this.a.b("pte", "utf-8");
    }

    public String p() {
        return this.a.b(SpeechConstant.TEXT_ENCODING, "utf-8");
    }

    public String q() {
        return this.a.b("rse", "utf-8");
    }

    public int r() {
        return this.q;
    }

    public boolean s() {
        return (this.b == b.exited || this.b == b.exiting || this.b == b.init) ? false : true;
    }

    protected synchronized b t() {
        return this.b;
    }

    public C0027ap u() {
        return this.a;
    }

    protected void v() {
        C0020ai.a("clear all message");
        for (int i = 0; i < 20; i++) {
            removeMessages(i);
        }
    }

    protected String w() {
        return getClass().toString();
    }
}
