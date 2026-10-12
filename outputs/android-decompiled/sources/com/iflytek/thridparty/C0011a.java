package com.iflytek.thridparty;

import android.content.Context;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;

/* renamed from: com.iflytek.thridparty.a, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class C0011a {
    private static char[] a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static String a(Context context) throws Throwable {
        FileInputStream fileInputStream;
        String strA = null;
        File fileB = b(context);
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            fileInputStream = new FileInputStream(fileB);
            try {
                try {
                    byte[] bArr = new byte[2048];
                    while (true) {
                        int i = fileInputStream.read(bArr);
                        if (i == -1) {
                            break;
                        }
                        messageDigest.update(bArr, 0, i);
                    }
                    strA = a(messageDigest.digest());
                    try {
                        fileInputStream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } catch (Exception e2) {
                    e = e2;
                    e.printStackTrace();
                    try {
                        fileInputStream.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                    return strA;
                }
            } catch (Throwable th) {
                th = th;
                try {
                    fileInputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            fileInputStream = null;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream = null;
            fileInputStream.close();
            throw th;
        }
        return strA;
    }

    private static String a(byte[] bArr) {
        int i = 0;
        char[] cArr = new char[32];
        int i2 = 0;
        while (true) {
            int i3 = i;
            if (i2 >= 16) {
                return new String(cArr);
            }
            byte b = bArr[i2];
            int i4 = i3 + 1;
            cArr[i3] = a[(b >>> 4) & 15];
            i = i4 + 1;
            cArr[i4] = a[b & 15];
            i2++;
        }
    }

    private static File b(Context context) {
        try {
            String str = context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).sourceDir;
            Log.i("MainActivity", str);
            return new File(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
