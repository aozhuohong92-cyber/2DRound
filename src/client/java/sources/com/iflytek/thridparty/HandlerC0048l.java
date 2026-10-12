package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.record.PcmRecorder;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentLinkedQueue;

/* renamed from: com.iflytek.thridparty.l, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0048l extends AbstractHandlerC0059w implements PcmRecorder.PcmRecordListener {
    public static int j = 0;
    public static int k = 0;
    protected volatile RecognizerListener a;
    protected boolean b;
    protected boolean c;
    protected boolean d;
    protected boolean e;
    protected int f;
    protected boolean g;
    protected C0047k h;
    protected PcmRecorder i;
    protected String l;
    protected ConcurrentLinkedQueue<byte[]> m;
    protected ArrayList<String> n;
    protected C0061y o;
    private int v;
    private boolean w;
    private int x;

    public HandlerC0048l(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.a = null;
        this.b = false;
        this.c = false;
        this.d = false;
        this.e = false;
        this.f = 1;
        this.g = true;
        this.h = new C0047k();
        this.i = null;
        this.l = null;
        this.m = null;
        this.n = null;
        this.o = new C0061y();
        this.v = 0;
        this.w = false;
        this.x = 0;
        this.m = new ConcurrentLinkedQueue<>();
        this.n = new ArrayList<>();
        this.e = false;
        a(c0027ap);
    }

    private void a(boolean z, byte[] bArr) throws SpeechError, UnsupportedEncodingException {
        String str;
        this.t = SystemClock.elapsedRealtime();
        if (bArr != null && bArr.length > 0) {
            str = new String(bArr, "utf-8");
        } else if (this.n.size() <= 0) {
            String strE = u().e(SpeechConstant.LOCAL_GRAMMAR);
            if (!TextUtils.isEmpty(strE) && !"sms.irf".equals(strE)) {
                throw new SpeechError(ErrorCode.ERROR_NO_MATCH);
            }
            if (u().a(SpeechConstant.ASR_NOMATCH_ERROR, true)) {
                throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
            }
            str = "";
        } else {
            str = "";
        }
        this.n.add(str);
        if (this.a != null && s()) {
            Bundle bundle = new Bundle();
            bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
            this.a.onEvent(20001, 0, 0, bundle);
            if (z && u().a("request_audio_url", false)) {
                Bundle bundle2 = new Bundle();
                bundle2.putString(SpeechEvent.KEY_EVENT_AUDIO_URL, this.h.d());
                this.a.onEvent(23001, 0, 0, bundle2);
            }
            RecognizerResult recognizerResult = new RecognizerResult(str);
            C0021aj.a("GetNotifyResult", null);
            this.a.onResult(recognizerResult, z);
        }
        C0020ai.a("msc result time:" + System.currentTimeMillis());
        if (z) {
            b((SpeechError) null);
        }
    }

    private void x() throws InterruptedException, SpeechError, IOException {
        C0020ai.a("recording stop");
        y();
        this.o.a("app_lau");
        this.h.a();
        n();
    }

    private void y() {
        if (this.i != null) {
            this.i.stopRecord(u().a("record_force_stop", false));
            this.i = null;
            this.o.a("rec_close");
            if (this.a != null) {
                this.a.onEvent(22003, 0, 0, null);
            }
        }
    }

    public int a() {
        return this.f;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        super.a(message);
        switch (message.what) {
            case 0:
                h();
                break;
            case 1:
                i();
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
            case 7:
                j();
                break;
            case 9:
                k();
                break;
        }
    }

    public synchronized void a(RecognizerListener recognizerListener) {
        this.a = recognizerListener;
        C0020ai.a("startListening called");
        a_();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        C0020ai.a("onSessionEnd");
        y();
        j = this.h.b("upflow");
        k = this.h.b("downflow");
        f();
        if (this.n.size() <= 0 && speechError == null && u().a(SpeechConstant.ASR_NOMATCH_ERROR, true)) {
            speechError = new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
        }
        if (speechError != null) {
            this.o.a("app_ret", speechError.getErrorCode(), false);
        } else {
            this.o.a("app_ret", 0L, false);
        }
        this.o.a("rec_ustop", this.e ? "1" : "0", false);
        this.h.a("sessinfo", this.o.a());
        C0021aj.a("SessionEndBegin", null);
        if (this.s) {
            this.h.a("user abort");
        } else if (speechError != null) {
            this.h.a("error" + speechError.getErrorCode());
        } else {
            this.h.a("success");
        }
        C0021aj.a("SessionEndEnd", null);
        super.a(speechError);
        if (this.a != null) {
            if (this.s) {
                C0020ai.a("RecognizerListener#onCancel");
            } else {
                C0020ai.a("RecognizerListener#onEnd");
                if (speechError != null) {
                    Bundle bundle = new Bundle();
                    bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
                    this.a.onEvent(20001, 0, 0, bundle);
                    this.a.onError(speechError);
                }
            }
        }
        this.a = null;
    }

    public void a(byte[] bArr, int i) {
        if (this.a == null || !s()) {
            return;
        }
        this.a.onVolumeChanged(i, bArr);
        if (this.w) {
            Bundle bundle = new Bundle();
            bundle.putByteArray(SpeechEvent.KEY_EVENT_RECORD_DATA, bArr);
            this.a.onEvent(21003, i, 0, bundle);
        }
    }

    protected void a(byte[] bArr, boolean z) throws SpeechError {
        if (!this.c) {
            this.c = true;
            this.o.a("app_fau");
            if (this.a != null) {
                this.a.onEvent(22002, 0, 0, null);
            }
        }
        this.h.a(bArr, bArr.length);
        if (z) {
            int iB = this.h.b();
            C0020ai.a("QISRAudioWrite volume:" + iB);
            a(bArr, iB);
        }
    }

    public synchronized boolean a(boolean z) {
        C0020ai.a("stopRecognize, current status is :" + t() + " usercancel : " + z);
        this.o.a("app_stop");
        y();
        this.e = z;
        a(3);
        return true;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a_() {
        this.o.a(u());
        super.a_();
    }

    public ConcurrentLinkedQueue<byte[]> b() {
        return this.m;
    }

    protected void b(Message message) throws Exception {
        byte[] bArr = (byte[]) message.obj;
        if (bArr == null || bArr.length == 0) {
            return;
        }
        this.m.add(bArr);
        a(bArr, true);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.a != null) {
            this.a.onError(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        y();
        if (t() == AbstractHandlerC0059w.b.recording) {
            this.e = true;
        }
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.l = u().e(SpeechConstant.CLOUD_GRAMMAR);
        this.f = u().a(SpeechConstant.AUDIO_SOURCE, 1);
        this.g = C0029ar.a(u().e("domain"));
        this.v = u().a(SpeechConstant.FILTER_AUDIO_TIME, 0) * (((u().a(SpeechConstant.SAMPLE_RATE, this.q) / 1000) * 16) / 8);
        this.p = u().a(SpeechConstant.KEY_SPEECH_TIMEOUT, this.p);
        this.w = u().a(SpeechConstant.NOTIFY_RECORD_DATA, false);
        C0020ai.a("mSpeechTimeOut=" + this.p);
        super.c();
    }

    void c(Message message) throws InterruptedException, SpeechError, UnsupportedEncodingException {
        int i = message.arg1;
        byte[] bArr = (byte[]) message.obj;
        switch (i) {
            case 0:
                if (!this.d) {
                    this.d = true;
                    this.o.a("app_frs");
                }
                a(false, bArr);
                break;
            case 5:
                if (!this.d) {
                    this.d = true;
                    this.o.a("app_frs");
                }
                this.o.a("app_lrs");
                a(true, bArr);
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.h.g();
    }

    void errCb(char[] cArr, int i, byte[] bArr) {
        onError(new SpeechError(i));
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.h.c();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        String str = null;
        try {
            str = TextUtils.isEmpty(this.l) ? "iat" : "asr";
            C0027ap c0027apU = u();
            if (c0027apU == null) {
                return str;
            }
            if (!c0027apU.a("sch", false)) {
                if (!c0027apU.a("asr_sch", false)) {
                    return str;
                }
            }
            return "iat_sch";
        } catch (Exception e) {
            C0020ai.b("DC get sub type exception:");
            C0020ai.a(e);
            return str;
        }
    }

    protected void h() throws Exception {
        C0020ai.a("start connecting");
        String strE = u().e(SpeechConstant.ENGINE_TYPE);
        if (u().a(SpeechConstant.NET_CHECK, true)) {
            if (SpeechConstant.TYPE_CLOUD.equals(strE)) {
                Y.b(this.r);
            } else if (SpeechConstant.TYPE_MIX.equals(strE) || "mixed".equals(strE)) {
                try {
                    Y.b(this.r);
                } catch (Exception e) {
                    u().a(SpeechConstant.ENGINE_TYPE, SpeechConstant.TYPE_LOCAL);
                }
            }
        }
        int iA = u().a("record_read_rate", 40);
        if (this.f != -1 && s()) {
            C0020ai.a("start  record");
            if (this.f == -2) {
                this.i = new com.iflytek.cloud.record.a(r(), iA, this.f, u().e(SpeechConstant.ASR_SOURCE_PATH));
            } else {
                this.i = new PcmRecorder(r(), iA, this.f);
                if (hasMessages(3)) {
                    throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
                }
            }
            this.o.a("rec_open");
            this.i.startRecording(this);
            a(9, AbstractHandlerC0059w.a.normal, false, this.p);
        }
        if (this.a != null && this.f > -1) {
            this.a.onBeginOfSpeech();
        }
        this.o.a("app_ssb");
        a(1, AbstractHandlerC0059w.a.max, false, 0);
    }

    protected void i() throws Exception {
        C0021aj.a("SDKSessionBegin", null);
        int iA = this.h.a(this.r, this.l, this);
        if (iA != 0 || this.h.a == null) {
            this.x++;
            if (this.x > 40) {
                throw new SpeechError(iA);
            }
            if (s()) {
                Thread.sleep(15L);
                a(1, AbstractHandlerC0059w.a.max, false, 0);
                return;
            }
            return;
        }
        if (s()) {
            MSC.QISRRegisterNotify(this.h.a, "rsltCb", "stusCb", "errCb", this);
            a(AbstractHandlerC0059w.b.recording);
            if (u().a(SpeechConstant.ASR_NET_PERF, false)) {
                a(7, AbstractHandlerC0059w.a.max, false, 0);
            }
        }
    }

    public void j() {
        if (s()) {
            int iB = this.h.b("netperf");
            if (this.a != null) {
                this.a.onEvent(SpeechEvent.EVENT_NETPREF, iB, 0, null);
            }
            a(7, AbstractHandlerC0059w.a.normal, false, 100);
        }
    }

    public void k() {
        if (AbstractHandlerC0059w.b.recording == t()) {
            if (this.a != null) {
                this.a.onEndOfSpeech();
            }
            a(false);
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public boolean l() {
        return this.g;
    }

    public C0061y m() {
        return this.o;
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onError(SpeechError speechError) {
        b(speechError);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordBuffer(byte[] bArr, int i, int i2) {
        if (bArr == null || i2 <= 0 || bArr.length < i2 || i2 <= 0 || !s()) {
            return;
        }
        if (!this.b) {
            this.b = true;
            this.o.a("rec_start");
        }
        if (this.v <= 0) {
            byte[] bArr2 = new byte[i2];
            System.arraycopy(bArr, i, bArr2, 0, i2);
            d(obtainMessage(2, bArr2));
        } else {
            if (this.v >= i2) {
                this.v -= i2;
                return;
            }
            byte[] bArr3 = new byte[i2 - this.v];
            System.arraycopy(bArr, this.v + i, bArr3, 0, i2 - this.v);
            d(obtainMessage(2, bArr3));
            this.v = 0;
        }
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordReleased() {
        if (this.i == null || !(this.i instanceof com.iflytek.cloud.record.a)) {
            return;
        }
        a(true);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordStarted(boolean z) {
        this.o.a("rec_ready");
    }

    void rsltCb(char[] cArr, byte[] bArr, int i, int i2) {
        if (bArr != null) {
            C0020ai.a("MscRecognizer", "rsltCb:" + i2 + "result:" + new String(bArr));
        } else {
            C0020ai.a("MscRecognizer", "rsltCb:" + i2 + "result:null");
        }
        Message messageObtainMessage = obtainMessage(4, i2, 0, bArr);
        if (hasMessages(4)) {
            a(messageObtainMessage, AbstractHandlerC0059w.a.normal, false, 0);
        } else {
            a(messageObtainMessage, AbstractHandlerC0059w.a.max, false, 0);
        }
    }

    void stusCb(char[] cArr, int i, int i2, int i3, byte[] bArr) {
        if (i == 0 && i2 == 3) {
            C0020ai.a("MscRecognizer", "stusCb:" + i2 + ",type:" + i);
            k();
        }
    }
}
