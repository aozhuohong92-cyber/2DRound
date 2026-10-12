package com.tencent.bugly.crashreport.biz;

import android.app.Application;
import android.content.Context;
import android.os.Build;
import com.tencent.bugly.BuglyStrategy;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import com.tencent.bugly.proguard.v;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class b {
    public static a a;
    private static boolean b;
    private static int g;
    private static long h;
    private static long i;
    private static int c = 10;
    private static long d = 300000;
    private static long e = 30000;
    private static long f = 0;
    private static long j = 0;
    private static Application.ActivityLifecycleCallbacks k = null;
    private static Class<?> l = null;

    static /* synthetic */ int g() {
        int i2 = g;
        g = i2 + 1;
        return i2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0059 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0060  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void c(android.content.Context r10, com.tencent.bugly.BuglyStrategy r11) {
        /*
            Method dump skipped, instructions count: 269
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.biz.b.c(android.content.Context, com.tencent.bugly.BuglyStrategy):void");
    }

    public static void a(final Context context, final BuglyStrategy buglyStrategy) {
        long appReportDelay;
        if (!b) {
            e = com.tencent.bugly.crashreport.common.strategy.a.a().c().n;
            c = com.tencent.bugly.crashreport.common.strategy.a.a().c().t;
            a = new a(context);
            b = true;
            if (buglyStrategy != null) {
                l = buglyStrategy.getUserInfoActivity();
                appReportDelay = buglyStrategy.getAppReportDelay();
            } else {
                appReportDelay = 0;
            }
            if (appReportDelay <= 0) {
                c(context, buglyStrategy);
            } else {
                v.a().a(new Runnable() { // from class: com.tencent.bugly.crashreport.biz.b.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        b.c(context, buglyStrategy);
                    }
                }, appReportDelay);
            }
        }
    }

    public static void a(long j2) {
        if (j2 < 0) {
            j2 = com.tencent.bugly.crashreport.common.strategy.a.a().c().n;
        }
        f = j2;
    }

    public static void a(StrategyBean strategyBean) {
        if (strategyBean != null) {
            if (strategyBean.n > 0) {
                e = strategyBean.n;
            }
            if (strategyBean.t > 0) {
                c = strategyBean.t;
            }
            if (strategyBean.u > 0) {
                d = strategyBean.u;
            }
        }
    }

    public static void a() {
        if (a != null) {
            a.a(2, false, 0L);
        }
    }

    public static void a(Context context) {
        if (b && context != null) {
            if (Build.VERSION.SDK_INT >= 14) {
                Application application = context.getApplicationContext() instanceof Application ? (Application) context.getApplicationContext() : null;
                if (application != null) {
                    try {
                        if (k != null) {
                            application.unregisterActivityLifecycleCallbacks(k);
                        }
                    } catch (Exception e2) {
                    }
                }
            }
            b = false;
        }
    }
}
