package com.iflytek.thridparty;

import android.content.Context;
import android.graphics.Bitmap;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.cloud.util.VerifierUtil;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.as, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0030as {
    private boolean a;
    private MSCSessionInfo b;

    public C0030as(Context context, String str) throws SpeechError {
        try {
            if (SpeechUtility.getUtility() == null) {
                throw new SpeechError(ErrorCode.MSP_ERROR_NOT_INIT);
            }
            this.a = false;
            a(str);
        } catch (SpeechError e) {
            C0020ai.b(e.getPlainDescription(true));
        }
    }

    private String a(byte[] bArr, MSCSessionInfo mSCSessionInfo) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            if (mSCSessionInfo.errorcode == 0) {
                jSONObject = new JSONObject(new String(bArr));
            }
            jSONObject.put(SpeechUtility.TAG_RESOURCE_RET, mSCSessionInfo.errorcode);
        } catch (JSONException e) {
            C0020ai.b("face result add errorinfo exception");
        }
        return jSONObject.toString();
    }

    private void a(String str) {
        if (MSC.isLoaded()) {
            C0020ai.a("MSC isLoaded：" + MSC.isLoaded());
            this.b = new MSCSessionInfo();
            C0021aj.a("MSCSessionBegin", null);
            if (TextUtils.isEmpty(str)) {
                MSC.QIFDInit(null, this.b);
            } else {
                MSC.QIFDInit(str.getBytes(), this.b);
            }
            C0021aj.a("SessionBeginEnd", null);
            if (this.b.errorcode != 0) {
                C0020ai.b("QIFDINIT INIT FAIL, ERRORCODE:" + this.b.errorcode);
            } else {
                C0020ai.a("QIFDINIT INIT SUCCESS");
            }
        }
    }

    public String a(Bitmap bitmap) {
        if (bitmap != null && Bitmap.Config.ARGB_8888.equals(bitmap.getConfig())) {
            return b(VerifierUtil.ARGB2Gray(bitmap));
        }
        C0020ai.b("Method detectARGB:null parameter or not ARGB bitmap");
        return null;
    }

    public String a(byte[] bArr, int i, int i2, int i3, int i4) {
        if (bArr == null || i <= 0 || i2 <= 0 || i4 < 0 || i4 > 3) {
            C0020ai.b("Method trackNV21:invalid parameters");
            return null;
        }
        this.b = new MSCSessionInfo();
        C0021aj.a("LastDataFlag", null);
        byte[] bArrQIFDMultitracker = MSC.QIFDMultitracker(bArr, bArr.length, i, i2, i3, i4, this.b);
        C0021aj.a("GetNotifyResult", null);
        return a(bArrQIFDMultitracker, this.b);
    }

    public void a() {
        if (this.a) {
            return;
        }
        C0020ai.a("QIFDFINIT");
        C0021aj.a("SessionEndBegin", null);
        C0020ai.a("MSC.QIFDFini result is " + MSC.QIFDFini());
        C0021aj.a("SessionEndEnd", null);
        this.a = true;
    }

    public String b(Bitmap bitmap) {
        if (bitmap == null || !Bitmap.Config.ALPHA_8.equals(bitmap.getConfig())) {
            C0020ai.b("Method detectGray:null parameter or not gray bitmap");
            return null;
        }
        this.b = new MSCSessionInfo();
        C0021aj.a("LastDataFlag", null);
        byte[] bArrQIFDFacedetect = MSC.QIFDFacedetect(bitmap, VerifierUtil.getBitmapsize(bitmap), this.b);
        C0021aj.a("GetNotifyResult", null);
        return a(bArrQIFDFacedetect, this.b);
    }
}
