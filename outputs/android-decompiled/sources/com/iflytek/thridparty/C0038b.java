package com.iflytek.thridparty;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.text.TextUtils;
import android.util.Log;
import com.iflytek.cloud.SpeechConstant;
import com.loopj.android.http.AsyncHttpClient;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.b, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0038b {
    private static String b = "lxd";
    public static boolean a = false;
    private static int c = 1;
    private static boolean d = true;
    private static boolean e = false;
    private static boolean f = true;
    private static int g = 1;
    private static int h = 0;
    private static final String i = "act" + b;
    private static final String j = "evn" + b;
    private static final String k = "esp" + b;
    private static final String l = "err" + b;
    private static final String m = "sys" + b;
    private static String n = "";
    private static long o = 0;
    private static String p = "";
    private static Object q = new Object();
    private static Object r = new Object();
    private static Object s = new Object();
    private static boolean t = false;
    private static boolean u = false;
    private static String v = "";
    private static ExecutorService w = Executors.newSingleThreadExecutor();

    /* JADX WARN: Can't wrap try/catch for region: R(8:6|(3:66|7|8)|(5:62|9|10|(3:60|12|13)|(1:15))|16|64|17|18|68) */
    /* JADX WARN: Removed duplicated region for block: B:16:0x00fd A[PHI: r1 r4
      0x00fd: PHI (r1v10 int) = (r1v5 int), (r1v0 int), (r1v0 int), (r1v15 int), (r1v15 int) binds: [B:33:0x018d, B:27:0x0177, B:22:0x0162, B:14:0x00f8, B:15:0x00fa] A[DONT_GENERATE, DONT_INLINE]
      0x00fd: PHI (r4v6 int) = (r4v1 int), (r4v2 int), (r4v3 int), (r4v11 int), (r4v11 int) binds: [B:33:0x018d, B:27:0x0177, B:22:0x0162, B:14:0x00f8, B:15:0x00fa] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int a(android.content.Context r8, java.lang.String r9, org.json.JSONObject r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 462
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.C0038b.a(android.content.Context, java.lang.String, org.json.JSONObject):int");
    }

    protected static SharedPreferences a(Context context) {
        return context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_event_" + context.getPackageName(), 0);
    }

    private static String a(Context context, String str, SharedPreferences sharedPreferences) {
        n = "";
        String strA = C0044h.a(context, str);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putString("appKey", str);
        editorEdit.putString("sessionId", strA);
        editorEdit.putLong("lastResumeTime", System.currentTimeMillis());
        editorEdit.putString("activities", i(context, "onResume", null));
        long j2 = sharedPreferences.getLong("readFlowRev", 0L);
        long[] jArrO = C0044h.o(context);
        editorEdit.putLong("readFlowRev", jArrO[0]);
        long j3 = jArrO[0] - j2;
        if (j3 < 0) {
            j3 = 0;
        }
        editorEdit.putLong("consumeFlowRev", j3);
        long j4 = sharedPreferences.getLong("readFlowSnd", 0L);
        editorEdit.putLong("readFlowSnd", jArrO[1]);
        long j5 = jArrO[1] - j4;
        editorEdit.putLong("consumeFlowSnd", j5 >= 0 ? j5 : 0L);
        editorEdit.commit();
        p = strA;
        return strA;
    }

    private static void a(Context context, String str, long j2) {
        synchronized (q) {
            SharedPreferences sharedPreferencesC = c(context);
            int i2 = sharedPreferencesC.getInt("uploadcount", 0);
            String str2 = String.valueOf(sharedPreferencesC.getString("uploadList", "")) + str + "|";
            if (j2 > 10000) {
                j2 = 1;
            }
            sharedPreferencesC.edit().putString("uploadList", str2).commit();
            sharedPreferencesC.edit().putLong("uploadpopindex", j2).commit();
            if (str2.split("\\|").length > 30000) {
                String strN = n(context);
                context.deleteFile(strN);
                j(context, strN);
            } else {
                sharedPreferencesC.edit().putInt("uploadcount", i2 + 1).commit();
            }
        }
    }

    public static void a(Context context, String str, String str2) {
        if (c == 0) {
            Log.i("MobileAgent", "Du have not permission to collect data");
        } else if (str.contains("#")) {
            Log.w("MobileAgent", "the eventId contain illegal char");
        } else {
            h(context, str, str2);
        }
    }

    protected static void a(Context context, boolean z) {
        if (z) {
            C0039c.a("MobileAgentRun", "run into pageact onresumep");
            h(context);
        } else {
            C0039c.a("MobileAgentRun", "run into pageact onpausep");
            i(context);
        }
        C0039c.a("MobileAgentRun", "run out pageact");
    }

    protected static boolean a(Context context, int i2) {
        int i3;
        int i4;
        SharedPreferences sharedPreferencesK = k(context);
        if (i2 == 3) {
            i3 = sharedPreferencesK.getInt("actionmonth", 0);
            i4 = sharedPreferencesK.getInt("actionday", 0);
        } else if (i2 == 2) {
            i3 = sharedPreferencesK.getInt("eventmonth", 0);
            i4 = sharedPreferencesK.getInt("eventday", 0);
        } else {
            i3 = sharedPreferencesK.getInt("sysmonth", 0);
            i4 = sharedPreferencesK.getInt("sysday", 0);
        }
        Date date = new Date();
        return (Integer.valueOf(new SimpleDateFormat("M").format(date)).intValue() == i3 && Integer.valueOf(new SimpleDateFormat("dd").format(date)).intValue() == i4) ? false : true;
    }

    private static boolean a(Context context, SharedPreferences sharedPreferences) throws JSONException {
        SharedPreferences sharedPreferencesA = a(context);
        String string = sharedPreferencesA.getString("eventlogs", "");
        if (string.equals("")) {
            return false;
        }
        String string2 = l(context).getString("sessionId", null);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SpeechConstant.IST_SESSION_ID, string2);
            jSONObject.put("logJsonAry", string);
            if (a(context, jSONObject.toString(), 2)) {
                sharedPreferencesA.edit().putString("eventlogs", "").commit();
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        return true;
    }

    private static boolean a(Context context, SharedPreferences sharedPreferences, boolean z) throws JSONException {
        String string = sharedPreferences.getString("sessionId", "");
        String string2 = sharedPreferences.getString("activities", "");
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SpeechConstant.IST_SESSION_ID, string);
            jSONObject.put("logs", string2);
            if (z) {
                jSONObject.put("flowConsumpRev", sharedPreferences.getLong("consumeFlowRev", 0L));
                jSONObject.put("flowConsumpSnd", sharedPreferences.getLong("consumeFlowSnd", 0L));
            } else {
                jSONObject.put("flowConsumpRev", 0);
                jSONObject.put("flowConsumpSnd", 0);
            }
            if (!a(context, jSONObject.toString(), 3)) {
                return true;
            }
            sharedPreferences.edit().putString("activities", "").commit();
            return true;
        } catch (JSONException e2) {
            e2.printStackTrace();
            return true;
        }
    }

    protected static boolean a(Context context, String str) throws Throwable {
        int iA;
        String strH = h(context, str);
        if (strH.equals("")) {
            b(context, 3);
            i(context, str);
            return true;
        }
        JSONObject jSONObjectD = d(context);
        try {
            try {
                jSONObjectD.put(SpeechConstant.IST_SESSION_ID, new JSONObject(strH).get(SpeechConstant.IST_SESSION_ID));
            } catch (JSONException e2) {
                jSONObjectD.put(SpeechConstant.IST_SESSION_ID, "");
            }
            jSONObjectD.put("mac", C0044h.g(context));
            try {
                jSONObjectD.put("deviceDetail", URLEncoder.encode(C0044h.a(), "UTF-8"));
            } catch (UnsupportedEncodingException e3) {
                jSONObjectD.put("deviceDetail", "");
            }
            try {
                jSONObjectD.put("manufacturer", URLEncoder.encode(C0044h.b(), "UTF-8"));
            } catch (UnsupportedEncodingException e4) {
                jSONObjectD.put("manufacturer", "");
            }
            try {
                jSONObjectD.put("phoneOs", URLEncoder.encode(C0044h.c(), "UTF-8"));
            } catch (UnsupportedEncodingException e5) {
                jSONObjectD.put("phoneOs", "");
            }
            try {
                jSONObjectD.put("accessPoint", URLEncoder.encode(C0044h.l(context), "UTF-8"));
            } catch (UnsupportedEncodingException e6) {
                jSONObjectD.put("accessPoint", "");
            }
            try {
                jSONObjectD.put("netWorkType", URLEncoder.encode(C0044h.p(context), "UTF-8"));
            } catch (UnsupportedEncodingException e7) {
                jSONObjectD.put("netWorkType", "");
            }
            jSONObjectD.put("uuid", v);
            jSONObjectD.put("deviceId", C0044h.a(context));
            jSONObjectD.put("cpuRatioMax", C0044h.f());
            jSONObjectD.put("cpuRatioCur", C0044h.g());
            jSONObjectD.put("menoryRatio", C0044h.h());
            jSONObjectD.put("logJsonAry", new JSONArray("[" + strH + "]"));
            iA = a(context, "http://da.mmarket.com/mmsdk/mmsdk?func=mmsdk:postactlog", jSONObjectD);
        } catch (JSONException e8) {
            e8.printStackTrace();
            iA = 3;
        }
        if (iA != 1 && iA != 3) {
            if (iA == 2) {
            }
            return false;
        }
        b(context, 3);
        i(context, str);
        Log.i("MobileAgent", "act log sd");
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x008a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static synchronized boolean a(android.content.Context r10, java.lang.String r11, int r12) {
        /*
            r1 = 1
            r0 = 0
            java.lang.Class<com.iflytek.thridparty.b> r3 = com.iflytek.thridparty.C0038b.class
            monitor-enter(r3)
            r2 = 3
            if (r12 != r2) goto L46
            java.lang.String r2 = com.iflytek.thridparty.C0038b.i     // Catch: java.lang.Throwable -> L71
        La:
            java.lang.String r4 = r11.trim()     // Catch: java.lang.Throwable -> L71
            java.lang.String r5 = ""
            boolean r4 = r4.equals(r5)     // Catch: java.lang.Throwable -> L71
            if (r4 != 0) goto L44
            long r4 = m(r10)     // Catch: java.lang.Throwable -> L71
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L71
            java.lang.String r2 = java.lang.String.valueOf(r2)     // Catch: java.lang.Throwable -> L71
            r6.<init>(r2)     // Catch: java.lang.Throwable -> L71
            r8 = 1
            long r8 = r8 + r4
            java.lang.StringBuilder r2 = r6.append(r4)     // Catch: java.lang.Throwable -> L71
            java.lang.String r4 = r2.toString()     // Catch: java.lang.Throwable -> L71
            r2 = 0
            r5 = 1
            java.io.FileOutputStream r2 = r10.openFileOutput(r4, r5)     // Catch: java.io.FileNotFoundException -> L5d java.io.IOException -> L74 java.lang.Throwable -> L87
            a(r10, r4, r8)     // Catch: java.io.IOException -> L74 java.lang.Throwable -> L87 java.io.FileNotFoundException -> L9b
            byte[] r4 = r11.getBytes()     // Catch: java.io.IOException -> L74 java.lang.Throwable -> L87 java.io.FileNotFoundException -> L9b
            r2.write(r4)     // Catch: java.io.IOException -> L74 java.lang.Throwable -> L87 java.io.FileNotFoundException -> L9b
            if (r2 == 0) goto L43
            r2.close()     // Catch: java.lang.Throwable -> L71 java.io.IOException -> L93
        L43:
            r0 = r1
        L44:
            monitor-exit(r3)
            return r0
        L46:
            r2 = 2
            if (r12 != r2) goto L4c
            java.lang.String r2 = com.iflytek.thridparty.C0038b.j     // Catch: java.lang.Throwable -> L71
            goto La
        L4c:
            r2 = 4
            if (r12 != r2) goto L52
            java.lang.String r2 = com.iflytek.thridparty.C0038b.l     // Catch: java.lang.Throwable -> L71
            goto La
        L52:
            if (r12 != r1) goto L57
            java.lang.String r2 = com.iflytek.thridparty.C0038b.m     // Catch: java.lang.Throwable -> L71
            goto La
        L57:
            r2 = 5
            if (r12 != r2) goto L44
            java.lang.String r2 = com.iflytek.thridparty.C0038b.k     // Catch: java.lang.Throwable -> L71
            goto La
        L5d:
            r1 = move-exception
            r1 = r2
        L5f:
            java.lang.String r2 = "MobileAgentRun"
            java.lang.String r4 = "can not find log file"
            android.util.Log.w(r2, r4)     // Catch: java.lang.Throwable -> L98
            if (r1 == 0) goto L44
            r1.close()     // Catch: java.io.IOException -> L6c java.lang.Throwable -> L71
            goto L44
        L6c:
            r1 = move-exception
            r1.printStackTrace()     // Catch: java.lang.Throwable -> L71
            goto L44
        L71:
            r0 = move-exception
            monitor-exit(r3)
            throw r0
        L74:
            r0 = move-exception
            java.lang.String r0 = "MobileAgentRun"
            java.lang.String r4 = "file r/w execption"
            android.util.Log.w(r0, r4)     // Catch: java.lang.Throwable -> L87
            if (r2 == 0) goto L43
            r2.close()     // Catch: java.lang.Throwable -> L71 java.io.IOException -> L82
            goto L43
        L82:
            r0 = move-exception
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L71
            goto L43
        L87:
            r0 = move-exception
        L88:
            if (r2 == 0) goto L8d
            r2.close()     // Catch: java.lang.Throwable -> L71 java.io.IOException -> L8e
        L8d:
            throw r0     // Catch: java.lang.Throwable -> L71
        L8e:
            r1 = move-exception
            r1.printStackTrace()     // Catch: java.lang.Throwable -> L71
            goto L8d
        L93:
            r0 = move-exception
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L71
            goto L43
        L98:
            r0 = move-exception
            r2 = r1
            goto L88
        L9b:
            r1 = move-exception
            r1 = r2
            goto L5f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.C0038b.a(android.content.Context, java.lang.String, int):boolean");
    }

    private static boolean a(SharedPreferences sharedPreferences) {
        return System.currentTimeMillis() - sharedPreferences.getLong("endTime", -1L) > 30000;
    }

    protected static SharedPreferences b(Context context) {
        return context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_event_sp" + context.getPackageName(), 0);
    }

    protected static void b(Context context, int i2) throws NumberFormatException {
        Date date = new Date();
        int i3 = Integer.parseInt(new SimpleDateFormat("dd").format(date));
        int i4 = Integer.parseInt(new SimpleDateFormat("M").format(date));
        SharedPreferences.Editor editorEdit = k(context).edit();
        if (i2 == 3) {
            editorEdit.putInt("actionmonth", i4);
            editorEdit.putInt("actionday", i3);
        } else if (i2 == 2) {
            editorEdit.putInt("eventmonth", i4);
            editorEdit.putInt("eventday", i3);
        } else {
            editorEdit.putInt("sysmonth", i4);
            editorEdit.putInt("sysday", i3);
        }
        editorEdit.commit();
    }

    protected static void b(Context context, String str, String str2) throws NumberFormatException {
        synchronized (r) {
            String strA = C0044h.a(str);
            String strA2 = C0044h.a(str2);
            SharedPreferences sharedPreferencesA = a(context);
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(sharedPreferencesA.getString("eventlogs", ""));
            try {
                stringBuffer.append(URLEncoder.encode(strA, "UTF-8"));
                stringBuffer.append("|");
                stringBuffer.append(URLEncoder.encode(strA2, "UTF-8"));
                stringBuffer.append("|");
                stringBuffer.append(1);
                stringBuffer.append("|");
                stringBuffer.append(System.currentTimeMillis());
                stringBuffer.append("\n");
                sharedPreferencesA.edit().putString("eventlogs", stringBuffer.toString()).commit();
                a(context, (SharedPreferences) null);
            } catch (UnsupportedEncodingException e2) {
                C0039c.a("MobileAgentRun", "unsupport utf-8,can't onEvent()");
                return;
            }
        }
        b(context, false);
    }

    protected static void b(Context context, boolean z) throws NumberFormatException {
        if (c != 1) {
            return;
        }
        C0039c.a("MobileAgentRun", "run into strategy");
        f(context);
        if (!e || (e && o(context))) {
            switch (g) {
                case 1:
                    new C0040d(context, 6).start();
                    break;
                case 2:
                    if (z) {
                        new C0040d(context, 6).start();
                        f = false;
                        break;
                    }
                    break;
                case 3:
                    if (a(context, 3)) {
                        new C0040d(context, 6).start();
                        break;
                    }
                    break;
            }
        }
        f = false;
        C0039c.a("MobileAgentRun", "run out strategy");
    }

    private static boolean b(Context context, SharedPreferences sharedPreferences) throws JSONException {
        SharedPreferences sharedPreferencesB = b(context);
        String string = sharedPreferencesB.getString("eventlogs", "");
        if (string.equals("")) {
            return false;
        }
        String string2 = l(context).getString("sessionId", null);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SpeechConstant.IST_SESSION_ID, string2);
            jSONObject.put("logJsonAry", string);
            if (a(context, jSONObject.toString(), 5)) {
                sharedPreferencesB.edit().putString("eventlogs", "").commit();
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        return true;
    }

    protected static boolean b(Context context, String str) {
        try {
            if (a(context, "http://da.mmarket.com/mmsdk/mmsdk?func=mmsdk:postsyslog", new JSONObject(h(context, str))) == 1) {
                i(context, str);
                return true;
            }
        } catch (JSONException e2) {
            i(context, str);
            Log.i("MobileAgent", "SDK del a dirty data");
        }
        return false;
    }

    protected static SharedPreferences c(Context context) {
        return context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_upload_" + context.getPackageName(), 0);
    }

    protected static void c(Context context, String str, String str2) throws NumberFormatException {
        synchronized (s) {
            String strA = C0044h.a(str);
            String strA2 = C0044h.a(str2);
            SharedPreferences sharedPreferencesB = b(context);
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(sharedPreferencesB.getString("eventlogs", ""));
            try {
                stringBuffer.append(URLEncoder.encode(strA, "UTF-8"));
                stringBuffer.append("|");
                stringBuffer.append(URLEncoder.encode(strA2, "UTF-8"));
                stringBuffer.append("|");
                stringBuffer.append(1);
                stringBuffer.append("|");
                stringBuffer.append(System.currentTimeMillis());
                stringBuffer.append("\n");
                sharedPreferencesB.edit().putString("eventlogs", stringBuffer.toString()).commit();
                if (g == 1 || stringBuffer.toString().getBytes().length > 10000) {
                    b(context, (SharedPreferences) null);
                }
            } catch (UnsupportedEncodingException e2) {
                C0039c.a("MobileAgent", "unsupport utf-8,can't onEvent()");
                return;
            }
        }
        b(context, false);
    }

    protected static boolean c(Context context, String str) throws Throwable {
        String strH = h(context, str);
        try {
            JSONObject jSONObject = new JSONObject(strH);
            jSONObject.put("pid", 1);
            jSONObject.put("protocolVersion", "3.1.4");
            jSONObject.put("sdkVersion", "3.2.0.2");
            jSONObject.put("cid", C0044h.b(context));
            jSONObject.put("deviceId", C0044h.a(context));
            jSONObject.put("appKey", C0044h.h(context));
            jSONObject.put("packageName", C0044h.j(context));
            jSONObject.put("versionCode", C0044h.m(context));
            jSONObject.put("versionName", C0044h.n(context));
            jSONObject.put("sendTime", System.currentTimeMillis());
            int iA = a(context, "http://da.mmarket.com/mmsdk/mmsdk?func=mmsdk:posterrlog", jSONObject);
            if (iA != 1 && iA != 3) {
                if (iA == 2) {
                }
                return false;
            }
            b(context, 3);
            i(context, str);
            Log.i("MobileAgent", "erLog sd");
            C0039c.a("MobileAgent", "send errlog success \n" + strH);
            return true;
        } catch (JSONException e2) {
            i(context, str);
            Log.i("MobileAgent", "SDK del a dirty data");
            return false;
        }
    }

    protected static JSONObject d(Context context) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("pid", 1);
            jSONObject.put("protocolVersion", "3.1.4");
            jSONObject.put("sdkVersion", "3.2.0.2");
            jSONObject.put("cid", C0044h.b(context));
            jSONObject.put("appKey", C0044h.h(context));
            jSONObject.put("packageName", context.getPackageName());
            jSONObject.put("versionCode", C0044h.m(context));
            jSONObject.put("versionName", C0044h.n(context));
            jSONObject.put("sendTime", System.currentTimeMillis());
            jSONObject.put("deviceId", C0044h.a(context));
            jSONObject.put("channel", C0044h.i(context));
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        return jSONObject;
    }

    protected static void d(Context context, String str) {
        k(context).edit().putString(str, "record").commit();
    }

    public static void d(Context context, String str, String str2) {
        if (t) {
            Log.i("MobileAgent", "already init");
            return;
        }
        try {
            if (!a) {
                a = !context.getSharedPreferences("MoblieAgent_debug", 0).getString("debug", "").equals("");
            }
        } catch (Exception e2) {
        }
        C0039c.a("MobileAgentAPI", "run in init[" + str + "," + str2 + "]");
        if (context == null) {
            Log.e("MobileAgent", "Exception occurent in joinDu ,context cann't be null");
            return;
        }
        if (TextUtils.isEmpty(str) || C0044h.a(str, 50)) {
            Log.e("MobileAgent", "Exception occurent in joinDu ,appID cann't be null or empty");
            return;
        }
        if (TextUtils.isEmpty(str2)) {
            str2 = "0";
        } else if (C0044h.a(str2, 100)) {
            str2 = str2.substring(0, 99);
            Log.e("MobileAgent", "Exception occurent in joinDu ,channelID cann't be null or empty");
        }
        SharedPreferences sharedPreferences = context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_sys_config", 0);
        sharedPreferences.edit().putString("MOBILE_APPKEY", str).commit();
        sharedPreferences.edit().putString("MOBILE_CHANNEL", str2).commit();
        if (!e(context, "#lxapkmd5")) {
            new Thread(new RunnableC0042f(context)).start();
        }
        t = true;
        Log.i("MobileAgent", "finish init SUCCESS " + a);
    }

    protected static void e(Context context) throws JSONException, NumberFormatException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("pid", 1);
            jSONObject.put("protocolVersion", "3.1.4");
            jSONObject.put("sdkVersion", "3.2.0.2");
            jSONObject.put("cid", C0044h.b(context));
            jSONObject.put("deviceId", C0044h.a(context));
            jSONObject.put("appKey", C0044h.h(context));
            jSONObject.put("packageName", context.getPackageName());
            jSONObject.put("versionCode", C0044h.m(context));
            jSONObject.put("versionName", C0044h.n(context));
            jSONObject.put("sendTime", System.currentTimeMillis());
            jSONObject.put("imsi", C0044h.c(context));
            jSONObject.put("mac", C0044h.g(context));
            jSONObject.put("deviceDetail", URLEncoder.encode(C0044h.a(), "UTF-8"));
            jSONObject.put("manufacturer", URLEncoder.encode(C0044h.b(), "UTF-8"));
            jSONObject.put("phoneOS", URLEncoder.encode(C0044h.c(), "UTF-8"));
            jSONObject.put("screenWidth", C0044h.d(context));
            jSONObject.put("screenHeight", C0044h.e(context));
            jSONObject.put("screenDensity", C0044h.f(context));
            jSONObject.put("carrierName", URLEncoder.encode(C0044h.k(context), "UTF-8"));
            jSONObject.put("accessPoint", C0044h.l(context));
            jSONObject.put("countryCode", C0044h.d());
            jSONObject.put("languageCode", C0044h.e());
            jSONObject.put("channel", URLEncoder.encode(C0044h.i(context), "UTF-8"));
            if (a(context, jSONObject.toString(), 1)) {
                b(context, 1);
            }
        } catch (UnsupportedEncodingException e2) {
            e2.printStackTrace();
        } catch (JSONException e3) {
            e3.printStackTrace();
        }
    }

    protected static boolean e(Context context, String str) {
        return !k(context).getString(str, "").equals("");
    }

    protected static boolean e(Context context, String str, String str2) throws Throwable {
        String strH = str2 == null ? h(context, str) : str2;
        if (strH.equals("")) {
            if (str2 != null) {
                return false;
            }
            b(context, 3);
            i(context, str);
            return true;
        }
        try {
            JSONObject jSONObject = new JSONObject(strH);
            String strB = C0044h.b(context);
            jSONObject.put("pid", 1);
            jSONObject.put("protocolVersion", "3.1.4");
            jSONObject.put("sdkVersion", "3.2.0.2");
            jSONObject.put("cid", strB);
            jSONObject.put("appKey", C0044h.h(context));
            jSONObject.put("packageName", C0044h.j(context));
            jSONObject.put("versionCode", C0044h.m(context));
            jSONObject.put("versionName", C0044h.n(context));
            jSONObject.put("sendTime", System.currentTimeMillis());
            jSONObject.put("mac", C0044h.g(context));
            try {
                jSONObject.put("deviceDetail", URLEncoder.encode(C0044h.a(), "UTF-8"));
            } catch (UnsupportedEncodingException e2) {
                jSONObject.put("deviceDetail", "");
            }
            try {
                jSONObject.put("manufacturer", URLEncoder.encode(C0044h.b(), "UTF-8"));
            } catch (UnsupportedEncodingException e3) {
                jSONObject.put("manufacturer", "");
            }
            try {
                jSONObject.put("phoneOs", URLEncoder.encode(C0044h.c(), "UTF-8"));
            } catch (UnsupportedEncodingException e4) {
                jSONObject.put("phoneOs", "");
            }
            jSONObject.put("accessPoint", C0044h.l(context));
            jSONObject.put("deviceId", C0044h.a(context));
            try {
                jSONObject.put("channel", URLEncoder.encode(C0044h.i(context), "UTF-8"));
            } catch (UnsupportedEncodingException e5) {
                jSONObject.put("channel", "");
            }
            int iA = a(context, "http://da.mmarket.com/mmsdk/mmsdk?func=mmsdk:posteventlog", jSONObject);
            if (iA != 1 && iA != 3) {
                if (iA != 2) {
                    return false;
                }
                Log.w("MobileAgent", "please check your network");
                return false;
            }
            if (str2 == null) {
                b(context, 3);
                i(context, str);
                Log.i("MobileAgent", "evn log sd");
            } else {
                Log.i("MobileAgent", "evnrt log sd");
            }
            return true;
        } catch (JSONException e6) {
            i(context, str);
            e6.printStackTrace();
            return true;
        }
    }

    protected static void f(Context context) throws NumberFormatException {
        if (f) {
            if (g(context, "updateonlyonwifi").equals("1")) {
                e = true;
            } else {
                e = false;
            }
            String strG = g(context, "updatedelay");
            if (!strG.equals("0")) {
                h = Integer.parseInt(strG) * 1000;
            }
            int i2 = Integer.parseInt(g(context, "send_policy"));
            g = i2;
            if (i2 == 0) {
                g = 1;
            }
        }
    }

    protected static void f(Context context, String str) throws JSONException {
        if (str.trim().equals("")) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("occurtime", System.currentTimeMillis());
            jSONObject2.put("errmsg", URLEncoder.encode(str, "UTF-8"));
            jSONArray.put(jSONObject2);
            jSONObject.put(SpeechConstant.IST_SESSION_ID, p);
            jSONObject.put("errjsonary", jSONArray);
            C0039c.a("MobileAgentRun", "errJso" + jSONObject.toString());
            a(context, jSONObject.toString(), 4);
        } catch (UnsupportedEncodingException e2) {
            C0039c.a("MobileAgentRun", "unsupport utf-8,lost catch Exception");
        } catch (JSONException e3) {
            C0039c.a("MobileAgentRun", "json exception,lost catch Exception");
        }
    }

    protected static boolean f(Context context, String str, String str2) throws Throwable {
        String strH = str2 == null ? h(context, str) : str2;
        if (strH.equals("")) {
            if (str2 != null) {
                return false;
            }
            b(context, 3);
            i(context, str);
            return true;
        }
        boolean z = strH.contains("%23lxapkmd5");
        try {
            JSONObject jSONObject = new JSONObject(strH);
            String strB = C0044h.b(context);
            jSONObject.put("pid", 1);
            jSONObject.put("protocolVersion", "3.1.4");
            jSONObject.put("sdkVersion", "3.2.0.2");
            jSONObject.put("cid", strB);
            jSONObject.put("appKey", C0044h.h(context));
            jSONObject.put("packageName", C0044h.j(context));
            jSONObject.put("versionCode", C0044h.m(context));
            jSONObject.put("versionName", C0044h.n(context));
            jSONObject.put("sendTime", System.currentTimeMillis());
            jSONObject.put("mac", C0044h.g(context));
            try {
                jSONObject.put("deviceDetail", URLEncoder.encode(C0044h.a(), "UTF-8"));
            } catch (UnsupportedEncodingException e2) {
                jSONObject.put("deviceDetail", "");
            }
            try {
                jSONObject.put("manufacturer", URLEncoder.encode(C0044h.b(), "UTF-8"));
            } catch (UnsupportedEncodingException e3) {
                jSONObject.put("manufacturer", "");
            }
            try {
                jSONObject.put("phoneOs", URLEncoder.encode(C0044h.c(), "UTF-8"));
            } catch (UnsupportedEncodingException e4) {
                jSONObject.put("phoneOs", "");
            }
            jSONObject.put("accessPoint", C0044h.l(context));
            jSONObject.put("deviceId", C0044h.a(context));
            try {
                jSONObject.put("channel", URLEncoder.encode(C0044h.i(context), "UTF-8"));
            } catch (UnsupportedEncodingException e5) {
                jSONObject.put("channel", "");
            }
            int iA = a(context, "http://da.mmarket.com/mmsdk/mmsdk?func=mmsdk:specposteventlog", jSONObject);
            if (iA != 1 && iA != 3) {
                if (iA != 2) {
                    return false;
                }
                Log.w("MobileAgent", "please check your network");
                return false;
            }
            if (str2 == null) {
                b(context, 3);
                i(context, str);
                Log.i("MobileAgent", "evn log sd");
            } else {
                Log.i("MobileAgent", "evnrt log sd");
            }
            if (z && iA == 1) {
                d(context, "#lxapkmd5");
            }
            return true;
        } catch (JSONException e6) {
            i(context, str);
            e6.printStackTrace();
            return true;
        }
    }

    private static String g(Context context, String str) {
        return k(context).getString(str, "0");
    }

    static synchronized void g(Context context) {
        String strN;
        C0039c.a("MobileAgentRun", "run into uploadlist :" + context.getClass().getName());
        if (g == 2) {
            try {
                Thread.sleep(h);
            } catch (InterruptedException e2) {
                e2.printStackTrace();
            }
            boolean zF = true;
            System.currentTimeMillis();
            while (true) {
                strN = n(context);
                if (strN.equals("") || !zF) {
                    break;
                }
                if (strN.substring(0, 6).equals(i)) {
                    zF = a(context, strN);
                } else if (strN.substring(0, 6).equals(j)) {
                    zF = e(context, strN, null);
                } else if (strN.substring(0, 6).equals(l)) {
                    zF = c(context, strN);
                } else if (strN.substring(0, 6).equals(m)) {
                    zF = b(context, strN);
                } else if (strN.substring(0, 6).equals(k)) {
                    zF = f(context, strN, null);
                }
                if (zF) {
                    try {
                        Thread.sleep(0L);
                    } catch (InterruptedException e3) {
                        e3.printStackTrace();
                    }
                }
                C0039c.a("MobileAgentRun", "finish a task : " + strN);
            }
            C0039c.a("MobileAgentRun", " finish uploadlist ");
            C0039c.a("MobileAgentRun", "run out uploadlist :" + context.getClass().getName());
        } else {
            boolean zF2 = true;
            System.currentTimeMillis();
            while (true) {
                strN = n(context);
                if (strN.equals("")) {
                    break;
                }
                break;
                break;
                C0039c.a("MobileAgentRun", "finish a task : " + strN);
            }
            C0039c.a("MobileAgentRun", " finish uploadlist ");
            C0039c.a("MobileAgentRun", "run out uploadlist :" + context.getClass().getName());
        }
    }

    private static synchronized String h(Context context, String str) {
        String str2;
        str2 = "";
        FileInputStream fileInputStreamOpenFileInput = null;
        try {
            try {
                try {
                    fileInputStreamOpenFileInput = context.openFileInput(str);
                    byte[] bArr = new byte[AsyncHttpClient.DEFAULT_SOCKET_TIMEOUT];
                    while (true) {
                        int i2 = fileInputStreamOpenFileInput.read(bArr);
                        if (i2 == -1) {
                            break;
                        }
                        str2 = String.valueOf(str2) + new String(bArr, 0, i2);
                    }
                    if (fileInputStreamOpenFileInput != null) {
                        try {
                            fileInputStreamOpenFileInput.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                } catch (FileNotFoundException e3) {
                    e3.printStackTrace();
                    if (fileInputStreamOpenFileInput != null) {
                        try {
                            fileInputStreamOpenFileInput.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                }
            } catch (IOException e5) {
                e5.printStackTrace();
                if (fileInputStreamOpenFileInput != null) {
                    try {
                        fileInputStreamOpenFileInput.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                }
            }
        } finally {
        }
        return str2;
    }

    private static void h(Context context) {
        C0039c.a("MobileAgentRun", "run into onresumep :" + context.getClass().getName());
        try {
            C0039c.a("page pro", "do resume start: " + context.getClass().getName());
            b(context, j(context));
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        C0039c.a("MobileAgentRun", "run out onresume :" + context.getClass().getName());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void h(Context context, String str, String str2) {
        C0039c.a("MobileAgentAPI", "run in onEvent [" + str + "," + str2 + "]");
        if (context == null) {
            Log.e("MobileAgent", "Exception occurent in onEvent ,context cann't be null");
            return;
        }
        if (TextUtils.isEmpty(str) || C0044h.a(str, 100)) {
            Log.e("MobileAgent", "Exception occurent in onEvent ,channelID cann't be empty or length more than 100");
        }
        if (C0044h.a(str2, 900)) {
            Log.e("MobileAgent", "Exception occurent in onEvent ,channelID cann't be empty or length more than 100");
        }
        new C0040d(context, 11, str, str2).start();
    }

    private static String i(Context context, String str, String str2) {
        long j2 = 0;
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (str.equals("onResume")) {
            o = jCurrentTimeMillis;
        } else if (str.equals("onPause") && n.equals(context.getClass().getName())) {
            long j3 = jCurrentTimeMillis - o;
            if (j3 > 12000000) {
                j2 = 300000;
            } else if (j3 >= 0) {
                j2 = j3;
            }
        }
        if (str2 == null) {
            str2 = "";
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(str2);
        stringBuffer.append(str);
        stringBuffer.append("|");
        stringBuffer.append(context.getClass().getName());
        stringBuffer.append("|");
        stringBuffer.append(jCurrentTimeMillis);
        stringBuffer.append("|");
        stringBuffer.append(j2);
        stringBuffer.append("|");
        stringBuffer.append(n);
        stringBuffer.append("\n");
        n = context.getClass().getName();
        return stringBuffer.toString();
    }

    private static void i(Context context) {
        C0039c.a("MobileAgentRun", "run into onpausep :" + context.getClass().getName());
        SharedPreferences sharedPreferencesL = l(context);
        String string = sharedPreferencesL.getString("activities", null);
        SharedPreferences.Editor editorEdit = sharedPreferencesL.edit();
        editorEdit.putLong("endTime", System.currentTimeMillis());
        editorEdit.putString("activities", i(context, "onPause", string));
        editorEdit.commit();
        C0039c.a("MobileAgentRun", "run out onpausep :" + context.getClass().getName());
    }

    private static void i(Context context, String str) {
        if (str != null) {
            context.deleteFile(str);
            j(context, str);
        }
    }

    private static void j(Context context, String str) {
        synchronized (q) {
            SharedPreferences sharedPreferencesC = c(context);
            sharedPreferencesC.edit().putString("uploadList", sharedPreferencesC.getString("uploadList", "").replace(String.valueOf(str) + "|", "")).commit();
        }
    }

    private static boolean j(Context context) throws JSONException, NumberFormatException {
        boolean z = true;
        C0039c.a("MobileAgentRun", "run into sessionpolicy");
        String strH = C0044h.h(context);
        SharedPreferences sharedPreferencesL = l(context);
        String string = sharedPreferencesL.getString("sessionId", null);
        if (a(sharedPreferencesL)) {
            if (string != null) {
                a(context, sharedPreferencesL, true);
                SharedPreferences.Editor editorEdit = sharedPreferencesL.edit();
                Long lValueOf = Long.valueOf(sharedPreferencesL.getLong("readFlowRev", 0L));
                Long lValueOf2 = Long.valueOf(sharedPreferencesL.getLong("readFlowSnd", 0L));
                editorEdit.clear();
                editorEdit.putLong("readFlowRev", lValueOf.longValue()).commit();
                editorEdit.putLong("readFlowSnd", lValueOf2.longValue()).commit();
            }
            a(context, strH, sharedPreferencesL);
            a(context, sharedPreferencesL, false);
            if (a(context, 1)) {
                e(context);
            }
        } else {
            String string2 = sharedPreferencesL.getString("activities", null);
            SharedPreferences.Editor editorEdit2 = sharedPreferencesL.edit();
            editorEdit2.putString("activities", i(context, "onResume", string2));
            editorEdit2.putLong("lastResumeTime", System.currentTimeMillis());
            editorEdit2.commit();
            if (g == 1 || string2.getBytes().length > 10000) {
                a(context, sharedPreferencesL, false);
            }
            z = false;
        }
        C0039c.a("MobileAgentRun", "run out sessionpolicy");
        return z;
    }

    private static SharedPreferences k(Context context) {
        return context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_config_" + context.getPackageName(), 0);
    }

    private static SharedPreferences l(Context context) {
        return context.getSharedPreferences(String.valueOf(b) + "MoblieAgent_state_" + context.getPackageName(), 0);
    }

    private static synchronized long m(Context context) {
        return c(context).getLong("uploadpopindex", 0L);
    }

    private static String n(Context context) {
        String strSubstring;
        synchronized (q) {
            String string = c(context).getString("uploadList", "");
            strSubstring = string.equals("") ? "" : string.substring(0, string.indexOf("|"));
        }
        return strSubstring;
    }

    private static boolean o(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.getType() == 1;
    }
}
