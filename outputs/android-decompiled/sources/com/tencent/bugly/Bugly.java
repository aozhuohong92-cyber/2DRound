package com.tencent.bugly;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.bugly.proguard.n;
import com.tencent.bugly.proguard.o;
import com.tencent.bugly.proguard.w;
import java.util.Map;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Bugly {
    public static final String SDK_IS_DEV = "false";
    private static boolean a;
    public static Boolean isDev;
    public static boolean enable = true;
    public static Context applicationContext = null;
    private static String[] b = {"BuglyCrashModule", "BuglyRqdModule", "BuglyBetaModule"};
    private static String[] c = {"BuglyRqdModule", "BuglyCrashModule", "BuglyBetaModule"};

    public static void init(Context context, String str, boolean z) {
        init(context, str, z, null);
    }

    public static synchronized void init(Context context, String str, boolean z, BuglyStrategy buglyStrategy) {
        Context applicationContext2;
        if (!a) {
            a = true;
            if (context != null && (applicationContext2 = context.getApplicationContext()) != null) {
                context = applicationContext2;
            }
            applicationContext = context;
            if (context == null) {
                Log.e(w.a, "init arg 'context' should not be null!");
            } else {
                if (isDev()) {
                    b = c;
                }
                for (String str2 : b) {
                    try {
                        if (str2.equals("BuglyCrashModule")) {
                            b.a(CrashModule.getInstance());
                        } else if (!str2.equals("BuglyBetaModule") && !str2.equals("BuglyRqdModule")) {
                            str2.equals("BuglyFeedbackModule");
                        }
                    } catch (Throwable th) {
                        w.b(th);
                    }
                }
                b.a = enable;
                b.a(applicationContext, str, z, buglyStrategy);
            }
        }
    }

    public static synchronized String getAppChannel() {
        o oVarA;
        Map<String, byte[]> mapA;
        byte[] bArr;
        String str = null;
        synchronized (Bugly.class) {
            com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a();
            if (aVarA != null) {
                if (TextUtils.isEmpty(aVarA.j) && (oVarA = o.a()) != null && (mapA = oVarA.a(556, (n) null, true)) != null && (bArr = mapA.get("app_channel")) != null) {
                    str = new String(bArr);
                } else {
                    str = aVarA.j;
                }
            }
        }
        return str;
    }

    public static boolean isDev() {
        if (isDev == null) {
            isDev = Boolean.valueOf(Boolean.parseBoolean("false".replace("@", "")));
        }
        return isDev.booleanValue();
    }
}
