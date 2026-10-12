package com.iflytek.thridparty;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.UnsupportedEncodingException;

/* renamed from: com.iflytek.thridparty.u, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0057u extends AbstractC0060x {
    private MSCSessionInfo c = new MSCSessionInfo();
    private MSCSessionInfo d = new MSCSessionInfo();
    private byte[] e = null;

    private synchronized void a(String str, byte[] bArr, int i) throws SpeechError {
        int iQMFVDataWrite = MSC.QMFVDataWrite(this.a, str.getBytes(), bArr, i, this.d);
        this.c.sesstatus = this.d.sesstatus;
        C0020ai.a("QISRAudioWrite length:" + i);
        if (iQMFVDataWrite != 0) {
            throw new SpeechError(this.d.errorcode);
        }
    }

    public synchronized int a() {
        int iQMFVGetParam;
        int i = 0;
        synchronized (this) {
            try {
                iQMFVGetParam = MSC.QMFVGetParam(this.a, SpeechConstant.VOLUME.getBytes(), this.d);
                try {
                    if (iQMFVGetParam == 0) {
                        i = Integer.parseInt(new String(new String(this.d.buffer)));
                    } else {
                        C0020ai.a("VAD CHECK FALSE");
                    }
                } catch (Exception e) {
                    C0020ai.a("getAudioVolume Exception vadret = " + iQMFVGetParam);
                    return i;
                }
            } catch (Exception e2) {
                iQMFVGetParam = 0;
            }
        }
        return i;
    }

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        String strC = C0029ar.c(context, str, abstractHandlerC0059w);
        C0020ai.c("sessionBegin Params:" + strC);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        C0021aj.a("MSCSessionBegin", null);
        synchronized (C0057u.class) {
            this.a = MSC.QMFVSessionBegin(strC.getBytes(abstractHandlerC0059w.o()), this.c);
        }
        C0021aj.a("SessionBeginEnd", null);
        C0020ai.a("sessionBegin ErrCode:" + this.c.errorcode + " time:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
        int i = this.c.errorcode;
        if (i == 0 || i == 10129 || i == 10113 || i == 10132) {
            return i;
        }
        throw new SpeechError(i);
    }

    public void a(String str) {
        if (this.a == null) {
            return;
        }
        C0020ai.a("sessionEnd enter ");
        C0020ai.a("sessionEnd leavel:" + (MSC.QMFVSessionEnd(this.a, str.getBytes()) == 0) + " time:" + (System.currentTimeMillis() - System.currentTimeMillis()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(StringBuffer stringBuffer, byte[] bArr, int i, boolean z) throws SpeechError {
        StringBuffer stringBuffer2 = new StringBuffer(stringBuffer.toString());
        stringBuffer2.append(",data_status=");
        if (z) {
            stringBuffer2.append(1);
        } else {
            stringBuffer2.append(2);
        }
        C0020ai.c("pushAudioData, param:" + stringBuffer2.toString());
        a(stringBuffer2.toString(), bArr, i);
    }

    public synchronized boolean a(String str, String str2) {
        int iQMFVSetParam;
        boolean z = false;
        synchronized (this) {
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && this.a != null) {
                try {
                    iQMFVSetParam = MSC.QMFVSetParam(this.a, str.getBytes("utf-8"), str2.getBytes("utf-8"));
                } catch (UnsupportedEncodingException e) {
                    C0020ai.a(e);
                    iQMFVSetParam = -1;
                }
                if (iQMFVSetParam == 0) {
                    z = true;
                }
            }
        }
        return z;
    }

    protected String b() {
        if (this.b == null) {
            this.b = d(SpeechConstant.IST_SESSION_ID);
        }
        return this.b;
    }

    public synchronized void b(String str) throws SpeechError {
        C0021aj.a("LastDataFlag", null);
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("ssub=" + str);
        stringBuffer.append(",data_status=4");
        C0020ai.a("pushEndFlag, param:" + stringBuffer.toString());
        a(stringBuffer.toString(), new byte[0], 0);
    }

    public synchronized int c(String str) {
        int i = 0;
        synchronized (this) {
            if (this.a != null) {
                try {
                    String strD = d(str);
                    if (!TextUtils.isEmpty(strD)) {
                        i = Integer.parseInt(new String(strD));
                    }
                } catch (Exception e) {
                    C0020ai.a(e);
                }
            }
        }
        return i;
    }

    public synchronized String d(String str) {
        String str2 = null;
        synchronized (this) {
            if (this.a != null) {
                try {
                    if (MSC.QMFVGetParam(this.a, str.getBytes(), this.c) == 0) {
                        str2 = new String(this.c.buffer);
                    }
                } catch (Exception e) {
                }
            }
        }
        return str2;
    }
}
