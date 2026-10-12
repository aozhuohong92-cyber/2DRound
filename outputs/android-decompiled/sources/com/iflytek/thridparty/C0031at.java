package com.iflytek.thridparty;

import android.content.Context;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.RequestListener;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.thridparty.X;

/* renamed from: com.iflytek.thridparty.at, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0031at extends AbstractC0062z {
    private Context e;
    private X f;
    private RequestListener g;
    private String c = "http://openapi.openspeech.cn/webapi/wfr.do";
    private String d = "pver=1.0";
    X.a a = new C0032au(this);

    public C0031at(Context context, C0027ap c0027ap) {
        this.e = null;
        this.f = null;
        this.b = c0027ap;
        this.e = context;
        this.f = new X();
    }

    public int a(byte[] bArr, RequestListener requestListener) {
        try {
            this.g = requestListener;
            if (SpeechUtility.getUtility() == null) {
                return ErrorCode.MSP_ERROR_NOT_INIT;
            }
            String strC = C0029ar.c(this.e, this.b);
            this.f.b(this.b.a(SpeechConstant.NET_TIMEOUT, 20000));
            this.f.a(1);
            this.f.a(this.c, this.d, bArr, strC);
            this.f.a(this.a);
            C0021aj.a("LastDataFlag", null);
            return 0;
        } catch (Exception e) {
            return ErrorCode.ERROR_UNKNOWN;
        }
    }

    public void a() {
        this.f.a();
        this.f = null;
    }
}
