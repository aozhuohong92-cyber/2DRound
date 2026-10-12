package com.iflytek.thridparty;

import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.X;
import org.apache.http.util.EncodingUtils;

/* renamed from: com.iflytek.thridparty.ao, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class C0026ao implements X.a {
    final /* synthetic */ C0022ak a;

    C0026ao(C0022ak c0022ak) {
        this.a = c0022ak;
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(SpeechError speechError) {
        this.a.e = false;
        C0020ai.c("CollectInfo", "" + speechError.getErrorCode());
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(X x, byte[] bArr) {
        C0022ak c0022ak;
        if (bArr != null) {
            try {
                try {
                    C0020ai.c("CollectInfo", "上传数据结果返回： " + EncodingUtils.getString(R.b(bArr), "utf-8"));
                    c0022ak = this.a;
                } catch (Throwable th) {
                    C0020ai.b(th);
                    c0022ak = this.a;
                }
            } catch (Throwable th2) {
                this.a.e = false;
                throw th2;
            }
        } else {
            c0022ak = this.a;
        }
        c0022ak.e = false;
    }
}
