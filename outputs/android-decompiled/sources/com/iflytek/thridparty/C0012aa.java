package com.iflytek.thridparty;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.MessageDigest;
import java.util.regex.Pattern;

/* renamed from: com.iflytek.thridparty.aa, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0012aa {
    public static boolean a = true;
    private static final Pattern b = Pattern.compile("[0-3][0-9a-f]{32}");
    private static String c = null;

    public static synchronized String a(Context context) {
        if (c == null) {
            c = b(context);
        }
        return c;
    }

    private static String a(Context context, String str) {
        try {
            return Settings.System.getString(context.getContentResolver(), str);
        } catch (Exception e) {
            C0020ai.a(e);
            return "";
        }
    }

    private static String a(File file) {
        try {
            if (file.exists() && file.canRead()) {
                FileInputStream fileInputStream = new FileInputStream(file);
                byte[] bArr = new byte[33];
                int i = fileInputStream.read(bArr);
                fileInputStream.close();
                return new String(bArr, 0, i);
            }
        } catch (Throwable th) {
            C0020ai.a(th);
        }
        return null;
    }

    private static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b2 : bArr) {
            int i = b2 & 255;
            if (i < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(i));
        }
        return sb.toString();
    }

    private static void a(File file, String str) {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(str.getBytes());
            fileOutputStream.close();
            if (a(9)) {
                file.getClass().getMethod("setReadable", Boolean.TYPE, Boolean.TYPE).invoke(file, true, false);
            } else {
                Runtime.getRuntime().exec("chmod 444 " + file.getAbsolutePath());
            }
        } catch (Throwable th) {
            C0020ai.a(th);
        }
    }

    private static boolean a(int i) {
        return Build.VERSION.SDK_INT >= i;
    }

    private static final boolean a(String str) {
        return str == null || "".equals(str.trim()) || !b.matcher(str).matches();
    }

    private static String b(Context context) {
        String strA = a(context, "iflytek.deviceid.key");
        if (!a(strA)) {
            return strA;
        }
        String strB = b(context, ".2F6E2C5B63F0F83B");
        if (!a(strB)) {
            new Thread(new RunnableC0013ab(context, strB)).start();
            return strB;
        }
        String strB2 = b(context, "com.iflytek.id", "pref.deviceid.key", null);
        if (!a(strB2)) {
            new Thread(new RunnableC0014ac(context, strB2)).start();
            return strB2;
        }
        String strC = c(context);
        new Thread(new RunnableC0015ad(context, strC)).start();
        return strC;
    }

    private static String b(Context context, String str) {
        if (Environment.getExternalStorageState().equals("mounted")) {
            try {
                return a(new File(Environment.getExternalStorageDirectory() + "/msc", str));
            } catch (Throwable th) {
                C0020ai.a(th);
            }
        }
        return null;
    }

    private static String b(Context context, String str, String str2, String str3) {
        try {
            return context.getSharedPreferences(str, 1).getString(str2, str3);
        } catch (Throwable th) {
            C0020ai.a(th);
            return str3;
        }
    }

    private static String b(String str) {
        try {
            return a(MessageDigest.getInstance("MD5").digest(str.getBytes("UTF-8")));
        } catch (Exception e) {
            return null;
        }
    }

    private static String c(Context context) {
        return "2" + b(d(context));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void c(Context context, String str, String str2) {
        try {
            Settings.System.putString(context.getContentResolver(), str, str2);
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void c(Context context, String str, String str2, String str3) {
        try {
            SharedPreferences sharedPreferences = context.getSharedPreferences(str, 1);
            if (sharedPreferences != null) {
                SharedPreferences.Editor editorEdit = sharedPreferences.edit();
                editorEdit.putString(str2, str3);
                editorEdit.commit();
            }
        } catch (Throwable th) {
            C0020ai.a(th);
        }
    }

    private static String d(Context context) {
        C0027ap c0027apA = N.a(context);
        StringBuilder sb = new StringBuilder();
        sb.append(c0027apA.e("os.imei")).append('-').append(c0027apA.e("os.android_id"));
        if (a) {
            sb.append('-').append(N.d(context));
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void d(Context context, String str, String str2) {
        a(new File(Environment.getExternalStorageDirectory() + "/msc", str), str2);
    }
}
