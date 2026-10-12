package com.iflytek.thridparty;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.GrammarListener;
import com.iflytek.cloud.LexiconListener;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.UnsupportedEncodingException;

/* renamed from: com.iflytek.thridparty.k, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0047k extends AbstractC0060x {
    private static GrammarListener f;
    private static LexiconListener g;
    private MSCSessionInfo c = new MSCSessionInfo();
    private MSCSessionInfo d = new MSCSessionInfo();
    private byte[] e = null;
    private String h = "";

    private synchronized void a(byte[] bArr, int i, int i2) throws SpeechError {
        int iQISRAudioWrite = MSC.QISRAudioWrite(this.a, bArr, i, i2, this.d);
        this.c.sesstatus = this.d.sesstatus;
        C0020ai.a("QISRAudioWrite length:" + i);
        if (iQISRAudioWrite != 0) {
            throw new SpeechError(this.d.errorcode);
        }
    }

    public int a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, NumberFormatException, UnsupportedEncodingException {
        String strA = C0029ar.a(context, str, abstractHandlerC0059w);
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        synchronized (C0047k.class) {
            C0021aj.a("MSCSessionBegin", null);
            if (TextUtils.isEmpty(str)) {
                C0020ai.a(strA);
                this.a = MSC.QISRSessionBegin(null, strA.getBytes(abstractHandlerC0059w.o()), this.c);
            } else {
                this.a = MSC.QISRSessionBegin(str.getBytes(abstractHandlerC0059w.o()), strA.getBytes(abstractHandlerC0059w.o()), this.c);
                C0020ai.a("sessionBegin grammarId:" + str);
            }
            C0021aj.a("SessionBeginEnd", null);
        }
        C0020ai.a("sessionBegin ErrCode:" + this.c.errorcode + " time:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
        int i = this.c.errorcode;
        if (i == 0 || i == 10129 || i == 10113 || i == 10132) {
            return i;
        }
        throw new SpeechError(i);
    }

    public int a(String str, String str2, GrammarListener grammarListener, C0027ap c0027ap) throws UnsupportedEncodingException {
        f = grammarListener;
        String string = c0027ap.toString();
        String strB = c0027ap.b(SpeechConstant.TEXT_ENCODING, "utf-8");
        String strB2 = c0027ap.b("pte", "utf-8");
        try {
            byte[] bytes = str2.getBytes(strB);
            C0021aj.a("LastDataFlag", null);
            return MSC.QISRBuildGrammar(str.getBytes(strB2), bytes, bytes.length, string.getBytes(strB2), "grammarCallBack", this);
        } catch (UnsupportedEncodingException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_INVALID_PARAM;
        }
    }

    public int a(String str, String str2, LexiconListener lexiconListener, C0027ap c0027ap) throws UnsupportedEncodingException {
        g = lexiconListener;
        this.h = str;
        c0027ap.a(SpeechConstant.TEXT_ENCODING, "utf-8", false);
        String strB = c0027ap.b(SpeechConstant.TEXT_ENCODING, "utf-8");
        String strB2 = c0027ap.b("pte", "utf-8");
        String string = c0027ap.toString();
        try {
            byte[] bytes = str2.getBytes(strB);
            C0021aj.a("LastDataFlag", null);
            return MSC.QISRUpdateLexicon(str.getBytes(strB2), bytes, bytes.length, string.getBytes(strB2), "lexiconCallBack", this);
        } catch (UnsupportedEncodingException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_INVALID_PARAM;
        }
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
        C0020ai.a("sessionEnd leavel:" + (MSC.QISRSessionEnd(this.a, str.getBytes()) == 0) + " time:" + (System.currentTimeMillis() - System.currentTimeMillis()));
        this.a = null;
        this.b = null;
    }

    public synchronized void a(byte[] bArr, int i) throws SpeechError {
        a(bArr, i, 2);
    }

    public synchronized boolean a(String str, String str2) {
        int iQISRSetParam;
        boolean z = false;
        synchronized (this) {
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && this.a != null) {
                try {
                    iQISRSetParam = MSC.QISRSetParam(this.a, str.getBytes("utf-8"), str2.getBytes("utf-8"));
                } catch (UnsupportedEncodingException e) {
                    C0020ai.a(e);
                    iQISRSetParam = -1;
                }
                if (iQISRSetParam == 0) {
                    z = true;
                }
            }
        }
        return z;
    }

    public synchronized int b() {
        int iQISRGetParam;
        int i = 0;
        synchronized (this) {
            try {
                iQISRGetParam = MSC.QISRGetParam(this.a, SpeechConstant.VOLUME.getBytes(), this.d);
                try {
                    if (iQISRGetParam == 0) {
                        i = Integer.parseInt(new String(new String(this.d.buffer)));
                    } else {
                        C0020ai.a("VAD CHECK FALSE");
                    }
                } catch (Exception e) {
                    C0020ai.a("getAudioVolume Exception vadret = " + iQISRGetParam);
                    return i;
                }
            } catch (Exception e2) {
                iQISRGetParam = 0;
            }
        }
        return i;
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
                    C0020ai.a(e);
                }
            }
        }
        return i;
    }

    protected String c() {
        if (this.b == null) {
            this.b = c(SpeechConstant.IST_SESSION_ID);
        }
        return this.b;
    }

    public synchronized String c(String str) {
        String str2 = null;
        synchronized (this) {
            if (this.a != null) {
                try {
                    if (MSC.QISRGetParam(this.a, str.getBytes(), this.c) == 0) {
                        str2 = new String(this.c.buffer);
                    }
                } catch (Exception e) {
                }
            }
        }
        return str2;
    }

    protected String d() {
        return c(SpeechEvent.KEY_EVENT_AUDIO_URL);
    }

    int grammarCallBack(int i, char[] cArr) {
        C0021aj.a("GetNotifyResult", null);
        if (f == null) {
            return 0;
        }
        if (i != 0) {
            f.onBuildFinish("", i != 0 ? new SpeechError(i) : null);
            return 0;
        }
        f.onBuildFinish(String.valueOf(cArr), null);
        return 0;
    }

    int lexiconCallBack(int i, char[] cArr) {
        C0021aj.a("GetNotifyResult", null);
        if (g == null) {
            return 0;
        }
        if (i != 0) {
            g.onLexiconUpdated(this.h, i != 0 ? new SpeechError(i) : null);
            return 0;
        }
        g.onLexiconUpdated(this.h, null);
        return 0;
    }
}
