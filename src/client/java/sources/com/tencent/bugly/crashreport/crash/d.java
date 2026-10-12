package com.tencent.bugly.crashreport.crash;

import android.content.Context;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import com.tencent.bugly.proguard.ae;
import com.tencent.bugly.proguard.af;
import com.tencent.bugly.proguard.v;
import com.tencent.bugly.proguard.w;
import java.lang.reflect.Field;
import java.util.Map;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class d {
    private static af a;
    private static ae b;
    private static com.tencent.bugly.crashreport.crash.h5.b c;

    static /* synthetic */ void a() {
        com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a();
        try {
            Class<?> cls = Class.forName("com.tencent.bugly.unity.UnityAgent");
            aVarA.getClass();
            String str = "".equals("") ? "com.tencent.bugly" : "com.tencent.bugly.";
            try {
                Field declaredField = cls.getDeclaredField("sdkPackageName");
                declaredField.setAccessible(true);
                declaredField.set(null, str);
            } catch (Exception e) {
            }
        } catch (Throwable th) {
            w.a("no unity agent", new Object[0]);
        }
        try {
            Class<?> cls2 = Class.forName("com.tencent.bugly.cocos.Cocos2dxAgent");
            aVarA.getClass();
            String str2 = "".equals("") ? "com.tencent.bugly" : "com.tencent.bugly.";
            try {
                Field declaredField2 = cls2.getDeclaredField("sdkPackageName");
                declaredField2.setAccessible(true);
                declaredField2.set(null, str2);
            } catch (Exception e2) {
            }
        } catch (Throwable th2) {
            w.a("no cocos agent", new Object[0]);
        }
    }

    public static void a(Context context) {
        c cVarA = c.a();
        if (cVarA != null) {
            a = new af(context, cVarA.k, com.tencent.bugly.crashreport.common.strategy.a.a(), com.tencent.bugly.crashreport.common.info.a.a(), cVarA.l);
            b = new ae(context, cVarA.k, com.tencent.bugly.crashreport.common.strategy.a.a(), com.tencent.bugly.crashreport.common.info.a.a(), cVarA.l);
            c = new com.tencent.bugly.crashreport.crash.h5.b(context, cVarA.k, com.tencent.bugly.crashreport.common.strategy.a.a(), com.tencent.bugly.crashreport.common.info.a.a(), cVarA.l);
            v.a().b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.d.1
                @Override // java.lang.Runnable
                public final void run() {
                    d.a();
                }
            });
        }
    }

    public static void a(StrategyBean strategyBean) {
        if (b != null) {
            ae aeVar = b;
            boolean z = strategyBean.i;
        }
    }

    public static void a(final Thread thread, final String str, final String str2, final String str3) {
        if (a != null) {
            v.a().b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.d.2
                @Override // java.lang.Runnable
                public final void run() {
                    try {
                        d.a.a(thread, str, str2, str3);
                    } catch (Throwable th) {
                        if (!w.b(th)) {
                            th.printStackTrace();
                        }
                        w.e("u3d crash error %s %s %s", str, str2, str3);
                    }
                }
            });
        }
    }

    public static void a(final Thread thread, final int i, final String str, final String str2, final String str3) {
        if (b != null) {
            v.a().b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.d.3
                @Override // java.lang.Runnable
                public final void run() {
                    try {
                        d.b.a(thread, i, str, str2, str3);
                    } catch (Throwable th) {
                        if (!w.b(th)) {
                            th.printStackTrace();
                        }
                        w.e("cocos2d-x crash error %s %s %s", str, str2, str3);
                    }
                }
            });
        }
    }

    public static void a(final Thread thread, final String str, final String str2, final String str3, final Map<String, String> map) {
        if (c != null) {
            v.a().b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.d.4
                @Override // java.lang.Runnable
                public final void run() {
                    try {
                        d.c.a(thread, str, str2, str3, map);
                    } catch (Throwable th) {
                        if (!w.b(th)) {
                            th.printStackTrace();
                        }
                        w.e("H5 crash error %s %s %s", str, str2, str3);
                    }
                }
            });
        }
    }
}
