package com.iflytek.thridparty;

import android.os.Bundle;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.thridparty.X;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.t, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class C0056t implements X.a {
    final /* synthetic */ C0055s a;

    C0056t(C0055s c0055s) {
        this.a = c0055s;
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(SpeechError speechError) {
        if (speechError != null) {
            C0020ai.b("query resource error. errorcode:" + speechError.getErrorCode());
        } else {
            C0020ai.c("query resource succeed");
        }
        if (this.a.y != null) {
            this.a.y.onCompleted(speechError);
        }
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(X x, byte[] bArr) throws JSONException {
        try {
            String str = new String(bArr, "utf-8");
            C0020ai.c("updateInfo:" + str);
            JSONObject jSONObject = new JSONObject(str);
            try {
                O.a(this.a.w).a("ivw_netval", Integer.valueOf((String) jSONObject.remove(this.a.r)).intValue());
            } catch (Exception e) {
                C0020ai.a(e);
            }
            int i = jSONObject.getInt(SpeechUtility.TAG_RESOURCE_RET);
            if (i == 0) {
                if (this.a.y != null) {
                    this.a.y.onBufferReceived(bArr);
                }
                a(null);
            } else {
                String string = jSONObject.getString(SpeechConstant.IST_SESSION_ID);
                if (this.a.y != null) {
                    Bundle bundle = new Bundle();
                    bundle.putString(SpeechEvent.KEY_EVENT_SESSION_ID, string);
                    this.a.y.onEvent(20001, bundle);
                }
                a(new SpeechError(i));
            }
        } catch (Exception e2) {
            C0020ai.a(e2);
            a(new SpeechError(ErrorCode.ERROR_INVALID_RESULT));
        }
    }
}
