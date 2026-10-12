package com.iflytek.thridparty;

import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.thridparty.X;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.au, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class C0032au implements X.a {
    final /* synthetic */ C0031at a;

    C0032au(C0031at c0031at) {
        this.a = c0031at;
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(SpeechError speechError) {
        if (speechError != null) {
            C0020ai.b("upload error. please check net state:" + speechError.getErrorCode());
        } else {
            C0020ai.a("upload succeed");
        }
        if (this.a.g != null) {
            this.a.g.onCompleted(speechError);
        }
    }

    @Override // com.iflytek.thridparty.X.a
    public void a(X x, byte[] bArr) throws NumberFormatException {
        if (bArr != null) {
            try {
                String str = new String(bArr, "utf-8");
                C0020ai.a(str);
                int i = Integer.parseInt(new JSONObject(str).getString(SpeechUtility.TAG_RESOURCE_RET));
                if (i != 0) {
                    a(new SpeechError(i, SpeechConstant.ENG_WFR));
                    return;
                }
                if (this.a.g != null) {
                    C0021aj.a("GetNotifyResult", null);
                    this.a.g.onBufferReceived(bArr);
                }
                a(null);
            } catch (Exception e) {
                a(new SpeechError(ErrorCode.ERROR_INVALID_RESULT));
            }
        }
    }
}
