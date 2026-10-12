package com.tencent.bugly.crashreport.crash;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.tencent.bugly.proguard.w;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BuglyBroadcastRecevier extends BroadcastReceiver {
    public static final long UPLOADLIMITED = 60000;
    private IntentFilter a = new IntentFilter();
    private Context b;
    private String c;
    public static String ACTION_PROCESS_LAUNCHED = "com.tencent.feedback.A01";
    public static String ACTION_PROCESS_CRASHED = "com.tencent.feedback.A02";
    private static BuglyBroadcastRecevier d = null;

    public static synchronized BuglyBroadcastRecevier getInstance() {
        if (d == null) {
            d = new BuglyBroadcastRecevier();
        }
        return d;
    }

    protected void finalize() throws Throwable {
        super.finalize();
        if (this.b != null) {
            this.b.unregisterReceiver(this);
        }
    }

    public synchronized void addFilter(String str) {
        if (!this.a.hasAction(str)) {
            this.a.addAction(str);
        }
        w.c("add action %s", str);
    }

    public synchronized void regist(Context context, b bVar) {
        try {
            w.a("regis BC", new Object[0]);
            this.b = context;
            context.registerReceiver(this, this.a);
        } catch (Throwable th) {
            th.printStackTrace();
        }
    }

    public synchronized void unregist(Context context) {
        try {
            w.a("unregis BC", new Object[0]);
            context.unregisterReceiver(this);
            this.b = context;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        try {
            a(context, intent);
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized boolean a(android.content.Context r11, android.content.Intent r12) {
        /*
            r10 = this;
            r8 = 60000(0xea60, double:2.9644E-319)
            r0 = 1
            r1 = 0
            monitor-enter(r10)
            if (r11 == 0) goto L16
            if (r12 == 0) goto L16
            java.lang.String r2 = r12.getAction()     // Catch: java.lang.Throwable -> L64
            java.lang.String r3 = "android.net.conn.CONNECTIVITY_CHANGE"
            boolean r2 = r2.equals(r3)     // Catch: java.lang.Throwable -> L64
            if (r2 != 0) goto L19
        L16:
            r0 = r1
        L17:
            monitor-exit(r10)
            return r0
        L19:
            android.content.Context r1 = r10.b     // Catch: java.lang.Throwable -> L64
            java.lang.String r1 = com.tencent.bugly.crashreport.common.info.b.e(r1)     // Catch: java.lang.Throwable -> L64
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L64
            java.lang.String r3 = "is Connect BC "
            r2.<init>(r3)     // Catch: java.lang.Throwable -> L64
            java.lang.StringBuilder r2 = r2.append(r1)     // Catch: java.lang.Throwable -> L64
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> L64
            r3 = 0
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.w.c(r2, r3)     // Catch: java.lang.Throwable -> L64
            java.lang.String r2 = "network %s changed to %s"
            r3 = 2
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L64
            r4 = 0
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L64
            r5.<init>()     // Catch: java.lang.Throwable -> L64
            java.lang.String r6 = r10.c     // Catch: java.lang.Throwable -> L64
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> L64
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L64
            r3[r4] = r5     // Catch: java.lang.Throwable -> L64
            r4 = 1
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L64
            r5.<init>()     // Catch: java.lang.Throwable -> L64
            java.lang.StringBuilder r5 = r5.append(r1)     // Catch: java.lang.Throwable -> L64
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L64
            r3[r4] = r5     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.w.a(r2, r3)     // Catch: java.lang.Throwable -> L64
            if (r1 != 0) goto L67
            r1 = 0
            r10.c = r1     // Catch: java.lang.Throwable -> L64
            goto L17
        L64:
            r0 = move-exception
            monitor-exit(r10)
            throw r0
        L67:
            java.lang.String r2 = r10.c     // Catch: java.lang.Throwable -> L64
            r10.c = r1     // Catch: java.lang.Throwable -> L64
            long r4 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.crashreport.common.strategy.a r3 = com.tencent.bugly.crashreport.common.strategy.a.a()     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.t r6 = com.tencent.bugly.proguard.t.a()     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.crashreport.common.info.a r7 = com.tencent.bugly.crashreport.common.info.a.a(r11)     // Catch: java.lang.Throwable -> L64
            if (r3 == 0) goto L81
            if (r6 == 0) goto L81
            if (r7 != 0) goto L8a
        L81:
            java.lang.String r1 = "not inited BC not work"
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.w.d(r1, r2)     // Catch: java.lang.Throwable -> L64
            goto L17
        L8a:
            boolean r1 = r1.equals(r2)     // Catch: java.lang.Throwable -> L64
            if (r1 != 0) goto L17
            int r1 = com.tencent.bugly.crashreport.crash.c.a     // Catch: java.lang.Throwable -> L64
            long r2 = r6.a(r1)     // Catch: java.lang.Throwable -> L64
            long r2 = r4 - r2
            int r1 = (r2 > r8 ? 1 : (r2 == r8 ? 0 : -1))
            if (r1 <= 0) goto Lad
            java.lang.String r1 = "try to upload crash on network changed."
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.w.a(r1, r2)     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.crashreport.crash.c r1 = com.tencent.bugly.crashreport.crash.c.a()     // Catch: java.lang.Throwable -> L64
            r2 = 0
            r1.b(r2)     // Catch: java.lang.Throwable -> L64
        Lad:
            r1 = 1001(0x3e9, float:1.403E-42)
            long r2 = r6.a(r1)     // Catch: java.lang.Throwable -> L64
            long r2 = r4 - r2
            int r1 = (r2 > r8 ? 1 : (r2 == r8 ? 0 : -1))
            if (r1 <= 0) goto L17
            java.lang.String r1 = "try to upload userinfo on network changed."
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.w.a(r1, r2)     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.proguard.v r1 = com.tencent.bugly.proguard.v.a()     // Catch: java.lang.Throwable -> L64
            com.tencent.bugly.crashreport.crash.BuglyBroadcastRecevier$1 r2 = new com.tencent.bugly.crashreport.crash.BuglyBroadcastRecevier$1     // Catch: java.lang.Throwable -> L64
            r2.<init>(r10)     // Catch: java.lang.Throwable -> L64
            r1.b(r2)     // Catch: java.lang.Throwable -> L64
            goto L17
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.BuglyBroadcastRecevier.a(android.content.Context, android.content.Intent):boolean");
    }
}
