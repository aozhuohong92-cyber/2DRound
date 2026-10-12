package com.iflytek.cloud.util;

import android.graphics.Bitmap;
import com.iflytek.msc.MSC;
import java.util.Random;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class VerifierUtil {
    public static Bitmap ARGB2Gray(Bitmap bitmap) {
        if (bitmap.getConfig() != Bitmap.Config.ARGB_8888) {
            return null;
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ALPHA_8);
        if (a(bitmap, bitmapCreateBitmap)) {
            return bitmapCreateBitmap;
        }
        return null;
    }

    private static boolean a(Bitmap bitmap, Bitmap bitmap2) {
        return MSC.doARGB2Gray(bitmap, bitmap2);
    }

    public static String generateNumberPassword(int i) {
        StringBuffer stringBuffer = new StringBuffer();
        Random random = new Random();
        String str = "023456789".charAt(random.nextInt("023456789".length())) + "";
        stringBuffer.append(str);
        for (int i2 = 0; i2 < i - 1; i2++) {
            Boolean bool = false;
            while (!bool.booleanValue()) {
                str = "023456789".charAt(random.nextInt("023456789".length())) + "";
                bool = stringBuffer.indexOf(str) >= 0 ? false : Integer.parseInt(new StringBuilder().append(stringBuffer.charAt(stringBuffer.length() + (-1))).append("").toString()) * Integer.parseInt(str) != 10;
            }
            stringBuffer.append(str);
        }
        return stringBuffer.toString();
    }

    public static int getBitmapsize(Bitmap bitmap) {
        return bitmap.getRowBytes() * bitmap.getHeight();
    }
}
