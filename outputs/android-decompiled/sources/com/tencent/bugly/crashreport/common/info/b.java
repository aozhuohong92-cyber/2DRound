package com.tencent.bugly.crashreport.common.info;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings;
import android.support.v4.os.EnvironmentCompat;
import android.support.v4.view.MotionEventCompat;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.tencent.bugly.proguard.w;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import org.apache.commons.httpclient.cookie.CookieSpec;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class b {
    private static String a = null;
    private static String b = null;

    public static String a() {
        try {
            return Build.MODEL;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return "fail";
        }
    }

    public static String b() {
        try {
            return Build.VERSION.RELEASE;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return "fail";
        }
    }

    public static int c() {
        try {
            return Build.VERSION.SDK_INT;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return -1;
        }
    }

    public static String a(Context context) {
        String deviceId;
        if (!AppInfo.a(context, "android.permission.READ_PHONE_STATE")) {
            w.d("no READ_PHONE_STATE permission to get IMEI", new Object[0]);
            return "null";
        }
        if (context == null) {
            return null;
        }
        try {
            deviceId = ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
            if (deviceId != null) {
                try {
                    return deviceId.toLowerCase();
                } catch (Throwable th) {
                    Log.i(w.a, "failed to get IMEI");
                    return deviceId;
                }
            }
            return deviceId;
        } catch (Throwable th2) {
            deviceId = null;
        }
    }

    public static String b(Context context) {
        String subscriberId;
        if (!AppInfo.a(context, "android.permission.READ_PHONE_STATE")) {
            w.d("no READ_PHONE_STATE permission to get IMSI", new Object[0]);
            return "null";
        }
        if (context == null) {
            return null;
        }
        try {
            subscriberId = ((TelephonyManager) context.getSystemService("phone")).getSubscriberId();
            if (subscriberId != null) {
                try {
                    return subscriberId.toLowerCase();
                } catch (Throwable th) {
                    Log.i(w.a, "failed to get IMSI");
                    return subscriberId;
                }
            }
            return subscriberId;
        } catch (Throwable th2) {
            subscriberId = null;
        }
    }

    public static String c(Context context) {
        if (context == null) {
            return "fail";
        }
        try {
            String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
            if (string == null) {
                return "null";
            }
            return string.toLowerCase();
        } catch (Throwable th) {
            if (w.a(th)) {
                return "fail";
            }
            Log.i(w.a, "failed to get Android ID");
            return "fail";
        }
    }

    public static String d(Context context) {
        String macAddress;
        if (context == null) {
            return "fail";
        }
        try {
            macAddress = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getMacAddress();
            if (macAddress == null) {
                return "null";
            }
            try {
                return macAddress.toLowerCase();
            } catch (Throwable th) {
                th = th;
                if (!w.a(th)) {
                    th.printStackTrace();
                    return macAddress;
                }
                return macAddress;
            }
        } catch (Throwable th2) {
            th = th2;
            macAddress = "fail";
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:78:0x0098 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x009d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String p() throws java.lang.Throwable {
        /*
            r6 = 2
            r1 = 0
            java.lang.String r0 = "/system/build.prop"
            java.io.FileReader r3 = new java.io.FileReader     // Catch: java.lang.Throwable -> L65 java.lang.Throwable -> L93
            r3.<init>(r0)     // Catch: java.lang.Throwable -> L65 java.lang.Throwable -> L93
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> Lb7 java.lang.Throwable -> Lbc
            r0 = 2048(0x800, float:2.87E-42)
            r2.<init>(r3, r0)     // Catch: java.lang.Throwable -> Lb7 java.lang.Throwable -> Lbc
        L10:
            java.lang.String r0 = r2.readLine()     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            if (r0 == 0) goto Lc1
            java.lang.String r4 = "="
            r5 = 2
            java.lang.String[] r0 = r0.split(r4, r5)     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            int r4 = r0.length     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            if (r4 != r6) goto L10
            r4 = 0
            r4 = r0[r4]     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            java.lang.String r5 = "ro.product.cpu.abilist"
            boolean r4 = r4.equals(r5)     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            if (r4 == 0) goto L40
            r4 = 1
            r0 = r0[r4]     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
        L2e:
            if (r0 == 0) goto L39
            java.lang.String r4 = ","
            java.lang.String[] r0 = r0.split(r4)     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            r4 = 0
            r0 = r0[r4]     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
        L39:
            r2.close()     // Catch: java.io.IOException -> L4f
        L3c:
            r3.close()     // Catch: java.io.IOException -> L5a
        L3f:
            return r0
        L40:
            r4 = 0
            r4 = r0[r4]     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            java.lang.String r5 = "ro.product.cpu.abi"
            boolean r4 = r4.equals(r5)     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            if (r4 == 0) goto L10
            r4 = 1
            r0 = r0[r4]     // Catch: java.lang.Throwable -> Lba java.lang.Throwable -> Lbf
            goto L2e
        L4f:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto L3c
            r1.printStackTrace()
            goto L3c
        L5a:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto L3f
            r1.printStackTrace()
            goto L3f
        L65:
            r0 = move-exception
            r2 = r1
            r3 = r1
        L68:
            boolean r4 = com.tencent.bugly.proguard.w.a(r0)     // Catch: java.lang.Throwable -> Lba
            if (r4 != 0) goto L71
            r0.printStackTrace()     // Catch: java.lang.Throwable -> Lba
        L71:
            if (r2 == 0) goto L76
            r2.close()     // Catch: java.io.IOException -> L7d
        L76:
            if (r3 == 0) goto L7b
            r3.close()     // Catch: java.io.IOException -> L88
        L7b:
            r0 = r1
            goto L3f
        L7d:
            r0 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r0)
            if (r2 != 0) goto L76
            r0.printStackTrace()
            goto L76
        L88:
            r0 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r0)
            if (r2 != 0) goto L7b
            r0.printStackTrace()
            goto L7b
        L93:
            r0 = move-exception
            r2 = r1
            r3 = r1
        L96:
            if (r2 == 0) goto L9b
            r2.close()     // Catch: java.io.IOException -> La1
        L9b:
            if (r3 == 0) goto La0
            r3.close()     // Catch: java.io.IOException -> Lac
        La0:
            throw r0
        La1:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto L9b
            r1.printStackTrace()
            goto L9b
        Lac:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto La0
            r1.printStackTrace()
            goto La0
        Lb7:
            r0 = move-exception
            r2 = r1
            goto L96
        Lba:
            r0 = move-exception
            goto L96
        Lbc:
            r0 = move-exception
            r2 = r1
            goto L68
        Lbf:
            r0 = move-exception
            goto L68
        Lc1:
            r0 = r1
            goto L2e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.p():java.lang.String");
    }

    public static String d() {
        try {
            String strP = p();
            if (strP == null) {
                strP = System.getProperty("os.arch");
            }
            return strP;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return "fail";
        }
    }

    public static long e() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return statFs.getBlockCount() * statFs.getBlockSize();
        } catch (Throwable th) {
            if (w.a(th)) {
                return -1L;
            }
            th.printStackTrace();
            return -1L;
        }
    }

    public static long f() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return statFs.getAvailableBlocks() * statFs.getBlockSize();
        } catch (Throwable th) {
            if (w.a(th)) {
                return -1L;
            }
            th.printStackTrace();
            return -1L;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x008a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0085 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long g() throws java.lang.Throwable {
        /*
            r3 = 0
            java.lang.String r0 = "/proc/meminfo"
            java.io.FileReader r4 = new java.io.FileReader     // Catch: java.lang.Throwable -> L51 java.lang.Throwable -> L80
            r4.<init>(r0)     // Catch: java.lang.Throwable -> L51 java.lang.Throwable -> L80
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> La4 java.lang.Throwable -> Lac
            r0 = 2048(0x800, float:2.87E-42)
            r2.<init>(r4, r0)     // Catch: java.lang.Throwable -> La4 java.lang.Throwable -> Lac
            java.lang.String r0 = r2.readLine()     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            java.lang.String r1 = ":\\s+"
            r3 = 2
            java.lang.String[] r0 = r0.split(r1, r3)     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            r1 = 1
            r0 = r0[r1]     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            java.lang.String r0 = r0.toLowerCase()     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            java.lang.String r1 = "kb"
            java.lang.String r3 = ""
            java.lang.String r0 = r0.replace(r1, r3)     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            java.lang.String r0 = r0.trim()     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            long r0 = java.lang.Long.parseLong(r0)     // Catch: java.lang.Throwable -> La7 java.lang.Throwable -> Laf
            r3 = 10
            long r0 = r0 << r3
            r2.close()     // Catch: java.io.IOException -> L3b
        L37:
            r4.close()     // Catch: java.io.IOException -> L46
        L3a:
            return r0
        L3b:
            r2 = move-exception
            boolean r3 = com.tencent.bugly.proguard.w.a(r2)
            if (r3 != 0) goto L37
            r2.printStackTrace()
            goto L37
        L46:
            r2 = move-exception
            boolean r3 = com.tencent.bugly.proguard.w.a(r2)
            if (r3 != 0) goto L3a
            r2.printStackTrace()
            goto L3a
        L51:
            r0 = move-exception
            r1 = r3
            r4 = r3
        L54:
            boolean r2 = com.tencent.bugly.proguard.w.a(r0)     // Catch: java.lang.Throwable -> La9
            if (r2 != 0) goto L5d
            r0.printStackTrace()     // Catch: java.lang.Throwable -> La9
        L5d:
            if (r1 == 0) goto L62
            r1.close()     // Catch: java.io.IOException -> L6a
        L62:
            if (r4 == 0) goto L67
            r4.close()     // Catch: java.io.IOException -> L75
        L67:
            r0 = -2
            goto L3a
        L6a:
            r0 = move-exception
            boolean r1 = com.tencent.bugly.proguard.w.a(r0)
            if (r1 != 0) goto L62
            r0.printStackTrace()
            goto L62
        L75:
            r0 = move-exception
            boolean r1 = com.tencent.bugly.proguard.w.a(r0)
            if (r1 != 0) goto L67
            r0.printStackTrace()
            goto L67
        L80:
            r0 = move-exception
            r2 = r3
            r4 = r3
        L83:
            if (r2 == 0) goto L88
            r2.close()     // Catch: java.io.IOException -> L8e
        L88:
            if (r4 == 0) goto L8d
            r4.close()     // Catch: java.io.IOException -> L99
        L8d:
            throw r0
        L8e:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto L88
            r1.printStackTrace()
            goto L88
        L99:
            r1 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.a(r1)
            if (r2 != 0) goto L8d
            r1.printStackTrace()
            goto L8d
        La4:
            r0 = move-exception
            r2 = r3
            goto L83
        La7:
            r0 = move-exception
            goto L83
        La9:
            r0 = move-exception
            r2 = r1
            goto L83
        Lac:
            r0 = move-exception
            r1 = r3
            goto L54
        Laf:
            r0 = move-exception
            r1 = r2
            goto L54
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.g():long");
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x00d0 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00d5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long h() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.h():long");
    }

    public static long i() {
        if (!(Environment.getExternalStorageState().equals("mounted"))) {
            return 0L;
        }
        try {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            return statFs.getBlockSize() * statFs.getBlockCount();
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return -2L;
        }
    }

    public static long j() {
        if (!(Environment.getExternalStorageState().equals("mounted"))) {
            return 0L;
        }
        try {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            return statFs.getBlockSize() * statFs.getAvailableBlocks();
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return -2L;
        }
    }

    public static String k() {
        try {
            return Locale.getDefault().getCountry();
        } catch (Throwable th) {
            if (w.a(th)) {
                return "fail";
            }
            th.printStackTrace();
            return "fail";
        }
    }

    public static String l() {
        try {
            return Build.BRAND;
        } catch (Throwable th) {
            if (w.a(th)) {
                return "fail";
            }
            th.printStackTrace();
            return "fail";
        }
    }

    public static String e(Context context) {
        String str;
        TelephonyManager telephonyManager;
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo == null) {
                return null;
            }
            if (activeNetworkInfo.getType() == 1) {
                return "WIFI";
            }
            if (activeNetworkInfo.getType() != 0 || (telephonyManager = (TelephonyManager) context.getSystemService("phone")) == null) {
                str = EnvironmentCompat.MEDIA_UNKNOWN;
            } else {
                int networkType = telephonyManager.getNetworkType();
                switch (networkType) {
                    case 1:
                        return "GPRS";
                    case 2:
                        return "EDGE";
                    case 3:
                        return "UMTS";
                    case 4:
                        return "CDMA";
                    case 5:
                        return "EVDO_0";
                    case 6:
                        return "EVDO_A";
                    case 7:
                        return "1xRTT";
                    case 8:
                        return "HSDPA";
                    case 9:
                        return "HSUPA";
                    case 10:
                        return "HSPA";
                    case 11:
                        return "iDen";
                    case 12:
                        return "EVDO_B";
                    case 13:
                        return "LTE";
                    case MotionEventCompat.AXIS_RZ /* 14 */:
                        return "eHRPD";
                    case 15:
                        return "HSPA+";
                    default:
                        str = "MOBILE(" + networkType + ")";
                        break;
                }
            }
            return str;
        } catch (Exception e) {
            if (w.a(e)) {
                return EnvironmentCompat.MEDIA_UNKNOWN;
            }
            e.printStackTrace();
            return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static String f(Context context) throws Throwable {
        String strA = com.tencent.bugly.proguard.a.a(context, "ro.miui.ui.version.name");
        if (!(strA == null || strA.trim().length() <= 0) && !strA.equals("fail")) {
            return "XiaoMi/MIUI/" + strA;
        }
        String strA2 = com.tencent.bugly.proguard.a.a(context, "ro.build.version.emui");
        if (!(strA2 == null || strA2.trim().length() <= 0) && !strA2.equals("fail")) {
            return "HuaWei/EMOTION/" + strA2;
        }
        String strA3 = com.tencent.bugly.proguard.a.a(context, "ro.lenovo.series");
        if (!(strA3 == null || strA3.trim().length() <= 0) && !strA3.equals("fail")) {
            return "Lenovo/VIBE/" + com.tencent.bugly.proguard.a.a(context, "ro.build.version.incremental");
        }
        String strA4 = com.tencent.bugly.proguard.a.a(context, "ro.build.nubia.rom.name");
        if (!(strA4 == null || strA4.trim().length() <= 0) && !strA4.equals("fail")) {
            return "Zte/NUBIA/" + strA4 + "_" + com.tencent.bugly.proguard.a.a(context, "ro.build.nubia.rom.code");
        }
        String strA5 = com.tencent.bugly.proguard.a.a(context, "ro.meizu.product.model");
        if (!(strA5 == null || strA5.trim().length() <= 0) && !strA5.equals("fail")) {
            return "Meizu/FLYME/" + com.tencent.bugly.proguard.a.a(context, "ro.build.display.id");
        }
        String strA6 = com.tencent.bugly.proguard.a.a(context, "ro.build.version.opporom");
        if (!(strA6 == null || strA6.trim().length() <= 0) && !strA6.equals("fail")) {
            return "Oppo/COLOROS/" + strA6;
        }
        String strA7 = com.tencent.bugly.proguard.a.a(context, "ro.vivo.os.build.display.id");
        if (!(strA7 == null || strA7.trim().length() <= 0) && !strA7.equals("fail")) {
            return "vivo/FUNTOUCH/" + strA7;
        }
        String strA8 = com.tencent.bugly.proguard.a.a(context, "ro.aa.romver");
        if (!(strA8 == null || strA8.trim().length() <= 0) && !strA8.equals("fail")) {
            return "htc/" + strA8 + CookieSpec.PATH_DELIM + com.tencent.bugly.proguard.a.a(context, "ro.build.description");
        }
        String strA9 = com.tencent.bugly.proguard.a.a(context, "ro.lewa.version");
        if (!(strA9 == null || strA9.trim().length() <= 0) && !strA9.equals("fail")) {
            return "tcl/" + strA9 + CookieSpec.PATH_DELIM + com.tencent.bugly.proguard.a.a(context, "ro.build.display.id");
        }
        String strA10 = com.tencent.bugly.proguard.a.a(context, "ro.gn.gnromvernumber");
        if (!(strA10 == null || strA10.trim().length() <= 0) && !strA10.equals("fail")) {
            return "amigo/" + strA10 + CookieSpec.PATH_DELIM + com.tencent.bugly.proguard.a.a(context, "ro.build.display.id");
        }
        String strA11 = com.tencent.bugly.proguard.a.a(context, "ro.build.tyd.kbstyle_version");
        if (!(strA11 == null || strA11.trim().length() <= 0) && !strA11.equals("fail")) {
            return "dido/" + strA11;
        }
        return com.tencent.bugly.proguard.a.a(context, "ro.build.fingerprint") + CookieSpec.PATH_DELIM + com.tencent.bugly.proguard.a.a(context, "ro.build.rom.id");
    }

    public static String g(Context context) {
        return com.tencent.bugly.proguard.a.a(context, "ro.board.platform");
    }

    public static boolean h(Context context) throws Throwable {
        boolean zExists;
        boolean z = Build.TAGS != null && Build.TAGS.contains("test-keys");
        try {
            zExists = new File("/system/app/Superuser.apk").exists();
        } catch (Throwable th) {
            zExists = false;
        }
        Boolean bool = null;
        ArrayList<String> arrayListA = com.tencent.bugly.proguard.a.a(context, new String[]{"/system/bin/sh", "-c", "type su"});
        if (arrayListA != null && arrayListA.size() > 0) {
            Iterator<String> it2 = arrayListA.iterator();
            while (it2.hasNext()) {
                String next = it2.next();
                w.c(next, new Object[0]);
                bool = next.contains("not found") ? false : bool;
            }
            if (bool == null) {
                bool = true;
            }
        }
        return z || zExists || Boolean.valueOf(bool == null ? false : bool.booleanValue()).booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0069 A[Catch: all -> 0x00ae, Throwable -> 0x00c2, TRY_LEAVE, TryCatch #9 {Throwable -> 0x00c2, blocks: (B:19:0x0057, B:21:0x0069), top: B:80:0x0057 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0094 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0084 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00a1 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String m() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 202
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.m():java.lang.String");
    }

    public static String i(Context context) throws Throwable {
        StringBuilder sb = new StringBuilder();
        String strA = com.tencent.bugly.proguard.a.a(context, "ro.genymotion.version");
        if (strA != null) {
            sb.append("ro.genymotion.version");
            sb.append("|");
            sb.append(strA);
            sb.append("\n");
        }
        String strA2 = com.tencent.bugly.proguard.a.a(context, "androVM.vbox_dpi");
        if (strA2 != null) {
            sb.append("androVM.vbox_dpi");
            sb.append("|");
            sb.append(strA2);
            sb.append("\n");
        }
        String strA3 = com.tencent.bugly.proguard.a.a(context, "qemu.sf.fake_camera");
        if (strA3 != null) {
            sb.append("qemu.sf.fake_camera");
            sb.append("|");
            sb.append(strA3);
        }
        return sb.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00a6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String j(android.content.Context r5) throws java.lang.Throwable {
        /*
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.a
            if (r0 != 0) goto L11
            java.lang.String r0 = "ro.secure"
            java.lang.String r0 = com.tencent.bugly.proguard.a.a(r5, r0)
            com.tencent.bugly.crashreport.common.info.b.a = r0
        L11:
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.a
            if (r0 == 0) goto L29
            java.lang.String r0 = "ro.secure"
            r3.append(r0)
            java.lang.String r0 = "|"
            r3.append(r0)
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.a
            r3.append(r0)
            java.lang.String r0 = "\n"
            r3.append(r0)
        L29:
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.b
            if (r0 != 0) goto L35
            java.lang.String r0 = "ro.debuggable"
            java.lang.String r0 = com.tencent.bugly.proguard.a.a(r5, r0)
            com.tencent.bugly.crashreport.common.info.b.b = r0
        L35:
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.b
            if (r0 == 0) goto L4d
            java.lang.String r0 = "ro.debuggable"
            r3.append(r0)
            java.lang.String r0 = "|"
            r3.append(r0)
            java.lang.String r0 = com.tencent.bugly.crashreport.common.info.b.b
            r3.append(r0)
            java.lang.String r0 = "\n"
            r3.append(r0)
        L4d:
            r2 = 0
            java.io.BufferedReader r1 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> L8e java.lang.Throwable -> La2
            java.io.FileReader r0 = new java.io.FileReader     // Catch: java.lang.Throwable -> L8e java.lang.Throwable -> La2
            java.lang.String r4 = "/proc/self/status"
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L8e java.lang.Throwable -> La2
            r1.<init>(r0)     // Catch: java.lang.Throwable -> L8e java.lang.Throwable -> La2
        L5a:
            java.lang.String r0 = r1.readLine()     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            if (r0 == 0) goto L68
            java.lang.String r2 = "TracerPid:"
            boolean r2 = r0.startsWith(r2)     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            if (r2 == 0) goto L5a
        L68:
            if (r0 == 0) goto L81
            r2 = 10
            java.lang.String r0 = r0.substring(r2)     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            java.lang.String r0 = r0.trim()     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            java.lang.String r2 = "tracer_pid"
            r3.append(r2)     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            java.lang.String r2 = "|"
            r3.append(r2)     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            r3.append(r0)     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
        L81:
            java.lang.String r0 = r3.toString()     // Catch: java.lang.Throwable -> Laf java.lang.Throwable -> Lb1
            r1.close()     // Catch: java.io.IOException -> L89
        L88:
            return r0
        L89:
            r1 = move-exception
            com.tencent.bugly.proguard.w.a(r1)
            goto L88
        L8e:
            r0 = move-exception
            r1 = r2
        L90:
            com.tencent.bugly.proguard.w.a(r0)     // Catch: java.lang.Throwable -> Laf
            if (r1 == 0) goto L98
            r1.close()     // Catch: java.io.IOException -> L9d
        L98:
            java.lang.String r0 = r3.toString()
            goto L88
        L9d:
            r0 = move-exception
            com.tencent.bugly.proguard.w.a(r0)
            goto L98
        La2:
            r0 = move-exception
            r1 = r2
        La4:
            if (r1 == 0) goto La9
            r1.close()     // Catch: java.io.IOException -> Laa
        La9:
            throw r0
        Laa:
            r1 = move-exception
            com.tencent.bugly.proguard.w.a(r1)
            goto La9
        Laf:
            r0 = move-exception
            goto La4
        Lb1:
            r0 = move-exception
            goto L90
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.j(android.content.Context):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:67:0x00b5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c1 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String n() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.n():java.lang.String");
    }

    public static String k(Context context) throws Throwable {
        StringBuilder sb = new StringBuilder();
        String strA = com.tencent.bugly.proguard.a.a(context, "gsm.sim.state");
        if (strA != null) {
            sb.append("gsm.sim.state");
            sb.append("|");
            sb.append(strA);
        }
        sb.append("\n");
        String strA2 = com.tencent.bugly.proguard.a.a(context, "gsm.sim.state2");
        if (strA2 != null) {
            sb.append("gsm.sim.state2");
            sb.append("|");
            sb.append(strA2);
        }
        return sb.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0049 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long o() throws java.lang.Throwable {
        /*
            r0 = 0
            r3 = 0
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> L35 java.lang.Throwable -> L45
            java.io.FileReader r1 = new java.io.FileReader     // Catch: java.lang.Throwable -> L35 java.lang.Throwable -> L45
            java.lang.String r4 = "/proc/uptime"
            r1.<init>(r4)     // Catch: java.lang.Throwable -> L35 java.lang.Throwable -> L45
            r2.<init>(r1)     // Catch: java.lang.Throwable -> L35 java.lang.Throwable -> L45
            java.lang.String r1 = r2.readLine()     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            if (r1 == 0) goto L2b
            java.lang.String r3 = " "
            java.lang.String[] r1 = r1.split(r3)     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            r3 = 0
            r1 = r1[r3]     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            long r4 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            r6 = 1000(0x3e8, double:4.94E-321)
            long r4 = r4 / r6
            float r3 = (float) r4     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            float r0 = java.lang.Float.parseFloat(r1)     // Catch: java.lang.Throwable -> L52 java.lang.Throwable -> L54
            float r0 = r3 - r0
        L2b:
            r2.close()     // Catch: java.io.IOException -> L30
        L2e:
            long r0 = (long) r0
            return r0
        L30:
            r1 = move-exception
            com.tencent.bugly.proguard.w.a(r1)
            goto L2e
        L35:
            r1 = move-exception
            r2 = r3
        L37:
            com.tencent.bugly.proguard.w.a(r1)     // Catch: java.lang.Throwable -> L52
            if (r2 == 0) goto L2e
            r2.close()     // Catch: java.io.IOException -> L40
            goto L2e
        L40:
            r1 = move-exception
            com.tencent.bugly.proguard.w.a(r1)
            goto L2e
        L45:
            r0 = move-exception
            r2 = r3
        L47:
            if (r2 == 0) goto L4c
            r2.close()     // Catch: java.io.IOException -> L4d
        L4c:
            throw r0
        L4d:
            r1 = move-exception
            com.tencent.bugly.proguard.w.a(r1)
            goto L4c
        L52:
            r0 = move-exception
            goto L47
        L54:
            r1 = move-exception
            goto L37
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.common.info.b.o():long");
    }
}
