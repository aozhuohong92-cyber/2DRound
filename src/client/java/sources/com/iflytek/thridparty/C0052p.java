package com.iflytek.thridparty;

import android.content.Context;
import android.os.SystemClock;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import com.iflytek.thridparty.AbstractC0060x;
import java.io.UnsupportedEncodingException;
import java.util.Date;

/* renamed from: com.iflytek.thridparty.p, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0052p extends AbstractC0060x {
    private MSCSessionInfo c = new MSCSessionInfo();
    private MSCSessionInfo d = new MSCSessionInfo();
    private MSCSessionInfo e = new MSCSessionInfo();
    private byte[] f = null;

    private synchronized void a(byte[] bArr, int i, int i2) throws SpeechError {
        int iQISVAudioWrite = MSC.QISVAudioWrite(this.a, null, bArr, i, i2, this.c);
        if (iQISVAudioWrite != 0) {
            throw new SpeechError(iQISVAudioWrite);
        }
    }

    public int a(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, NumberFormatException, UnsupportedEncodingException {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        String strE = abstractHandlerC0059w.u().e(SpeechConstant.ISV_VID);
        String strB = C0029ar.b(context, abstractHandlerC0059w);
        C0020ai.a("sendRequest enter ");
        C0021aj.a("LastDataFlag", null);
        char[] cArrQISVQueDelModel = MSC.QISVQueDelModel(strE == null ? null : strE.getBytes(abstractHandlerC0059w.o()), strB.getBytes(abstractHandlerC0059w.o()), this.e);
        C0021aj.a("GetNotifyResult", null);
        MSC.QISVQueDelModelRelease(cArrQISVQueDelModel);
        int i = this.e.errorcode != 0 ? this.e.errorcode : "true".equals(new String(this.e.buffer)) ? 0 : -1;
        if (i != 0 && -1 != i) {
            throw new SpeechError(i);
        }
        C0020ai.a("sendRequest leavel:" + i + " time:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
        return i;
    }

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, NumberFormatException, UnsupportedEncodingException {
        String strB = C0029ar.b(context, abstractHandlerC0059w);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        C0021aj.a("MSCSessionBegin", null);
        this.a = MSC.QISVSessionBegin(strB.getBytes(abstractHandlerC0059w.o()), str == null ? null : str.getBytes(abstractHandlerC0059w.o()), this.c);
        C0021aj.a("SessionBeginEnd", null);
        C0020ai.a("sessionBegin ErrCode:" + this.c.errorcode + " time:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
        int i = this.c.errorcode;
        if (i == 0 || i == 10129 || i == 10113 || i == 10132) {
            return 0;
        }
        throw new SpeechError(i);
    }

    public synchronized void a() throws SpeechError {
        C0021aj.a("LastDataFlag", null);
        a(new byte[0], 0, 4);
    }

    public void a(String str) {
        if (this.a == null) {
            return;
        }
        C0020ai.a("sessionEnd enter ");
        C0020ai.a("sessionEnd leavel:" + (MSC.QISVSessionEnd(this.a, str.getBytes()) == 0) + " time:" + (System.currentTimeMillis() - System.currentTimeMillis()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(byte[] bArr, int i) throws SpeechError {
        a(bArr, i, 2);
    }

    public synchronized String b(String str) {
        String str2 = null;
        synchronized (this) {
            if (this.a != null) {
                try {
                    if (MSC.QISVGetParam(this.a, str.getBytes(), this.c) == 0) {
                        str2 = new String(this.c.buffer);
                    }
                } catch (Exception e) {
                }
            }
        }
        return str2;
    }

    public synchronized boolean b() {
        return this.c.epstatues >= 3;
    }

    public synchronized int c() {
        int iQISVGetParam;
        int i = 0;
        synchronized (this) {
            try {
                iQISVGetParam = MSC.QISVGetParam(this.a, SpeechConstant.VOLUME.getBytes(), this.d);
                try {
                    if (iQISVGetParam == 0) {
                        i = Integer.parseInt(new String(new String(this.d.buffer)));
                    } else {
                        C0020ai.a("VAD CHECK FALSE");
                    }
                } catch (Exception e) {
                    C0020ai.a("getAudioVolume Exception vadret = " + iQISVGetParam);
                    return i;
                }
            } catch (Exception e2) {
                iQISVGetParam = 0;
            }
        }
        return i;
    }

    public byte[] d() {
        return this.f;
    }

    public AbstractC0060x.a e() throws SpeechError {
        Date date = new Date();
        this.f = MSC.QISVGetResult(this.a, null, this.c);
        C0020ai.a("QISVGetResult leavel:" + (this.f != null) + " time:" + (new Date().getTime() - date.getTime()));
        int i = this.c.errorcode;
        if (i != 0) {
            C0020ai.a("Result: error errorcode is " + i);
            throw new SpeechError(i);
        }
        int i2 = this.c.rsltstatus;
        switch (i2) {
            case 0:
            case 5:
                if (this.f != null) {
                    C0020ai.a("ResultStatus: hasResult" + i2);
                    return AbstractC0060x.a.hasResult;
                }
                break;
            case 1:
                C0020ai.a("ResultStatus: noResult" + i2);
                throw new SpeechError(ErrorCode.ERROR_NO_MATCH);
        }
        return AbstractC0060x.a.noResult;
    }

    protected String f() {
        if (this.b == null) {
            this.b = b(SpeechConstant.IST_SESSION_ID);
        }
        return this.b;
    }
}
