package com.iflytek.thridparty;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechError;
import com.iflytek.speech.VoiceWakeuperAidl;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Y {
    public static String a(NetworkInfo networkInfo) {
        if (networkInfo == null) {
            return "none";
        }
        try {
            if (networkInfo.getType() == 1) {
                return "wifi";
            }
            String lowerCase = networkInfo.getExtraInfo().toLowerCase();
            return TextUtils.isEmpty(lowerCase) ? "none" : (lowerCase.startsWith("3gwap") || lowerCase.startsWith("uniwap")) ? "uniwap" : lowerCase.startsWith("cmwap") ? "cmwap" : lowerCase.startsWith("ctwap") ? "ctwap" : lowerCase.startsWith("ctnet") ? "ctnet" : lowerCase;
        } catch (Exception e) {
            C0020ai.a(e.toString());
            return "none";
        }
    }

    public static boolean a(Context context) {
        NetworkInfo activeNetworkInfo;
        String strA = (context == null || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo()) == null) ? "" : a(activeNetworkInfo);
        return "wifi".equals(strA);
    }

    private static boolean a(Context context, String str) {
        return context.checkCallingOrSelfPermission(str) == 0;
    }

    public static String b(NetworkInfo networkInfo) {
        if (networkInfo == null) {
            return "none";
        }
        try {
            if (networkInfo.getType() == 1) {
                return "none";
            }
            return ("" + networkInfo.getSubtypeName()) + VoiceWakeuperAidl.PARAMS_SEPARATE + networkInfo.getSubtype();
        } catch (Exception e) {
            C0020ai.a(e.toString());
            return "none";
        }
    }

    public static void b(Context context) throws SpeechError {
        if (context == null) {
            return;
        }
        NetworkInfo[] allNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getAllNetworkInfo();
        if (allNetworkInfo != null && allNetworkInfo.length > 0) {
            for (NetworkInfo networkInfo : allNetworkInfo) {
                if (networkInfo == null || networkInfo.isConnectedOrConnecting()) {
                    return;
                }
            }
        }
        throw new SpeechError(20001);
    }

    public static boolean c(Context context) {
        if (!a(context, "android.permission.INTERNET")) {
            return false;
        }
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isAvailable();
    }
}
