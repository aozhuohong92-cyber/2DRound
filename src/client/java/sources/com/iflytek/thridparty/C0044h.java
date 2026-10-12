package com.iflytek.thridparty;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.support.v4.os.EnvironmentCompat;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.Random;

/* renamed from: com.iflytek.thridparty.h, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class C0044h {
    public static String a() {
        return a(Build.MODEL);
    }

    public static String a(Context context) {
        String deviceId;
        try {
            deviceId = ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        } catch (Exception e) {
            deviceId = "";
        }
        return a(deviceId);
    }

    public static String a(Context context, String str) {
        String strValueOf;
        try {
            strValueOf = String.valueOf(b(String.valueOf(System.currentTimeMillis()) + str + a(context) + g(context) + new Random().nextInt(10)).toCharArray(), 8, 16);
        } catch (Exception e) {
            strValueOf = "";
        }
        return c(strValueOf);
    }

    protected static String a(String str) {
        if (str == null) {
            return "";
        }
        if (str.length() > 901) {
            str = str.substring(0, 900);
        }
        return str.replace("\\", "").replace("|", "");
    }

    protected static boolean a(String str, int i) {
        return str != null && str.length() > i;
    }

    public static String b() {
        return a(Build.MANUFACTURER);
    }

    public static String b(Context context) {
        String strValueOf;
        try {
            String strA = a(context);
            if (strA == null || strA.length() <= 6) {
                String strG = g(context);
                if (strG == null || strG.length() < 9) {
                    String strC = c(context);
                    strValueOf = (strC == null || strC.length() == 0) ? String.valueOf(b(a(Build.MODEL)).toCharArray(), 7, 18) : String.valueOf(b(strC).toCharArray(), 7, 18);
                } else {
                    strValueOf = String.valueOf(b(strG).toCharArray(), 7, 18);
                }
            } else {
                strValueOf = String.valueOf(b(strA).toCharArray(), 7, 18);
            }
            return strValueOf;
        } catch (Exception e) {
            return "";
        }
    }

    private static String b(String str) throws NoSuchAlgorithmException {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            char[] charArray = str.toCharArray();
            byte[] bArr = new byte[charArray.length];
            for (int i = 0; i < charArray.length; i++) {
                bArr[i] = (byte) charArray[i];
            }
            byte[] bArrDigest = messageDigest.digest(bArr);
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : bArrDigest) {
                int i2 = b & 255;
                if (i2 < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(i2));
            }
            return stringBuffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private static boolean b(Context context, String str) {
        try {
            return context.getPackageManager().checkPermission(str, context.getPackageName()) == 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String c() {
        return a("android " + Build.VERSION.RELEASE);
    }

    public static String c(Context context) {
        String strTrim;
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            if (telephonyManager != null) {
                String subscriberId = telephonyManager.getSubscriberId();
                strTrim = subscriberId != null ? subscriberId.trim() : "";
                C0039c.a("MobileUtils", strTrim);
            } else {
                strTrim = "";
            }
        } catch (Exception e) {
            strTrim = "";
            Log.i("MobileUtils", "can't not read imsi");
        }
        return c(strTrim);
    }

    private static String c(String str) {
        return TextUtils.isEmpty(str) ? "" : str;
    }

    public static int d(Context context) {
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
            return displayMetrics.widthPixels;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static String d() {
        String country;
        try {
            country = Locale.getDefault().getCountry();
        } catch (Exception e) {
            country = "";
        }
        return c(country);
    }

    public static int e(Context context) {
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
            return displayMetrics.heightPixels;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static String e() {
        String language;
        try {
            language = Locale.getDefault().getLanguage();
        } catch (Exception e) {
            language = "";
        }
        return c(language);
    }

    public static int f(Context context) {
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
            return displayMetrics.densityDpi;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static String f() throws IOException {
        String str = "";
        InputStream inputStream = null;
        try {
            try {
                inputStream = new ProcessBuilder("/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq").start().getInputStream();
                byte[] bArr = new byte[24];
                while (inputStream.read(bArr) != -1) {
                    str = String.valueOf(str) + new String(bArr);
                }
            } catch (Exception e) {
                e.printStackTrace();
                str = "";
                try {
                    inputStream.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
            return str.trim();
        } finally {
            try {
                inputStream.close();
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    public static String g() throws Throwable {
        FileReader fileReader;
        try {
            fileReader = new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
            try {
                try {
                    String strTrim = new BufferedReader(fileReader).readLine().trim();
                    try {
                        fileReader.close();
                        return strTrim;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return strTrim;
                    }
                } catch (Exception e2) {
                    e = e2;
                    e.printStackTrace();
                    try {
                        fileReader.close();
                    } catch (Exception e3) {
                        e3.printStackTrace();
                    }
                    return "";
                }
            } catch (Throwable th) {
                th = th;
                try {
                    fileReader.close();
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            fileReader = null;
        } catch (Throwable th2) {
            th = th2;
            fileReader = null;
            fileReader.close();
            throw th;
        }
    }

    public static String g(Context context) {
        String macAddress;
        try {
            if (b(context, "android.permission.ACCESS_WIFI_STATE")) {
                macAddress = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getMacAddress();
                if (macAddress == null || macAddress.equals("")) {
                    macAddress = EnvironmentCompat.MEDIA_UNKNOWN;
                }
            } else {
                Log.w("MobileUtils", "Could not read MAC, forget to include ACCESS_WIFI_STATE permission?");
                macAddress = EnvironmentCompat.MEDIA_UNKNOWN;
            }
            return c(macAddress);
        } catch (Exception e) {
            Log.w("MobileUtils", "Could not read MAC, forget to include ACCESS_WIFI_STATE permission?", e);
            return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static String h() throws Throwable {
        BufferedReader bufferedReader;
        FileReader fileReader;
        BufferedReader bufferedReader2;
        String line;
        try {
            try {
                fileReader = new FileReader("/proc/meminfo");
            } catch (Throwable th) {
                th = th;
            }
            try {
                bufferedReader2 = new BufferedReader(fileReader, 8192);
                try {
                    line = bufferedReader2.readLine();
                } catch (Exception e) {
                    e = e;
                    e.printStackTrace();
                    try {
                        fileReader.close();
                        bufferedReader2.close();
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                    return "";
                }
            } catch (Exception e3) {
                e = e3;
                bufferedReader2 = null;
            } catch (Throwable th2) {
                th = th2;
                bufferedReader = null;
                try {
                    fileReader.close();
                    bufferedReader.close();
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            bufferedReader2 = null;
            fileReader = null;
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
            fileReader = null;
        }
        if (line == null) {
            try {
                fileReader.close();
                bufferedReader2.close();
            } catch (Exception e6) {
                e6.printStackTrace();
            }
            return "";
        }
        String strTrim = line.substring(line.indexOf(":") + 2, line.indexOf("k") - 1).trim();
        C0039c.a("MobileUtils", strTrim);
        String strC = c(strTrim);
        try {
            fileReader.close();
            bufferedReader2.close();
            return strC;
        } catch (Exception e7) {
            e7.printStackTrace();
            return strC;
        }
    }

    public static String h(Context context) {
        try {
            String string = context.getSharedPreferences("lxdMoblieAgent_sys_config", 0).getString("MOBILE_APPKEY", "");
            if (!string.equals("")) {
                return string;
            }
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo != null) {
                string = applicationInfo.metaData.getString("MOBILE_APPKEY");
            }
            if (TextUtils.isEmpty(string)) {
                Log.e("MobileUtils", "the appkey is empty,please init datau.sdk");
            }
            return TextUtils.isEmpty(string) ? "00000" : string;
        } catch (Exception e) {
            e.printStackTrace();
            return "00000";
        }
    }

    public static String i(Context context) throws PackageManager.NameNotFoundException {
        try {
            String string = context.getSharedPreferences("lxdMoblieAgent_sys_config", 0).getString("MOBILE_CHANNEL", "");
            if (!string.equals("")) {
                return a(string);
            }
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo != null && (string = applicationInfo.metaData.getString("MOBILE_CHANNEL")) == null) {
                Log.w("MobileUtils", "Could not read MOBILE_CHANNEL meta-data from AndroidManifest.xml.");
                string = "";
            }
            return a(string);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String j(Context context) {
        String packageName;
        try {
            packageName = context.getPackageName();
        } catch (Exception e) {
            packageName = "";
        }
        return c(packageName);
    }

    public static String k(Context context) {
        String networkOperatorName;
        try {
            networkOperatorName = ((TelephonyManager) context.getSystemService("phone")).getNetworkOperatorName();
        } catch (Exception e) {
            e.printStackTrace();
            networkOperatorName = "";
        }
        return c(networkOperatorName);
    }

    public static String l(Context context) {
        NetworkInfo activeNetworkInfo;
        try {
            if (!b(context, "android.permission.ACCESS_NETWORK_STATE") || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo()) == null) {
                return EnvironmentCompat.MEDIA_UNKNOWN;
            }
            if (activeNetworkInfo.getType() == 1) {
                return "wifi";
            }
            String extraInfo = activeNetworkInfo.getExtraInfo();
            if (extraInfo == null) {
                return EnvironmentCompat.MEDIA_UNKNOWN;
            }
            C0039c.a("MobileUtils", "net type:" + extraInfo);
            return extraInfo.trim();
        } catch (Exception e) {
            Log.w("MobileUtils", "Could not read ACCESSPOINT, forget to include ACCESS_NETSTATE_STATE permission?", e);
            return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static int m(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static String n(Context context) {
        String str;
        try {
            str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
            e.printStackTrace();
            str = "";
        }
        return c(str);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00fd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long[] o(android.content.Context r9) {
        /*
            Method dump skipped, instructions count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.C0044h.o(android.content.Context):long[]");
    }

    public static String p(Context context) {
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
                return "";
            }
            String typeName = activeNetworkInfo.getTypeName();
            return typeName.equalsIgnoreCase("WIFI") ? "WIFI" : typeName.equalsIgnoreCase("MOBILE") ? new StringBuilder(String.valueOf(((TelephonyManager) context.getSystemService("phone")).getNetworkType())).toString() : "";
        } catch (Exception e) {
            return "";
        }
    }

    private static int q(Context context) {
        try {
            return context.getPackageManager().getApplicationInfo(context.getPackageName(), 1).uid;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
