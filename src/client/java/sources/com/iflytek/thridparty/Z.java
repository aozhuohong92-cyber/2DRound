package com.iflytek.thridparty;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Environment;
import android.os.StatFs;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Z {
    public static long a(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);
        return memoryInfo.availMem;
    }

    public static long a(String str) {
        return (r0.getAvailableBlocks() - 4) * new StatFs(str).getBlockSize();
    }

    public static boolean a() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    public static String b() {
        return Environment.getExternalStorageDirectory().getAbsolutePath();
    }
}
