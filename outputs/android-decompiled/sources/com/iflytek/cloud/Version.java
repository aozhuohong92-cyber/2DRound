package com.iflytek.cloud;

import android.text.TextUtils;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Version {
    private static String a = "";
    private static String b = "0";

    private static String getModeVersion() {
        return AbstractC0062z.a.MSC == SpeechUtility.DEF_ENGINE_MODE ? "6" : "5";
    }

    private static String getMscVersion() {
        if ("0".equalsIgnoreCase(b)) {
            try {
                if (MSC.isLoaded()) {
                    MSCSessionInfo mSCSessionInfo = new MSCSessionInfo();
                    byte[] bArrQMSPGetVersion = MSC.QMSPGetVersion("ver_msc".getBytes("gb2312"), mSCSessionInfo);
                    if (mSCSessionInfo.errorcode == 0) {
                        String str = new String(bArrQMSPGetVersion, "gb2312");
                        C0020ai.a("get msc full version name: " + str);
                        int iLastIndexOf = str.lastIndexOf(".");
                        if (iLastIndexOf >= 0 && str.length() > iLastIndexOf + 1) {
                            b = str.substring(iLastIndexOf + 1);
                        }
                    } else {
                        C0020ai.b("get msc version error: " + mSCSessionInfo.errorcode);
                    }
                } else {
                    C0020ai.b("get msc version msc is not load.");
                }
            } catch (Throwable th) {
                C0020ai.b("get msc version exception:");
                C0020ai.a(th);
            }
        }
        return b;
    }

    public static String getVersion() {
        if (TextUtils.isEmpty(a) || "0".equalsIgnoreCase(b)) {
            a = "4." + getModeVersion() + ".1098." + getMscVersion();
        }
        return a;
    }
}
