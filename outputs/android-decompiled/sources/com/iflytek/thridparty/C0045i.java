package com.iflytek.thridparty;

import android.content.Context;
import android.support.v4.os.EnvironmentCompat;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import com.iflytek.thridparty.AbstractC0060x;
import java.io.UnsupportedEncodingException;
import java.util.Date;

/* renamed from: com.iflytek.thridparty.i, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0045i extends AbstractC0060x {
    private MSCSessionInfo c = new MSCSessionInfo();
    private MSCSessionInfo d = new MSCSessionInfo();
    private byte[] e = null;

    private synchronized void a(byte[] bArr, int i, int i2) throws SpeechError {
        C0020ai.a("QISEAudioWrite enter");
        int iQISEAudioWrite = MSC.QISEAudioWrite(this.a, bArr, i, i2, this.d);
        C0020ai.a("QISEAudioWrite leavel:" + iQISEAudioWrite);
        this.c.sesstatus = this.d.sesstatus;
        C0020ai.a("QISEAudioWrite length:" + i);
        if (iQISEAudioWrite != 0) {
            throw new SpeechError(this.d.errorcode);
        }
    }

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        this.a = null;
        String strE = C0029ar.e(context, abstractHandlerC0059w);
        C0021aj.a("MSCSessionBegin", null);
        if (TextUtils.isEmpty(str)) {
            this.a = MSC.QISESessionBegin(strE.getBytes(abstractHandlerC0059w.o()), null, this.c);
        } else {
            this.a = MSC.QISESessionBegin(strE.getBytes(abstractHandlerC0059w.o()), str.getBytes(abstractHandlerC0059w.o()), this.c);
            C0020ai.a("sessionBegin userModelId:" + str);
        }
        C0021aj.a("SessionBeginEnd", null);
        int i = this.c.errorcode;
        if (i == 0 || i == 10129 || i == 10113 || i == 10132) {
            return i;
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
        if (TextUtils.isEmpty(str)) {
            str = EnvironmentCompat.MEDIA_UNKNOWN;
        }
        C0020ai.a("ISESessionEnd enter ");
        C0020ai.a("ISESessionEnd leavel:" + MSC.QISESessionEnd(this.a, str.getBytes()) + " time:" + (System.currentTimeMillis() - System.currentTimeMillis()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(byte[] bArr, int i) throws SpeechError {
        a(bArr, i, 2);
    }

    public synchronized void a(byte[] bArr, byte[] bArr2) throws SpeechError {
        C0020ai.a("QISETextPut enter");
        int iQISETextPut = MSC.QISETextPut(this.a, bArr, bArr2);
        C0020ai.a("QISETextPut leavel:" + iQISETextPut);
        if (iQISETextPut != 0) {
            throw new SpeechError(iQISETextPut);
        }
    }

    public synchronized int b() {
        return this.d.epstatues;
    }

    public synchronized String b(String str) {
        String str2 = null;
        synchronized (this) {
            if (this.a != null) {
                try {
                    if (MSC.QISEGetParam(this.a, str.getBytes(), this.c) == 0) {
                        str2 = new String(this.c.buffer);
                    }
                } catch (Exception e) {
                }
            }
        }
        return str2;
    }

    public synchronized int c() {
        int iQISEGetParam;
        int i = 0;
        synchronized (this) {
            if (this.a != null) {
                try {
                    iQISEGetParam = MSC.QISEGetParam(this.a, SpeechConstant.VOLUME.getBytes(), this.d);
                } catch (Exception e) {
                    iQISEGetParam = 0;
                }
                try {
                    if (iQISEGetParam == 0) {
                        i = Integer.parseInt(new String(new String(this.d.buffer)));
                    } else {
                        C0020ai.a("VAD CHECK FALSE");
                    }
                } catch (Exception e2) {
                    C0020ai.a("getAudioVolume Exception vadret = " + iQISEGetParam);
                    return i;
                }
            }
        }
        return i;
    }

    public byte[] d() {
        return this.e;
    }

    public AbstractC0060x.a e() throws SpeechError {
        Date date = new Date();
        this.e = MSC.QISEGetResult(this.a, this.c);
        C0020ai.a("QISRGetResult leavel:" + (this.e != null) + " time:" + (new Date().getTime() - date.getTime()));
        int i = this.c.errorcode;
        if (i != 0) {
            C0020ai.a("Result: error errorcode is " + i);
            throw new SpeechError(i);
        }
        int i2 = this.c.rsltstatus;
        switch (i2) {
            case 0:
                C0020ai.a("ResultStatus: hasResult" + i2);
                return AbstractC0060x.a.hasResult;
            case 1:
            case 3:
            case 4:
            default:
                return AbstractC0060x.a.noResult;
            case 2:
                C0020ai.a("ResultStatus: noResult" + i2);
                return AbstractC0060x.a.noResult;
            case 5:
                C0020ai.a("ResultStatus: resultOver" + i2);
                return AbstractC0060x.a.resultOver;
        }
    }

    protected String f() {
        if (this.b == null) {
            this.b = b(SpeechConstant.IST_SESSION_ID);
        }
        return this.b;
    }
}
