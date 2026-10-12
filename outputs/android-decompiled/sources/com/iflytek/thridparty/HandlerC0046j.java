package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.EvaluatorListener;
import com.iflytek.cloud.EvaluatorResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.record.PcmRecorder;
import com.iflytek.thridparty.AbstractC0060x;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.concurrent.ConcurrentLinkedQueue;

/* renamed from: com.iflytek.thridparty.j, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0046j extends AbstractHandlerC0059w implements PcmRecorder.PcmRecordListener {
    public static int a = 0;
    public static int b = 0;
    private static Boolean m = false;
    long c;
    long d;
    protected int e;
    protected C0045i f;
    protected PcmRecorder g;
    protected C0061y h;
    protected String i;
    protected byte[] j;
    protected String k;
    protected String l;
    private volatile EvaluatorListener n;
    private ConcurrentLinkedQueue<byte[]> o;
    private ConcurrentLinkedQueue<byte[]> v;
    private ArrayList<String> w;
    private boolean x;
    private AbstractC0060x.a y;

    public HandlerC0046j(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.n = null;
        this.c = 0L;
        this.d = 0L;
        this.e = 1;
        this.f = new C0045i();
        this.g = null;
        this.h = new C0061y();
        this.i = null;
        this.j = null;
        this.k = null;
        this.l = null;
        this.o = null;
        this.v = null;
        this.w = null;
        this.x = false;
        this.y = AbstractC0060x.a.noResult;
        this.v = new ConcurrentLinkedQueue<>();
        this.o = new ConcurrentLinkedQueue<>();
        this.w = new ArrayList<>();
        this.x = false;
        a(c0027ap);
    }

    private void a(byte[] bArr, int i) {
        if (this.n == null || !s()) {
            return;
        }
        this.n.onVolumeChanged(i, bArr);
    }

    private void a(byte[] bArr, boolean z) throws SpeechError {
        this.f.a(bArr, bArr.length);
        if (z) {
            if (this.f.b() == 3) {
                j();
            } else {
                a(bArr, this.f.c());
            }
        }
    }

    private void d(boolean z) throws SpeechError, UnsupportedEncodingException {
        this.t = SystemClock.elapsedRealtime();
        if (this.f.d() != null && this.f.d().length > 0) {
            this.w.add(new String(this.f.d(), "utf-8"));
        }
        c(z);
    }

    private void h() throws InterruptedException, SpeechError, IOException {
        C0020ai.a("--->onStoped: in");
        if (!s()) {
            k();
        }
        this.f.a();
        n();
        C0020ai.a("--->onStoped: out");
    }

    private void i() throws SpeechError, UnsupportedEncodingException {
        AbstractC0060x.a aVarE = this.f.e();
        this.y = aVarE;
        switch (aVarE) {
            case hasResult:
                d(false);
                break;
            case resultOver:
                d(true);
                break;
        }
    }

    private void j() {
        if (AbstractHandlerC0059w.b.recording == t()) {
            a(false);
            if (this.n != null) {
                this.n.onEndOfSpeech();
            }
        }
    }

    private void k() {
        if (this.g != null) {
            this.g.stopRecord(u().a("record_force_stop", false));
            this.g = null;
        }
    }

    protected void a() throws Exception {
        C0020ai.a("--->onStart: in");
        if (u().a(SpeechConstant.NET_CHECK, true)) {
            Y.b(this.r);
        }
        int iA = u().a("record_read_rate", 40);
        this.e = u().a(SpeechConstant.AUDIO_SOURCE, 1);
        if (this.e != -1 && s()) {
            C0020ai.a("start  record");
            if (this.e == -2) {
                this.g = new com.iflytek.cloud.record.a(r(), iA, this.e, u().e(SpeechConstant.ISE_SOURCE_PATH));
            } else {
                this.g = new PcmRecorder(r(), iA, this.e);
            }
            this.g.startRecording(this);
        }
        if (t() != AbstractHandlerC0059w.b.exiting && this.n != null) {
            this.n.onBeginOfSpeech();
        }
        removeMessages(9);
        if (-1 != this.p) {
            a(9, AbstractHandlerC0059w.a.normal, false, this.p);
        }
        a(1, AbstractHandlerC0059w.a.max, false, 0);
        C0020ai.a("--->onStart: out");
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        super.a(message);
        switch (message.what) {
            case 0:
                a();
                break;
            case 1:
                b();
                break;
            case 2:
                b(message);
                break;
            case 3:
                h();
                break;
            case 4:
                c(message);
                break;
            case 9:
                C0020ai.a("--->on timeout vad");
                j();
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        C0020ai.a("--->onEnd: in");
        k();
        f();
        C0021aj.a("SessionEndBegin", null);
        if (this.s) {
            this.f.a("user abort");
        } else if (speechError != null) {
            this.f.a("error" + speechError.getErrorCode());
        } else {
            this.f.a("success");
        }
        C0021aj.a("SessionEndEnd", null);
        super.a(speechError);
        if (this.n != null && !this.s) {
            C0020ai.a("VerifyListener#onEnd");
            if (speechError != null) {
                Bundle bundle = new Bundle();
                bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
                this.n.onEvent(20001, 0, 0, bundle);
                this.n.onError(speechError);
            }
        }
        this.n = null;
        C0020ai.a("--->onEnd: out");
    }

    public synchronized void a(String str, String str2, EvaluatorListener evaluatorListener) {
        m = false;
        this.k = str;
        this.i = str2;
        this.l = u().e(SpeechConstant.ISE_USER_MODEL_ID);
        this.n = evaluatorListener;
        C0020ai.a("startListening called");
        a_();
    }

    public synchronized void a(byte[] bArr, String str, EvaluatorListener evaluatorListener) {
        m = true;
        this.j = bArr;
        this.i = str;
        this.l = u().e(SpeechConstant.ISE_USER_MODEL_ID);
        this.n = evaluatorListener;
        C0020ai.a("startListening called");
        a_();
    }

    public synchronized boolean a(boolean z) {
        boolean z2 = false;
        synchronized (this) {
            if (t() != AbstractHandlerC0059w.b.recording) {
                C0020ai.a("stopRecognize fail  status is :" + t());
            } else {
                if (this.g != null) {
                    this.g.stopRecord(u().a("record_force_stop", false));
                }
                this.x = z;
                a(3);
                z2 = true;
            }
        }
        return z2;
    }

    protected void b() throws Exception {
        if (this.f.a == null) {
            C0021aj.a("SDKSessionBegin", null);
            this.f.a(this.r, this.l, this);
        }
        this.f.a(m.booleanValue() ? "1".equals(u().e(SpeechConstant.TEXT_BOM)) ? Q.a(this.j) : this.j : "1".equals(u().e(SpeechConstant.TEXT_BOM)) ? Q.a(this.k) : this.k.getBytes("gb2312"), TextUtils.isEmpty(this.i) ? null : this.i.getBytes("gb2312"));
        a(AbstractHandlerC0059w.b.recording);
        a(4, AbstractHandlerC0059w.a.normal, false, 20);
    }

    protected void b(Message message) throws Exception {
        byte[] bArr = (byte[]) message.obj;
        if (bArr == null || bArr.length == 0) {
            return;
        }
        if (!TextUtils.isEmpty(u().e(SpeechConstant.ISE_AUDIO_PATH))) {
            this.o.add(bArr);
        }
        a(bArr, true);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.n != null) {
            this.n.onError(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        k();
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.p = u().a(SpeechConstant.KEY_SPEECH_TIMEOUT, -1);
        C0020ai.a("mSpeechTimeOut=" + this.p);
        if ("utf-8".equals(u().e(SpeechConstant.TEXT_ENCODING)) && Locale.CHINA.toString().equalsIgnoreCase(u().e(SpeechConstant.LANGUAGE))) {
            u().a(SpeechConstant.TEXT_BOM, "1", false);
        } else {
            u().a(SpeechConstant.TEXT_BOM, "0", false);
        }
        super.c();
    }

    void c(Message message) throws InterruptedException, SpeechError, UnsupportedEncodingException {
        i();
        if (AbstractC0060x.a.noResult == this.y) {
            a(4, AbstractHandlerC0059w.a.normal, false, 20);
        } else if (AbstractC0060x.a.hasResult == this.y) {
            a(4);
        }
    }

    public void c(boolean z) throws SpeechError, UnsupportedEncodingException {
        C0020ai.a("msc result time:" + System.currentTimeMillis());
        EvaluatorResult evaluatorResult = new EvaluatorResult(new String(this.f.d(), u().b("rse", "gb2312")));
        if (this.n != null) {
            Bundle bundle = new Bundle();
            bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
            this.n.onEvent(20001, 0, 0, bundle);
            C0021aj.a("GetNotifyResult", null);
            this.n.onResult(evaluatorResult, z);
        }
        if (z) {
            b((SpeechError) null);
        }
    }

    public ConcurrentLinkedQueue<byte[]> d() {
        while (true) {
            byte[] bArrPoll = this.v.poll();
            if (bArrPoll == null) {
                return this.o;
            }
            this.o.add(bArrPoll);
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.f.g();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.f.f();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return "ise";
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onError(SpeechError speechError) {
        b(speechError);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordBuffer(byte[] bArr, int i, int i2) {
        if (AbstractHandlerC0059w.b.recording == t() && i2 > 0) {
            byte[] bArr2 = new byte[i2];
            System.arraycopy(bArr, i, bArr2, 0, i2);
            d(obtainMessage(2, bArr2));
        }
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordReleased() {
        if (this.g == null || !(this.g instanceof com.iflytek.cloud.record.a)) {
            return;
        }
        a(true);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordStarted(boolean z) {
    }
}
