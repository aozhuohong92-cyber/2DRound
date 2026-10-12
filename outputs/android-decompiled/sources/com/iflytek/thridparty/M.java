package com.iflytek.thridparty;

import android.content.Context;
import android.support.v4.os.EnvironmentCompat;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.UnsupportedEncodingException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class M extends AbstractC0060x {
    private MSCSessionInfo c = new MSCSessionInfo();

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        this.a = null;
        String strD = C0029ar.d(context, abstractHandlerC0059w);
        long jCurrentTimeMillis = System.currentTimeMillis();
        byte[] bytes = strD.getBytes(abstractHandlerC0059w.o());
        C0021aj.a("MSCSessionBegin", null);
        synchronized (M.class) {
            this.a = MSC.QTTSSessionBegin(bytes, this.c);
        }
        C0021aj.a("SessionBeginEnd", null);
        C0020ai.a("QTTSSessionBegin leave:" + (System.currentTimeMillis() - jCurrentTimeMillis) + " ErrorCode:" + this.c.errorcode);
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
        if (TextUtils.isEmpty(str)) {
            str = EnvironmentCompat.MEDIA_UNKNOWN;
        }
        C0020ai.a("QTTSSessionEnd enter");
        C0020ai.a("QTTSSessionEnd leavel:" + MSC.QTTSSessionEnd(this.a, str.getBytes()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(byte[] bArr) throws SpeechError {
        C0020ai.a("QTTSTextPut enter");
        C0021aj.a("LastDataFlag", null);
        int iQTTSTextPut = MSC.QTTSTextPut(this.a, bArr);
        C0020ai.a("QTTSTextPut leavel:" + iQTTSTextPut);
        if (iQTTSTextPut != 0) {
            throw new SpeechError(iQTTSTextPut);
        }
    }

    public synchronized byte[] a() throws SpeechError {
        byte[] bArrQTTSAudioGet;
        if (this.a == null) {
            throw new SpeechError(ErrorCode.ERROR_NET_EXCEPTION);
        }
        C0020ai.a("QTTSAudioGet enter");
        bArrQTTSAudioGet = MSC.QTTSAudioGet(this.a, this.c);
        C0020ai.a("QTTSAudioGet leavel:" + this.c.errorcode + "value len = " + (bArrQTTSAudioGet == null ? 0 : bArrQTTSAudioGet.length));
        int i = this.c.errorcode;
        if (i != 0) {
            throw new SpeechError(i);
        }
        return bArrQTTSAudioGet;
    }

    public int b() {
        try {
            return Integer.parseInt(c("ced"));
        } catch (Exception e) {
            return 0;
        }
    }

    public synchronized int b(String str) {
        int i = 0;
        synchronized (this) {
            if (this.a != null) {
                try {
                    String strC = c(str);
                    if (!TextUtils.isEmpty(strC)) {
                        i = Integer.parseInt(new String(strC));
                    }
                } catch (Exception e) {
                }
            }
        }
        return i;
    }

    public String c() {
        String str = "";
        try {
            String str2 = new String(MSC.QTTSAudioInfo(this.a));
            try {
                return new String(str2.getBytes("iso8859-1"), "gb2312");
            } catch (Exception e) {
                e = e;
                str = str2;
                C0020ai.a(e);
                return str;
            }
        } catch (Exception e2) {
            e = e2;
        }
    }

    public synchronized String c(String str) {
        String str2 = null;
        synchronized (this) {
            if (this.a != null) {
                try {
                    if (MSC.QTTSGetParam(this.a, str.getBytes(), this.c) == 0) {
                        str2 = new String(this.c.buffer);
                    }
                } catch (Exception e) {
                }
            }
        }
        return str2;
    }

    public synchronized boolean d() {
        return 2 == this.c.sesstatus;
    }

    protected String e() {
        if (this.b == null) {
            this.b = c(SpeechConstant.IST_SESSION_ID);
        }
        return this.b;
    }
}
