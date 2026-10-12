package com.iflytek.thridparty;

import android.content.SharedPreferences;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.X;
import org.apache.http.util.EncodingUtils;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.an, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class C0025an implements X.a {
    final /* synthetic */ C0022ak a;

    C0025an(C0022ak c0022ak) {
        this.a = c0022ak;
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(SpeechError speechError) {
        this.a.d = false;
        C0020ai.c("CollectInfo", "" + speechError.getErrorCode());
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(X x, byte[] bArr) {
        C0022ak c0022ak;
        try {
            if (bArr != null) {
                try {
                    JSONObject jSONObject = new JSONObject(EncodingUtils.getString(R.b(bArr), "utf-8"));
                    C0020ai.c("CollectInfo", "策略请求结果： " + jSONObject.toString());
                    if ("yes".equalsIgnoreCase(jSONObject.optString("is_collect"))) {
                        this.a.h = true;
                    } else {
                        this.a.h = false;
                    }
                    this.a.i = (long) (Double.parseDouble(jSONObject.optString("ti_request")) * 3600.0d);
                    this.a.j = (long) (Double.parseDouble(jSONObject.optString("ti_app_list")) * 3600.0d);
                    this.a.k = (long) (Double.parseDouble(jSONObject.optString("ti_app_active")) * 3600.0d);
                    SharedPreferences.Editor editorEdit = C0022ak.c.edit();
                    editorEdit.putBoolean("is_collect", this.a.h);
                    editorEdit.putLong("ti_request", this.a.i);
                    editorEdit.putLong("ti_app_list", this.a.j);
                    editorEdit.putLong("ti_app_active", this.a.k);
                    editorEdit.commit();
                    c0022ak = this.a;
                } catch (Throwable th) {
                    C0020ai.b(th);
                    c0022ak = this.a;
                }
            } else {
                c0022ak = this.a;
            }
            c0022ak.d = false;
        } catch (Throwable th2) {
            this.a.d = false;
            throw th2;
        }
    }
}
