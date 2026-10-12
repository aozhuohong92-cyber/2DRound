package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.VerifierListener;
import com.iflytek.cloud.VerifierResult;
import com.iflytek.cloud.record.PcmRecorder;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ConcurrentLinkedQueue;

/* renamed from: com.iflytek.thridparty.o, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0051o extends AbstractHandlerC0059w implements PcmRecorder.PcmRecordListener {
    protected volatile VerifierListener a;
    protected long b;
    protected boolean c;
    protected C0052p d;
    protected PcmRecorder e;
    protected String f;
    protected String g;
    protected VerifierResult h;
    protected ConcurrentLinkedQueue<byte[]> i;
    protected int j;
    private long k;
    private int l;

    public HandlerC0051o(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.a = null;
        this.b = 0L;
        this.c = true;
        this.d = new C0052p();
        this.e = null;
        this.f = "train";
        this.g = "";
        this.h = null;
        this.i = null;
        this.j = 1;
        this.k = 0L;
        this.l = 0;
        this.i = new ConcurrentLinkedQueue<>();
        a(c0027ap);
    }

    private void A() {
        if (this.e != null) {
            this.e.stopRecord(u().a("record_force_stop", false));
            this.e = null;
        }
    }

    private boolean m() {
        return "train".equalsIgnoreCase(u().e("sst"));
    }

    private void x() throws InterruptedException, SpeechError, IOException {
        C0020ai.a("--->onStoped: in");
        if (!m()) {
            A();
        }
        this.d.a();
        a(4);
        C0020ai.a("--->onStoped: out");
    }

    private void y() throws SpeechError, UnsupportedEncodingException {
        C0020ai.a("--->requestResult: in");
        switch (this.d.e()) {
            case hasResult:
                z();
                break;
        }
        C0020ai.a("--->requestResult: out");
    }

    private void z() throws SpeechError, UnsupportedEncodingException {
        this.t = SystemClock.elapsedRealtime();
        this.h = new VerifierResult(new String(this.d.d(), "utf-8"));
        if (this.a != null) {
            Bundle bundle = new Bundle();
            bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
            this.a.onEvent(20001, 0, 0, bundle);
        }
        if (this.f.equals("train") && this.h.ret == 0 && this.h.suc < this.h.rgn) {
            if (this.a != null) {
                C0021aj.a("GetNotifyResult", null);
                this.a.onResult(this.h);
            }
            a(0);
            return;
        }
        if (this.a != null) {
            C0021aj.a("GetNotifyResult", null);
            this.a.onResult(this.h);
        }
        b((SpeechError) null);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        super.a(message);
        switch (message.what) {
            case 0:
                b();
                break;
            case 1:
                h();
                break;
            case 2:
                b(message);
                break;
            case 3:
                x();
                break;
            case 4:
                c(message);
                break;
            case 9:
                C0020ai.a("--->on timeout vad");
                i();
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        C0020ai.a("--->onEnd: in");
        A();
        f();
        C0021aj.a("SessionEndBegin", null);
        if (this.s) {
            this.d.a("user abort");
        } else if (speechError != null) {
            this.d.a("error" + speechError.getErrorCode());
        } else {
            this.d.a("success");
        }
        C0021aj.a("SessionEndEnd", null);
        super.a(speechError);
        if (this.a != null && !this.s) {
            C0020ai.a("VerifyListener#onEnd");
            if (speechError != null) {
                Bundle bundle = new Bundle();
                bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
                this.a.onEvent(20001, 0, 0, bundle);
                this.a.onError(speechError);
            }
        }
        this.a = null;
        C0020ai.a("--->onEnd: out");
    }

    public synchronized void a(VerifierListener verifierListener) {
        C0020ai.a("--->startVerify: in");
        this.a = verifierListener;
        a_();
        C0020ai.a("--->startVerify: out");
    }

    public void a(byte[] bArr, int i) {
        if (s()) {
            this.a.onVolumeChanged(i, bArr);
        }
    }

    protected void a(byte[] bArr, boolean z) throws SpeechError {
        this.d.a(bArr, bArr.length);
        if (z) {
            if (!this.d.b()) {
                a(bArr, this.d.c());
            } else {
                C0020ai.a("---> VadCheck Time: Vad End Point");
                i();
            }
        }
    }

    public synchronized boolean a() {
        boolean z;
        C0020ai.a("--->stopRecord: in");
        if (t() != AbstractHandlerC0059w.b.recording) {
            C0020ai.a("endVerify fail  status is :" + t());
            z = false;
        } else {
            if (!m()) {
                A();
            }
            a(3);
            C0020ai.a("--->stopRecord: out");
            z = true;
        }
        return z;
    }

    protected void b() throws Exception {
        C0020ai.a("--->onStart: in");
        String strE = u().e(SpeechConstant.ENGINE_TYPE);
        boolean zA = u().a(SpeechConstant.NET_CHECK, true);
        if (SpeechConstant.TYPE_CLOUD.equals(strE) && zA) {
            Y.b(this.r);
        }
        int iA = u().a("record_read_rate", 40);
        if (this.j != -1 && s()) {
            C0020ai.a("start  record");
            if (this.e == null) {
                this.e = new PcmRecorder(r(), iA, this.j);
                this.e.startRecording(this);
            }
        }
        if (t() != AbstractHandlerC0059w.b.exiting && this.a != null) {
            this.a.onBeginOfSpeech();
        }
        this.b = SystemClock.elapsedRealtime();
        removeMessages(9);
        a(9, AbstractHandlerC0059w.a.normal, false, this.p);
        a(1, AbstractHandlerC0059w.a.max, false, 0);
        C0020ai.a("--->onStart: out");
    }

    protected void b(Message message) throws Exception {
        byte[] bArr = (byte[]) message.obj;
        if (bArr == null || bArr.length == 0) {
            return;
        }
        this.i.add(bArr);
        a(bArr, true);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.a != null) {
            this.a.onError(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        A();
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.p = u().a(SpeechConstant.KEY_SPEECH_TIMEOUT, this.p);
        this.g = u().e(SpeechConstant.ISV_VID);
        this.j = u().a(SpeechConstant.AUDIO_SOURCE, 1);
        this.l = u().a(SpeechConstant.FILTER_AUDIO_TIME, 0) * (((u().a(SpeechConstant.SAMPLE_RATE, this.q) / 1000) * 16) / 8);
        C0020ai.a("mSpeechTimeOut=" + this.p);
        super.c();
    }

    void c(Message message) throws InterruptedException, SpeechError, UnsupportedEncodingException {
        if (!m()) {
            A();
        }
        y();
        if (t() == AbstractHandlerC0059w.b.waitresult) {
            a(4, AbstractHandlerC0059w.a.normal, false, 20);
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.d.g();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.d.f();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return SpeechConstant.ENG_IVP;
    }

    protected void h() throws Exception {
        if (this.d.a == null) {
            C0021aj.a("SDKSessionBegin", null);
            this.d.a(this.r, this.g, this);
        }
        a(AbstractHandlerC0059w.b.recording);
    }

    public void i() {
        if (AbstractHandlerC0059w.b.recording == t()) {
            C0020ai.a("--->vadEndCall: out");
            a();
            if (this.a != null) {
                this.a.onEndOfSpeech();
            }
        }
    }

    public ConcurrentLinkedQueue<byte[]> j() {
        return this.i;
    }

    public int k() {
        return this.j;
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onError(SpeechError speechError) {
        b(speechError);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordBuffer(byte[] bArr, int i, int i2) {
        if (AbstractHandlerC0059w.b.recording == t() && i2 > 0) {
            if (this.l <= 0) {
                byte[] bArr2 = new byte[i2];
                System.arraycopy(bArr, i, bArr2, 0, i2);
                d(obtainMessage(2, bArr2));
            } else {
                if (this.l >= i2) {
                    this.l -= i2;
                    return;
                }
                byte[] bArr3 = new byte[i2 - this.l];
                System.arraycopy(bArr, this.l + i, bArr3, 0, i2 - this.l);
                d(obtainMessage(2, bArr3));
                this.l = 0;
            }
        }
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordReleased() {
        if (this.e == null || !(this.e instanceof com.iflytek.cloud.record.a)) {
            return;
        }
        a();
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordStarted(boolean z) {
        C0020ai.a("time cost: onRecordStarted:" + (SystemClock.elapsedRealtime() - this.k));
    }
}
