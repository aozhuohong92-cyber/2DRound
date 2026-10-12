package com.iflytek.thridparty;

import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.msc.MSC;
import com.iflytek.speech.ISpeechModule;

/* renamed from: com.iflytek.thridparty.z, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractC0062z {
    protected C0027ap b = new C0027ap();

    /* renamed from: com.iflytek.thridparty.z$a */
    public enum a {
        MSC,
        PLUS,
        AUTO
    }

    protected a a(String str, ISpeechModule iSpeechModule) {
        String parameter = getParameter(SpeechConstant.ENGINE_MODE);
        if (SpeechConstant.MODE_MSC.equals(parameter)) {
            return a.MSC;
        }
        if (SpeechConstant.MODE_PLUS.equals(parameter)) {
            return a.PLUS;
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility == null) {
            return a.MSC;
        }
        if (utility.getEngineMode() != a.AUTO) {
            return utility.getEngineMode();
        }
        if (!MSC.isLoaded()) {
            return a.PLUS;
        }
        String parameter2 = getParameter(SpeechConstant.ENGINE_TYPE);
        return SpeechConstant.TYPE_LOCAL.equals(parameter2) ? a.PLUS : SpeechConstant.TYPE_MIX.equals(parameter2) ? (iSpeechModule == null || !iSpeechModule.isAvailable()) ? a.MSC : a.PLUS : a.MSC;
    }

    public String getParameter(String str) {
        return SpeechConstant.PARAMS.equals(str) ? this.b.toString() : this.b.e(str);
    }

    public boolean setParameter(C0027ap c0027ap) {
        this.b = c0027ap.clone();
        return true;
    }

    public boolean setParameter(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        if (!str.equals(SpeechConstant.PARAMS)) {
            if (TextUtils.isEmpty(str2)) {
                return this.b.c(str).booleanValue();
            }
            this.b.a(str, str2);
            return true;
        }
        if (TextUtils.isEmpty(str2)) {
            this.b.a();
            return true;
        }
        this.b.b(str2);
        return true;
    }
}
