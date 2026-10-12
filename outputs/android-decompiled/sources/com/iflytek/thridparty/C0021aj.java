package com.iflytek.thridparty;

import android.text.TextUtils;
import com.iflytek.speech.VoiceWakeuperAidl;
import java.util.LinkedHashMap;

/* renamed from: com.iflytek.thridparty.aj, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0021aj {
    public static LinkedHashMap<String, String> a = new LinkedHashMap<>();
    private static String b = "=";
    private static String c = ":";
    private static String d = VoiceWakeuperAidl.PARAMS_SEPARATE;
    private static String e = "=========================================================\r\n";
    private static boolean f = false;

    public static synchronized void a(String str, String str2) {
        if (f) {
            C0020ai.c("appendInfo:" + str + "," + str2);
            a.put(str, (!TextUtils.isEmpty(str2) ? str2 + c : "") + System.currentTimeMillis());
        }
    }
}
