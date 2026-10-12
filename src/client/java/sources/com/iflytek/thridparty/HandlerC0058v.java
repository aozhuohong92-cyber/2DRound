package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.IdentityListener;
import com.iflytek.cloud.IdentityResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.msc.MSC;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.v, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0058v extends AbstractHandlerC0059w {
    protected volatile IdentityListener a;
    protected boolean b;
    protected boolean c;
    protected boolean d;
    protected C0057u e;
    protected String h;
    protected C0061y i;
    long j;
    private boolean l;
    private P m;
    private HashMap<String, C0027ap> n;
    private HashMap<String, StringBuffer> o;
    private HashMap<String, Boolean> v;
    private int w;
    private static final String k = HandlerC0058v.class.getSimpleName();
    public static int f = 0;
    public static int g = 0;

    public HandlerC0058v(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.l = true;
        this.a = null;
        this.b = false;
        this.c = false;
        this.d = false;
        this.e = new C0057u();
        this.h = null;
        this.i = new C0061y();
        this.n = null;
        this.o = null;
        this.w = 0;
        this.j = 0L;
        this.m = new P();
        this.d = false;
        this.n = new HashMap<>();
        this.o = new HashMap<>();
        this.v = new HashMap<>();
        a(c0027ap);
    }

    private void a(boolean z, byte[] bArr) throws SpeechError, UnsupportedEncodingException {
        this.t = SystemClock.elapsedRealtime();
        if (bArr == null || bArr.length <= 0) {
            throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
        }
        String strReplace = new String(bArr, "utf-8").replace("\"return\"", "\"ret\"");
        this.h = strReplace;
        if (this.a != null && s()) {
            Bundle bundle = new Bundle();
            bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
            this.a.onEvent(20001, 0, 0, bundle);
            IdentityResult identityResult = new IdentityResult(strReplace);
            C0021aj.a("GetNotifyResult", null);
            this.a.onResult(identityResult, z);
        }
        C0020ai.a("msc result time:" + System.currentTimeMillis());
        if (z) {
            b((SpeechError) null);
        }
    }

    private void e(Message message) throws InterruptedException, SpeechError, IOException {
        C0020ai.a("recording stop");
        this.i.a("app_lau");
        this.v.put((String) message.obj, true);
        this.e.b((String) message.obj);
        n();
    }

    public P a() {
        return this.m;
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
                e(message);
                break;
            case 4:
                c(message);
                break;
            case 7:
                i();
                break;
            case 9:
                j();
                break;
        }
    }

    public synchronized void a(IdentityListener identityListener) {
        this.a = identityListener;
        C0020ai.a("startWorking called");
        a_();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        C0020ai.a("onSessionEnd");
        f = this.e.c("upflow");
        g = this.e.c("downflow");
        f();
        if (this.h == null && speechError == null && u().a(SpeechConstant.ASR_NOMATCH_ERROR, true)) {
            speechError = new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
        }
        if (speechError != null) {
            this.i.a("app_ret", speechError.getErrorCode(), false);
        } else {
            this.i.a("app_ret", 0L, false);
        }
        this.i.a("rec_ustop", this.d ? "1" : "0", false);
        this.e.a("sessinfo", this.i.a());
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
        if (this.a != null) {
            if (!this.s && speechError != null) {
                this.a.onError(speechError);
            }
            this.a.onEvent(SpeechEvent.EVENT_SESSION_END, 0, 0, null);
        }
        this.a = null;
    }

    public void a(String str, String str2, byte[] bArr, int i, int i2) {
        if (!this.n.containsKey(str)) {
            C0027ap c0027ap = new C0027ap();
            c0027ap.a(str2);
            c0027ap.a("sst", u().e("sst"), false);
            c0027ap.a("mver", "2.0", false);
            c0027ap.a("ssub", str);
            this.l = c0027ap.a(SpeechConstant.VAD_ENABLE, true);
            this.n.put(str, c0027ap);
            this.o.put(str, new StringBuffer(c0027ap.toString()));
        }
        if (s()) {
            if (!this.b) {
                this.b = true;
                this.i.a("rec_start");
            }
            HashMap map = new HashMap();
            map.put("ssub", str);
            byte[] bArr2 = null;
            if (bArr != null) {
                bArr2 = new byte[i2];
                System.arraycopy(bArr, i, bArr2, 0, i2);
            }
            map.put(SpeechEvent.KEY_EVENT_RECORD_DATA, bArr2);
            d(obtainMessage(2, map));
        }
    }

    protected void a(StringBuffer stringBuffer, byte[] bArr, boolean z, boolean z2) throws SpeechError {
        this.e.a(stringBuffer, bArr, bArr == null ? 0 : bArr.length, z);
        if (z2) {
            int iA = this.e.a();
            C0020ai.a("QISRAudioWrite volume:" + iA);
            a(bArr, iA);
        }
    }

    public void a(byte[] bArr, int i) {
        if (this.a == null || !s()) {
            return;
        }
        this.a.onEvent(SpeechEvent.EVENT_VOLUME, i, 0, null);
    }

    public synchronized boolean a(String str, boolean z) {
        C0020ai.a("stopRecognize, current status is :" + t() + " usercancel : " + z);
        this.i.a("app_stop");
        this.d = z;
        d(obtainMessage(3, str));
        return true;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a_() {
        this.i.a(u());
        super.a_();
    }

    protected void b() throws Exception {
        C0020ai.a("start connecting");
        a(1, AbstractHandlerC0059w.a.max, false, 0);
    }

    protected void b(Message message) throws Exception {
        HashMap map = (HashMap) message.obj;
        byte[] bArr = (byte[]) map.get(SpeechEvent.KEY_EVENT_RECORD_DATA);
        String str = (String) map.get("ssub");
        C0027ap c0027ap = this.n.get(str);
        StringBuffer stringBuffer = this.o.get(str);
        String strE = c0027ap.e(SpeechConstant.MFV_DATA_PATH);
        if (!TextUtils.isEmpty(strE) && bArr != null) {
            this.m.a(strE, bArr);
        }
        Boolean bool = this.v.get(str);
        if (bool == null) {
            bool = true;
        }
        if (SpeechConstant.ENG_IVP.equals(str) && this.l) {
            a(stringBuffer, bArr, bool.booleanValue(), true);
        } else {
            a(stringBuffer, bArr, bool.booleanValue(), false);
        }
        if (bool.booleanValue()) {
            this.v.put(str, false);
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.a != null) {
            C0020ai.a("cancel");
            this.a.onError(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        if (t() == AbstractHandlerC0059w.b.recording) {
            this.d = true;
        }
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.p = u().a(SpeechConstant.KEY_SPEECH_TIMEOUT, this.p);
        C0020ai.a("mSpeechTimeOut=" + this.p);
        super.c();
    }

    void c(Message message) throws InterruptedException, SpeechError, UnsupportedEncodingException {
        int i = message.arg1;
        byte[] bArr = (byte[]) message.obj;
        switch (i) {
            case 0:
                if (!this.c) {
                    this.c = true;
                    this.i.a("app_frs");
                }
                a(false, bArr);
                break;
            case 5:
                if (!this.c) {
                    this.c = true;
                    this.i.a("app_frs");
                }
                this.i.a("app_lrs");
                a(true, bArr);
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.e.g();
    }

    void errCb(char[] cArr, int i, byte[] bArr) {
        C0020ai.a(k, "clientSessionID:" + new String(cArr) + "errorcode:" + i);
        Bundle bundle = new Bundle();
        bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, f());
        this.a.onEvent(20001, 0, 0, bundle);
        b(new SpeechError(i));
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.e.b();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return "mfv";
    }

    protected void h() throws Exception {
        if (u().a(SpeechConstant.NET_CHECK, true)) {
            Y.b(this.r);
        }
        C0021aj.a("SDKSessionBegin", null);
        this.i.a("app_ssb");
        int iA = this.e.a(this.r, (String) null, this);
        if (iA != 0 || this.e.a == null) {
            this.w++;
            if (this.w > 40) {
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
            MSC.QMFVRegisterNotify(this.e.a, "rsltCb", "stusCb", "errCb", this);
            a(AbstractHandlerC0059w.b.recording);
            if (u().a(SpeechConstant.ASR_NET_PERF, false)) {
                a(7, AbstractHandlerC0059w.a.max, false, 0);
            }
        }
    }

    public void i() {
        if (s()) {
            int iC = this.e.c("netperf");
            if (this.a != null) {
                this.a.onEvent(SpeechEvent.EVENT_NETPREF, iC, 0, null);
            }
            a(7, AbstractHandlerC0059w.a.normal, false, 100);
        }
    }

    public void j() {
        if (AbstractHandlerC0059w.b.recording == t()) {
            if (this.a != null) {
                this.a.onEvent(SpeechEvent.EVENT_VAD_EOS, 0, 0, null);
            }
            a(SpeechConstant.ENG_IVP, false);
        }
    }

    public C0061y k() {
        return this.i;
    }

    void rsltCb(char[] cArr, byte[] bArr, int i, int i2) {
        if (bArr != null) {
            C0020ai.a(k, "rsltCb:" + i2 + "result:" + new String(bArr));
        } else {
            C0020ai.a(k, "rsltCb:" + i2 + "result:null");
        }
        Message messageObtainMessage = obtainMessage(4, i2, 0, bArr);
        if (hasMessages(4)) {
            a(messageObtainMessage, AbstractHandlerC0059w.a.normal, false, 0);
        } else {
            a(messageObtainMessage, AbstractHandlerC0059w.a.max, false, 0);
        }
    }

    void stusCb(char[] cArr, int i, int i2, byte[] bArr, int i3) throws JSONException {
        C0020ai.a(k, "stusCb:" + i2 + ",type:" + i);
        if (i == 0 && 3 == i2) {
            j();
        }
        if (1 == i) {
            String[] strArrSplit = u().b(SpeechConstant.MFV_SCENES, "").split("\\|");
            if (strArrSplit == null || strArrSplit.length >= 2) {
                try {
                    String str = new String(bArr, "utf-8");
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("sub", str);
                    jSONObject.put("sret", i2);
                    jSONObject.put(SpeechUtility.TAG_RESOURCE_RET, i2);
                    jSONObject.put("sst", this.n.get(str).e("sst"));
                    if (this.a != null) {
                        this.a.onResult(new IdentityResult(jSONObject.toString()), true);
                    }
                } catch (UnsupportedEncodingException e) {
                    C0020ai.a(e);
                } catch (JSONException e2) {
                    C0020ai.a(e2);
                }
            }
        }
    }
}
