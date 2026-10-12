package com.iflytek.cloud;

import android.os.Environment;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Setting {
    public static final String a = Environment.getExternalStorageDirectory().getPath() + "/msc/msc.log";
    private static LOG_LEVEL b = LOG_LEVEL.all;
    private static String c = a;
    private static boolean d = true;
    private static boolean e = false;
    private static boolean f = true;

    public enum LOG_LEVEL {
        all,
        detail,
        normal,
        low,
        none
    }

    private Setting() {
    }

    public static boolean getLocationEnable() {
        return f;
    }

    public static LOG_LEVEL getLogLevel() {
        return b;
    }

    public static String getLogPath() {
        return c;
    }

    public static boolean getSaveTestLog() {
        return e;
    }

    public static boolean getShowLog() {
        return d;
    }

    public static void setLocationEnable(boolean z) {
        f = z;
    }

    public static void setLogLevel(LOG_LEVEL log_level) {
        b = log_level;
        C0020ai.a();
    }

    public static void setLogPath(String str) {
        c = str;
    }

    public static void setSaveTestLog(boolean z) {
        e = z;
    }

    public static void setShowLog(boolean z) {
        d = z;
        C0020ai.a();
    }
}
