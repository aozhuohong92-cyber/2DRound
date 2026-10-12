package com.iflytek.thridparty;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.telephony.cdma.CdmaCellLocation;
import android.telephony.gsm.GsmCellLocation;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.Setting;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.cloud.Version;
import java.io.UnsupportedEncodingException;

/* renamed from: com.iflytek.thridparty.ar, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0029ar {
    private static String a = "xiaoyan";

    public static String a() {
        return SpeechUtility.getUtility().getParameter(SpeechConstant.APPID);
    }

    public static String a(Context context) {
        if (context == null) {
            return "null";
        }
        C0027ap c0027apA = N.a(context);
        String strE = c0027apA.e("os.imsi") + "|" + c0027apA.e("os.imei");
        if (strE.length() < 10) {
            strE = c0027apA.e("net.mac");
        }
        if (TextUtils.isEmpty(strE) || strE.length() <= 0) {
            return null;
        }
        return strE;
    }

    public static String a(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, NumberFormatException {
        if (context == null) {
            throw new SpeechError(ErrorCode.ERROR_INVALID_PARAM);
        }
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        c0027apClone.a(SpeechConstant.NET_TIMEOUT, "20000", false);
        c0027apClone.a("auth", "1", false);
        c0027apClone.a("msc.ver", Version.getVersion());
        c0027apClone.a("mac", N.a(context).e("net.mac"), false);
        c0027apClone.a("dvc", a(context), false);
        c0027apClone.a("unique_id", C0012aa.a(context));
        c0027apClone.a("msc.lat", "" + O.a(context).b("msc.lat"), false);
        c0027apClone.a("msc.lng", "" + O.a(context).b("msc.lng"), false);
        c0027apClone.a(N.b(context));
        a(c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String a(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        c0027apClone.c(SpeechConstant.CLOUD_GRAMMAR);
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a(SpeechConstant.LANGUAGE, "zh_cn", false);
        c0027apClone.a(SpeechConstant.RESULT_TYPE, "json", false);
        c0027apClone.a("rse", abstractHandlerC0059w.q(), false);
        c0027apClone.a(SpeechConstant.TEXT_ENCODING, abstractHandlerC0059w.p(), false);
        c0027apClone.a("ssm", "1", false);
        c0027apClone.a("msc.skin", "0", false);
        if (TextUtils.isEmpty(str)) {
            c0027apClone.a(SpeechConstant.SUBJECT, "iat", false);
        } else {
            c0027apClone.a(SpeechConstant.SUBJECT, "asr", false);
        }
        int iR = abstractHandlerC0059w.r();
        c0027apClone.a("auf=audio/L16;rate", Integer.toString(iR), false);
        if (iR == 16000) {
            c0027apClone.a("aue", "speex-wb", false);
        } else {
            c0027apClone.a("aue", "speex", false);
        }
        if (abstractHandlerC0059w.l()) {
            c0027apClone.a(SpeechConstant.VAD_BOS, "5000", false);
            c0027apClone.a(SpeechConstant.VAD_EOS, "1800", false);
        } else {
            c0027apClone.a(SpeechConstant.VAD_BOS, "4000", false);
            c0027apClone.a(SpeechConstant.VAD_EOS, "700", false);
        }
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static void a(Context context, C0027ap c0027ap) {
        if (context == null) {
            c0027ap.a(SpeechConstant.WAP_PROXY, "none", false);
            return;
        }
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            c0027ap.a(SpeechConstant.WAP_PROXY, "none", false);
        } else {
            c0027ap.a(SpeechConstant.WAP_PROXY, Y.a(activeNetworkInfo), false);
            c0027ap.a("net_subtype", C0027ap.f(Y.b(activeNetworkInfo)), false);
        }
    }

    private static void a(C0027ap c0027ap) {
        if (c0027ap == null || Setting.getLogLevel() == Setting.LOG_LEVEL.none) {
            return;
        }
        String logPath = Setting.getLogPath();
        if (TextUtils.isEmpty(logPath)) {
            logPath = "/sdcard/msc/msc.log";
        }
        int i = -1;
        if (Setting.getLogLevel() == Setting.LOG_LEVEL.detail) {
            i = 31;
        } else if (Setting.getLogLevel() == Setting.LOG_LEVEL.normal) {
            i = 15;
        } else if (Setting.getLogLevel() == Setting.LOG_LEVEL.low) {
            i = 7;
        }
        U.b(logPath);
        c0027ap.a("log", logPath);
        c0027ap.a("lvl", "" + i);
        c0027ap.a("output", "1", false);
    }

    public static boolean a(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.contains("sms") || str.contains("iat");
    }

    public static String b(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a(SpeechConstant.RESULT_TYPE, "json");
        c0027apClone.a("rse", abstractHandlerC0059w.q());
        c0027apClone.a(SpeechConstant.TEXT_ENCODING, abstractHandlerC0059w.p());
        c0027apClone.a("ssm", "1", false);
        c0027apClone.a(SpeechConstant.SUBJECT, SpeechConstant.ENG_IVP, false);
        int iR = abstractHandlerC0059w.r();
        c0027apClone.a("auf=audio/L16;rate", Integer.toString(iR), false);
        if (iR == 16000) {
            c0027apClone.a("aue", "speex-wb;10", false);
        } else {
            c0027apClone.a("aue", "speex", false);
        }
        c0027apClone.a(SpeechConstant.VAD_BOS, "3000", false);
        c0027apClone.a(SpeechConstant.VAD_EOS, "700", false);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String b(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) {
        if (str.equals("oneshot")) {
            return a(context, abstractHandlerC0059w.u().e(SpeechConstant.CLOUD_GRAMMAR), abstractHandlerC0059w);
        }
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        int iA = c0027apClone.a(SpeechConstant.IVW_NET_MODE, 0);
        if (iA == 0) {
            c0027apClone.a(SpeechConstant.IVW_NET_MODE, "0", true);
        } else if (2 == iA || 1 == iA || Y.a(context)) {
            c0027apClone.a(SpeechConstant.IVW_NET_MODE, "1", true);
        } else {
            c0027apClone.a(SpeechConstant.IVW_NET_MODE, "0", true);
        }
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static void b(Context context, C0027ap c0027ap) throws NumberFormatException {
        int lac;
        int i;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (context != null && O.b(context)) {
            try {
                TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                int phoneType = telephonyManager.getPhoneType();
                String networkOperator = telephonyManager.getNetworkOperator();
                int i2 = Integer.parseInt(networkOperator.substring(0, 3));
                int i3 = Integer.parseInt(networkOperator.substring(3));
                switch (phoneType) {
                    case 1:
                        GsmCellLocation gsmCellLocation = (GsmCellLocation) telephonyManager.getCellLocation();
                        int cid = gsmCellLocation.getCid();
                        lac = gsmCellLocation.getLac();
                        i = cid;
                        break;
                    case 2:
                        CdmaCellLocation cdmaCellLocation = (CdmaCellLocation) telephonyManager.getCellLocation();
                        int baseStationId = cdmaCellLocation.getBaseStationId();
                        lac = cdmaCellLocation.getNetworkId();
                        i = baseStationId;
                        break;
                    default:
                        lac = 0;
                        i = 0;
                        break;
                }
                c0027ap.a("mmlc", i2 + "|" + i3 + "|" + lac + "|" + i);
                C0020ai.c("MCC = " + i2 + "\t MNC = " + i3 + "\t phoneType = " + phoneType + "\t LAC = " + lac + "\t CID = " + i);
            } catch (Exception e) {
                C0020ai.a("get mmlc failed");
            }
            C0020ai.c("get mmlc time cost:" + (SystemClock.elapsedRealtime() - jElapsedRealtime));
        }
    }

    private static void b(C0027ap c0027ap) throws UnsupportedEncodingException {
        String parameter = SpeechUtility.getUtility().getParameter("ver_tts");
        if (c0027ap.g("speed_increase")) {
            return;
        }
        int iA = c0027ap.a(SpeechConstant.SPEED, 50);
        if (iA <= 100) {
            c0027ap.a(SpeechConstant.SPEED, "" + iA);
            c0027ap.a("speed_increase", "1");
            return;
        }
        if (100 < iA && iA <= 150 && (TextUtils.isEmpty(parameter) || parameter.contains("5.5."))) {
            c0027ap.a(SpeechConstant.SPEED, "" + (iA - 50));
            c0027ap.a("speed_increase", "2");
        } else {
            if (100 >= iA || iA > 200) {
                return;
            }
            c0027ap.a(SpeechConstant.SPEED, "" + (iA - 100));
            c0027ap.a("speed_increase", "4");
        }
    }

    public static String c(Context context, C0027ap c0027ap) {
        C0027ap c0027apClone = c0027ap.clone();
        c0027apClone.a(SpeechConstant.APPID, SpeechUtility.getUtility().getParameter(SpeechConstant.APPID));
        c0027apClone.a(N.b(context));
        c0027apClone.a("dvc", a(context), false);
        c0027apClone.a("aue", "raw", false);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String c(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a("ssm", "1", false);
        c0027apClone.a(SpeechConstant.RESULT_TYPE, "json", false);
        c0027apClone.a("rse", abstractHandlerC0059w.q(), false);
        c0027apClone.a(SpeechConstant.TEXT_ENCODING, abstractHandlerC0059w.p(), false);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String c(Context context, String str, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a("sub", "mfv", false);
        c0027apClone.a("prot_ver", "50", false);
        c0027apClone.a("mver", "2.0", false);
        c0027apClone.a("server_url", "http://imfv.openspeech.cn/msp.do", false);
        if ("verify".equals(c0027apClone.e("sst"))) {
            c0027apClone.a("scene_mode", "vfy", false);
        } else {
            c0027apClone.a("scene_mode", "gen", false);
        }
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String d(Context context, C0027ap c0027ap) {
        C0027ap c0027apClone = c0027ap.clone();
        c0027apClone.a(SpeechConstant.APPID, SpeechUtility.getUtility().getParameter(SpeechConstant.APPID));
        c0027apClone.a(N.b(context));
        c0027apClone.a("dvc", a(context), false);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String d(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException, UnsupportedEncodingException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a("ssm", "1", false);
        int iR = abstractHandlerC0059w.r();
        c0027apClone.a("auf=audio/L16;rate", Integer.toString(iR));
        if (iR == 16000) {
            c0027apClone.a("aue", "speex-wb", false);
        } else {
            c0027apClone.a("aue", "speex", false);
        }
        c0027apClone.a(SpeechConstant.VOICE_NAME, c0027apClone.b(SpeechConstant.VOICE_NAME, a), true);
        c0027apClone.a(SpeechConstant.TEXT_ENCODING, abstractHandlerC0059w.p(), false);
        b(c0027apClone);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }

    public static String e(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws NumberFormatException {
        C0027ap c0027apClone = abstractHandlerC0059w.u().clone();
        a(context, c0027apClone);
        b(context, c0027apClone);
        c0027apClone.a("ssm", "1", false);
        int iR = abstractHandlerC0059w.r();
        c0027apClone.a("auf=audio/L16;rate", Integer.toString(iR), false);
        if (iR == 16000) {
            c0027apClone.a("aue", "speex-wb", false);
        } else {
            c0027apClone.a("aue", "speex", false);
        }
        c0027apClone.a(SpeechConstant.TEXT_ENCODING, abstractHandlerC0059w.p(), false);
        c0027apClone.a("plev", "1", false);
        c0027apClone.a(SpeechConstant.ACCENT, "mandarin", false);
        c0027apClone.a("domain", "ise", false);
        c0027apClone.a(SpeechConstant.SUBJECT, "ise", false);
        c0027apClone.a(SpeechConstant.RESULT_TYPE, "xml", false);
        c0027apClone.a(SpeechConstant.VAD_BOS, "5000", false);
        c0027apClone.a(SpeechConstant.VAD_EOS, "1800", false);
        c0027apClone.a("vad_speech_timeout", "2147483647", false);
        c0027apClone.a(C0028aq.c);
        return c0027apClone.toString();
    }
}
