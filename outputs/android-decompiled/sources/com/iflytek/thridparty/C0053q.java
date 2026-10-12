package com.iflytek.thridparty;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.UnsupportedEncodingException;

/* renamed from: com.iflytek.thridparty.q, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0053q extends AbstractC0060x {
    private MSCSessionInfo c = new MSCSessionInfo();
    private MSCSessionInfo d = new MSCSessionInfo();

    private synchronized void a(byte[] bArr, int i, int i2) throws SpeechError {
        int iQIVWAudioWrite = MSC.QIVWAudioWrite(this.a, bArr, i, i2, this.d);
        this.c.sesstatus = this.d.sesstatus;
        C0020ai.a("QIVWAudioWrite length:" + i);
        if (iQIVWAudioWrite != 0) {
            throw new SpeechError(this.d.errorcode);
        }
    }

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        String strB = C0029ar.b(context, str, abstractHandlerC0059w);
        String strE = abstractHandlerC0059w.u().e(SpeechConstant.CLOUD_GRAMMAR);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        C0021aj.a("MSCSessionBegin", null);
        if (TextUtils.isEmpty(strE)) {
            this.a = MSC.QIVWSessionBegin(null, strB.getBytes(abstractHandlerC0059w.o()), this.c);
        } else {
            this.a = MSC.QIVWSessionBegin(strE.getBytes(abstractHandlerC0059w.o()), strB.getBytes(abstractHandlerC0059w.o()), this.c);
        }
        C0021aj.a("SessionBeginEnd", null);
        C0020ai.a("sessionBegin ErrCode:" + this.c.errorcode + " time:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
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
        C0020ai.a("sessionEnd enter ");
        C0020ai.a("sessionEnd leavel:" + (MSC.QIVWSessionEnd(this.a, str.getBytes()) == 0) + " time:" + (System.currentTimeMillis() - System.currentTimeMillis()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(byte[] bArr, int i) throws SpeechError {
        a(bArr, i, 2);
    }
}
