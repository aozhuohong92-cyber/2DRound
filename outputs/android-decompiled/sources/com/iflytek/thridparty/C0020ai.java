package com.iflytek.thridparty;

import android.util.Log;
import com.iflytek.cloud.Setting;
import com.iflytek.msc.MSC;

/* renamed from: com.iflytek.thridparty.ai, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0020ai {
    private static String a = "MscSpeechLog";
    private static boolean b = false;

    public static void a() {
        try {
            if (MSC.isLoaded()) {
                MSC.DebugLog(Setting.getShowLog() && c());
            }
        } catch (Throwable th) {
            a(th);
        }
    }

    public static void a(String str) {
        a(a, str);
    }

    public static void a(String str, String str2) {
        if (c()) {
            Log.d(str, str2);
        }
    }

    public static void a(Throwable th) {
        if (!b() || th == null) {
            return;
        }
        th.printStackTrace();
    }

    public static void b(String str) {
        b(a, str);
    }

    public static void b(String str, String str2) {
        if (b()) {
            Log.e(str, str2);
        }
    }

    public static void b(Throwable th) {
        if (d()) {
            th.printStackTrace();
        }
    }

    private static boolean b() {
        return Setting.getShowLog() && Setting.LOG_LEVEL.none != Setting.getLogLevel();
    }

    public static void c(String str) {
        c(a, str);
    }

    public static void c(String str, String str2) {
        if (d()) {
            Log.d(str, str2);
        }
    }

    private static boolean c() {
        return Setting.getShowLog() && (Setting.LOG_LEVEL.all == Setting.getLogLevel() || Setting.LOG_LEVEL.detail == Setting.getLogLevel());
    }

    private static boolean d() {
        return b && Setting.getShowLog();
    }
}
