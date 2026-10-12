package com.iflytek.thridparty;

import android.text.TextUtils;
import android.util.DisplayMetrics;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Q {
    public static DisplayMetrics a = null;

    public static String a(long j) {
        return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss SSS").format(Long.valueOf(j));
    }

    public static boolean a(String str, JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        try {
            String string = jSONObject.getString(str);
            String string2 = jSONObject2.getString(str);
            if (TextUtils.isEmpty(string) || TextUtils.isEmpty(string2)) {
                return false;
            }
            return string.equalsIgnoreCase(string2);
        } catch (JSONException e) {
            C0020ai.b("invalid jsonobject,compare " + str + " error");
            return false;
        }
    }

    public static byte[] a(String str) throws UnsupportedEncodingException {
        byte[] bArr = null;
        try {
            byte[] bytes = str.getBytes("utf-8");
            bArr = new byte[bytes.length + 3];
            bArr[0] = -17;
            bArr[1] = -69;
            bArr[2] = -65;
            for (int i = 3; i < bArr.length; i++) {
                bArr[i] = bytes[i - 3];
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return bArr;
    }

    public static byte[] a(byte[] bArr) {
        byte[] bArr2 = new byte[bArr.length + 3];
        bArr2[0] = -17;
        bArr2[1] = -69;
        bArr2[2] = -65;
        System.arraycopy(bArr, 0, bArr2, 3, bArr.length);
        return bArr2;
    }

    public static boolean b(String str, JSONObject jSONObject, JSONObject jSONObject2) {
        try {
            return jSONObject2.getLong(str) >= jSONObject.getLong(str);
        } catch (JSONException e) {
            C0020ai.b("invalid jsonobject,compare " + str + " error");
            return false;
        }
    }
}
