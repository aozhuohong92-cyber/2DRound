package com.iflytek.thridparty;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings;
import android.support.v4.os.EnvironmentCompat;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import java.lang.reflect.Field;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class N {
    public static String[][] a = {new String[]{"os.manufact", Build.MANUFACTURER}, new String[]{"os.model", Build.MODEL}, new String[]{"os.product", Build.PRODUCT}, new String[]{"os.display", Build.DISPLAY}, new String[]{"os.host", Build.HOST}, new String[]{"os.id", Build.ID}, new String[]{"os.device", Build.DEVICE}, new String[]{"os.board", Build.BOARD}, new String[]{"os.brand", Build.BRAND}, new String[]{"os.user", Build.USER}, new String[]{"os.type", Build.TYPE}};
    private static String[][] b = {new String[]{"os.cpu", "CPU_ABI"}, new String[]{"os.cpu2", "CPU_ABI2"}, new String[]{"os.serial", "SERIAL"}, new String[]{"os.hardware", "HARDWARE"}, new String[]{"os.bootloader", "BOOTLOADER"}, new String[]{"os.radio", "RADIO"}};
    private static C0027ap c = new C0027ap();
    private static boolean d = false;

    public static synchronized C0027ap a(Context context) {
        C0027ap c0027ap;
        if (d) {
            c0027ap = c;
        } else {
            e(context);
            c0027ap = c;
        }
        return c0027ap;
    }

    private static String a(String str) throws NoSuchFieldException {
        try {
            Field field = Build.class.getField(str);
            return field != null ? field.get(new Build()).toString() : EnvironmentCompat.MEDIA_UNKNOWN;
        } catch (Exception e) {
            return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static void a(C0027ap c0027ap, Context context) throws PackageManager.NameNotFoundException {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 0);
            c0027ap.a("app.ver.name", packageInfo.versionName);
            c0027ap.a("app.ver.code", "" + packageInfo.versionCode);
            c0027ap.a("app.pkg", applicationInfo.packageName);
            c0027ap.a("app.path", applicationInfo.dataDir);
            c0027ap.a("app.name", applicationInfo.loadLabel(context.getPackageManager()).toString());
        } catch (Exception e) {
        }
    }

    public static C0027ap b(Context context) {
        C0027ap c0027apA = a(context);
        C0027ap c0027ap = new C0027ap();
        c0027ap.a(c0027apA, "app.name");
        c0027ap.a(c0027apA, "app.path");
        c0027ap.a(c0027apA, "app.pkg");
        c0027ap.a(c0027apA, "app.ver.name");
        c0027ap.a(c0027apA, "app.ver.code");
        c0027ap.a(c0027apA, "os.system");
        c0027ap.a(c0027apA, "os.resolution");
        c0027ap.a(c0027apA, "os.density");
        c0027ap.a(c0027apA, "net.mac");
        c0027ap.a(c0027apA, "os.imei");
        c0027ap.a(c0027apA, "os.imsi");
        c0027ap.a(c0027apA, "os.version");
        c0027ap.a(c0027apA, "os.release");
        c0027ap.a(c0027apA, "os.incremental");
        c0027ap.a(c0027apA, "os.android_id");
        c0027ap.a(c0027apA, "carrier");
        c0027ap.a(c0027apA, a[0][0]);
        c0027ap.a(c0027apA, a[1][0]);
        c0027ap.a(c0027apA, a[2][0]);
        c0027ap.a(c0027apA, a[3][0]);
        return c0027ap;
    }

    public static String c(Context context) {
        try {
            String networkOperatorName = ((TelephonyManager) context.getSystemService("phone")).getNetworkOperatorName();
            return !TextUtils.isEmpty(networkOperatorName) ? networkOperatorName : "";
        } catch (Throwable th) {
            return "";
        }
    }

    public static String d(Context context) {
        try {
            return ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getMacAddress();
        } catch (Throwable th) {
            C0020ai.a("Failed to get mac Info");
            return "";
        }
    }

    private static void e(Context context) {
        try {
            try {
                c.a();
                c.a("os.system", "Android");
                a(c, context);
                DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
                c.a("os.resolution", displayMetrics.widthPixels + "*" + displayMetrics.heightPixels);
                c.a("os.density", "" + displayMetrics.density);
                TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                try {
                    c.a("os.imei", telephonyManager.getDeviceId());
                } catch (Throwable th) {
                    C0020ai.a("Failed to get did Info");
                }
                try {
                    c.a("os.imsi", telephonyManager.getSubscriberId());
                } catch (Throwable th2) {
                    C0020ai.a("Failed to get sbid Info");
                }
                String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
                if (!TextUtils.isEmpty(string)) {
                    c.a("os.android_id", string);
                }
                c.a("os.version", Build.VERSION.SDK);
                c.a("os.release", Build.VERSION.RELEASE);
                c.a("os.incremental", Build.VERSION.INCREMENTAL);
                for (int i = 0; i < a.length; i++) {
                    c.a(a[i][0], a[i][1]);
                }
                for (int i2 = 0; i2 < b.length; i2++) {
                    c.a(b[i2][0], a(b[i2][1]));
                }
                c.a("net.mac", d(context));
                c.a("carrier", c(context));
                c.d();
                d = true;
            } catch (Throwable th3) {
                C0020ai.a("Failed to get property Info");
                d = false;
            }
        } catch (Exception e) {
            C0020ai.a("Failed to get prop Info");
            d = false;
        }
    }
}
