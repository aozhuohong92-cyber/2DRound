package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.WakeuperListener;
import com.iflytek.cloud.WakeuperResult;
import com.iflytek.cloud.record.PcmRecorder;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.r, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0054r extends AbstractHandlerC0059w implements PcmRecorder.PcmRecordListener {
    public String a;
    protected volatile WakeuperListener b;
    protected boolean c;
    protected int d;
    protected C0053q e;
    protected PcmRecorder f;
    protected ArrayList<String> g;
    public boolean h;
    public boolean i;
    private int j;

    public HandlerC0054r(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.b = null;
        this.c = false;
        this.d = 1;
        this.e = new C0053q();
        this.f = null;
        this.g = null;
        this.h = false;
        this.i = false;
        this.j = 0;
        this.c = false;
        a(c0027ap);
        this.g = new ArrayList<>();
    }

    private void a(boolean z, byte[] bArr, int i) throws SpeechError, UnsupportedEncodingException {
        String str;
        boolean z2 = false;
        if (i == 1) {
            if (bArr != null && bArr.length > 0) {
                str = new String(bArr, q());
            } else {
                if (this.g.size() <= 0) {
                    String strE = u().e(SpeechConstant.LOCAL_GRAMMAR);
                    if (!TextUtils.isEmpty(strE) && !"sms.irf".equals(strE)) {
                        throw new SpeechError(ErrorCode.ERROR_NO_MATCH);
                    }
                    throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
                }
                str = "";
            }
            this.g.add(str);
            if (this.b != null && s()) {
                Bundle bundle = new Bundle();
                bundle.putParcelable(SpeechEvent.KEY_EVENT_IVW_RESULT, new RecognizerResult(str));
                this.b.onEvent(22001, z ? 1 : 0, 0, bundle);
            }
            C0020ai.a("msc result time:" + System.currentTimeMillis());
        } else if (i == 0) {
            if (bArr == null || bArr.length <= 0) {
                throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
            }
            String str2 = new String(bArr, "utf-8");
            if (this.b != null && s()) {
                WakeuperResult wakeuperResult = new WakeuperResult(str2);
                C0021aj.a("GetNotifyResult", null);
                this.b.onResult(wakeuperResult);
            }
        } else if (i == 2) {
            if (bArr == null || bArr.length <= 0) {
                throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
            }
            String str3 = new String(bArr, "utf-8");
            if (this.a.equals("enroll")) {
                if (this.b != null) {
                    this.b.onResult(new WakeuperResult(str3));
                }
                try {
                    JSONObject jSONObject = new JSONObject(str3);
                    if (jSONObject.getInt("suc_times") != jSONObject.getInt("total_times")) {
                        a(0);
                    } else {
                        z2 = true;
                    }
                } catch (Exception e) {
                    throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
                }
            }
            if (this.b != null && s()) {
                this.b.onResult(new WakeuperResult(str3));
                if (z2) {
                    b((SpeechError) null);
                }
            }
        }
        if (z) {
            b((SpeechError) null);
        }
    }

    private void k() throws InterruptedException, SpeechError, IOException {
        C0020ai.a("recording stop");
        if (!this.a.equals("enroll")) {
            m();
        }
        this.e.a();
    }

    private void m() {
        if (this.f != null) {
            this.f.stopRecord(u().a("record_force_stop", false));
            this.f = null;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    int MsgProcCallBack(char[] cArr, int i, int i2, int i3, byte[] bArr) {
        if (bArr != null) {
            C0020ai.a("MscWakeuper", "msg:" + i + "param1:" + i2 + "param2:" + i3 + "result:" + new String(bArr));
        } else {
            C0020ai.a("MscWakeuper", "msg:" + i + "param1:" + i2 + "param2:" + i3 + "result:null");
        }
        switch (i) {
            case 1:
                this.h = true;
                Message messageObtainMessage = (this.i || this.a.equals("oneshot")) ? obtainMessage(4, 0, 0, bArr) : obtainMessage(4, 5, 0, bArr);
                if (hasMessages(4)) {
                    a(messageObtainMessage, AbstractHandlerC0059w.a.normal, false, 0);
                } else {
                    a(messageObtainMessage, AbstractHandlerC0059w.a.max, false, 0);
                }
                return 0;
            case 2:
                onError(new SpeechError(i2));
                return 0;
            case 3:
                Message messageObtainMessage2 = obtainMessage(4, i2, 1, bArr);
                if (hasMessages(4)) {
                    a(messageObtainMessage2, AbstractHandlerC0059w.a.normal, false, 0);
                } else {
                    a(messageObtainMessage2, AbstractHandlerC0059w.a.max, false, 0);
                }
                return 0;
            case 4:
                if (i2 == 3) {
                    i();
                }
                return 0;
            case 5:
                try {
                    if (this.b != null) {
                        this.b.onVolumeChanged(i2);
                    }
                } catch (Exception e) {
                }
                return 0;
            case 6:
                a(obtainMessage(4, 0, 2, bArr), AbstractHandlerC0059w.a.max, false, 0);
                return 0;
            default:
                return 0;
        }
    }

    public int a() {
        return this.d;
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
                k();
                break;
            case 4:
                c(message);
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        C0020ai.a("onSessionEnd");
        m();
        if (this.a.equals("oneshot") && this.h && this.g.size() <= 0 && speechError == null && u().a(SpeechConstant.ASR_NOMATCH_ERROR, true)) {
            speechError = new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
        }
        C0021aj.a("SessionEndBegin", null);
        if (this.s) {
            this.e.a("user abort");
        } else if (speechError != null) {
            this.e.a("error" + speechError.getErrorCode());
        } else {
            this.e.a("success");
        }
        C0021aj.a("SessionEndEnd", null);
        super.a(speechError);
        if (this.b != null) {
            if (this.s) {
                C0020ai.a("WakeuperListener#onCancel");
            } else {
                C0020ai.a("WakeuperListener#onEnd");
                if (speechError != null) {
                    this.b.onError(speechError);
                }
            }
        }
        this.b = null;
    }

    public synchronized void a(WakeuperListener wakeuperListener) {
        this.b = wakeuperListener;
        C0020ai.a("startListening called");
        a_();
    }

    protected void a(byte[] bArr, boolean z) throws SpeechError {
        this.e.a(bArr, bArr.length);
    }

    public synchronized boolean a(boolean z) {
        C0020ai.a("stopListening, current status is :" + t() + " usercancel : " + z);
        if (this.a.equals("enroll")) {
            this.c = z;
            a(3);
        } else if (this.a.equals("oneshot") && this.h) {
            m();
            this.c = z;
            a(3);
        } else {
            b(false);
        }
        return true;
    }

    protected void b() throws Exception {
        C0020ai.a("start connecting");
        this.h = false;
        int iA = u().a("record_read_rate", 40);
        if (this.d != -1 && s()) {
            C0020ai.a("start  record");
            if (this.f == null) {
                this.f = new PcmRecorder(r(), iA, this.d);
                this.f.startRecording(this);
            }
        }
        if (t() != AbstractHandlerC0059w.b.exiting && this.b != null) {
            this.b.onBeginOfSpeech();
        }
        a(1, AbstractHandlerC0059w.a.max, false, 0);
    }

    protected void b(Message message) throws Exception {
        byte[] bArr = (byte[]) message.obj;
        if (bArr == null || bArr.length == 0) {
            return;
        }
        a(bArr, true);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.b != null) {
            this.b.onError(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        C0020ai.a("cancel");
        m();
        if (t() == AbstractHandlerC0059w.b.recording) {
            this.c = true;
        }
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.a = u().b("sst", "wakeup");
        this.i = u().a(SpeechConstant.KEEP_ALIVE, false);
        this.d = u().a(SpeechConstant.AUDIO_SOURCE, 1);
        u().a("ivw_netval", O.a(this.r).b("ivw_netval", 20) + "");
        super.c();
    }

    void c(Message message) throws InterruptedException, SpeechError, UnsupportedEncodingException {
        int i = message.arg1;
        byte[] bArr = (byte[]) message.obj;
        switch (i) {
            case 0:
                a(false, bArr, message.arg2);
                return;
            case 1:
            case 3:
            case 4:
            default:
                return;
            case 2:
                throw new SpeechError(ErrorCode.ERROR_FILE_ACCESS);
            case 5:
                a(true, bArr, message.arg2);
                return;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.e.g();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return null;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return "ivw";
    }

    protected void h() throws Exception {
        if (this.e.a == null) {
            C0021aj.a("SDKSessionBegin", null);
            int iA = this.e.a(this.r, this.a, this);
            if (iA == 0 && this.e.a != null) {
                if (s()) {
                    MSC.QIVWRegisterNotify(this.e.a, "MsgProcCallBack", this);
                    a(AbstractHandlerC0059w.b.recording);
                    return;
                }
                return;
            }
            this.j++;
            if (this.j > 40) {
                throw new SpeechError(iA);
            }
            if (s()) {
                Thread.sleep(15L);
                a(1, AbstractHandlerC0059w.a.max, false, 0);
            }
        }
    }

    public void i() {
        if (AbstractHandlerC0059w.b.recording == t()) {
            a(false);
        }
    }

    public WakeuperListener j() {
        return this.b;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public boolean l() {
        return false;
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onError(SpeechError speechError) {
        b(speechError);
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordBuffer(byte[] bArr, int i, int i2) {
        if (bArr.length < i2 || bArr == null || i2 <= 0 || i2 <= 0 || !s()) {
            return;
        }
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        d(obtainMessage(2, bArr2));
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordReleased() {
    }

    @Override // com.iflytek.cloud.record.PcmRecorder.PcmRecordListener
    public void onRecordStarted(boolean z) {
    }
}
