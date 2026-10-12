package com.tencent.bugly.proguard;

import android.content.Context;
import android.os.Build;
import android.view.Choreographer;
import com.tencent.bugly.BuglyStrategy;
import com.tencent.bugly.crashreport.common.info.AppInfo;
import com.tencent.bugly.crashreport.crash.CrashDetailBean;
import java.util.HashMap;
import java.util.Map;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class z {
    public static long a = 3000;
    protected final Context b;
    private com.tencent.bugly.crashreport.crash.b c;
    private com.tencent.bugly.crashreport.common.strategy.a d;
    private com.tencent.bugly.crashreport.common.info.a e;
    private final v f;
    private boolean g = true;
    private boolean h = false;
    private ad i = null;

    public z(Context context, com.tencent.bugly.crashreport.crash.b bVar, com.tencent.bugly.crashreport.common.strategy.a aVar, com.tencent.bugly.crashreport.common.info.a aVar2, v vVar, BuglyStrategy.a aVar3) {
        this.b = context;
        this.c = bVar;
        this.d = aVar;
        this.e = aVar2;
        this.f = vVar;
    }

    private synchronized boolean b() {
        return this.h;
    }

    private synchronized void a(boolean z) {
        if (z) {
            d();
        } else {
            e();
        }
    }

    private synchronized boolean c() {
        return this.g;
    }

    private synchronized void b(boolean z, long j) {
        if (this.g != z) {
            w.a("user change block %b", Boolean.valueOf(z));
            this.g = z;
        }
        if (a != j && j != -1) {
            w.a("user change block threshold to %d", Long.valueOf(j));
            a = j;
        }
    }

    public final void a(boolean z, long j) {
        b(z, j);
        boolean z2 = com.tencent.bugly.crashreport.common.strategy.a.a().c().h && c();
        if (z2 != b()) {
            w.a("block changed to %b", Boolean.valueOf(z2));
            a(z2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002e A[Catch: all -> 0x0050, TryCatch #0 {, blocks: (B:5:0x0005, B:7:0x000d, B:8:0x001e, B:10:0x0022, B:12:0x0028, B:14:0x002e, B:15:0x0040, B:17:0x0048), top: B:24:0x0005 }] */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0048 A[Catch: all -> 0x0050, TRY_LEAVE, TryCatch #0 {, blocks: (B:5:0x0005, B:7:0x000d, B:8:0x001e, B:10:0x0022, B:12:0x0028, B:14:0x002e, B:15:0x0040, B:17:0x0048), top: B:24:0x0005 }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized void a(com.tencent.bugly.crashreport.common.strategy.StrategyBean r7) {
        /*
            r6 = this;
            r0 = 1
            r1 = 0
            monitor-enter(r6)
            if (r7 == 0) goto L1e
            boolean r2 = r7.h     // Catch: java.lang.Throwable -> L50
            boolean r3 = r6.b()     // Catch: java.lang.Throwable -> L50
            if (r2 == r3) goto L1e
            java.lang.String r2 = "server block changed to %b"
            r3 = 1
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L50
            r4 = 0
            boolean r5 = r7.h     // Catch: java.lang.Throwable -> L50
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r5)     // Catch: java.lang.Throwable -> L50
            r3[r4] = r5     // Catch: java.lang.Throwable -> L50
            com.tencent.bugly.proguard.w.d(r2, r3)     // Catch: java.lang.Throwable -> L50
        L1e:
            boolean r2 = r7.h     // Catch: java.lang.Throwable -> L50
            if (r2 == 0) goto L4e
            boolean r2 = r6.c()     // Catch: java.lang.Throwable -> L50
            if (r2 == 0) goto L4e
        L28:
            boolean r1 = r6.b()     // Catch: java.lang.Throwable -> L50
            if (r0 == r1) goto L40
            java.lang.String r1 = "block changed to %b"
            r2 = 1
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L50
            r3 = 0
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r0)     // Catch: java.lang.Throwable -> L50
            r2[r3] = r4     // Catch: java.lang.Throwable -> L50
            com.tencent.bugly.proguard.w.a(r1, r2)     // Catch: java.lang.Throwable -> L50
            r6.a(r0)     // Catch: java.lang.Throwable -> L50
        L40:
            long r0 = r7.v     // Catch: java.lang.Throwable -> L50
            r2 = -1
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 == 0) goto L4c
            long r0 = r7.v     // Catch: java.lang.Throwable -> L50
            com.tencent.bugly.proguard.z.a = r0     // Catch: java.lang.Throwable -> L50
        L4c:
            monitor-exit(r6)
            return
        L4e:
            r0 = r1
            goto L28
        L50:
            r0 = move-exception
            monitor-exit(r6)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.z.a(com.tencent.bugly.crashreport.common.strategy.StrategyBean):void");
    }

    private synchronized void d() {
        if (!this.h) {
            w.a("block monitor start", new Object[0]);
            this.h = true;
            if (Build.VERSION.SDK_INT >= 16) {
                Choreographer.getInstance().postFrameCallback(new aa());
            }
            w.a("threadstack dump thread is start", new Object[0]);
            if (this.i == null) {
                this.i = new ad(50L, this);
            }
            this.i.a();
        }
    }

    private synchronized void e() {
        if (this.h) {
            w.a("block monitor stop", new Object[0]);
            this.h = false;
            if (Build.VERSION.SDK_INT >= 16) {
                Choreographer.getInstance().removeFrameCallback(new aa());
            }
            w.e("threadstack dump thread is stop", new Object[0]);
            if (this.i == null) {
                w.e("threadStackSampler is null, can't stop", new Object[0]);
            } else {
                this.i.b();
                this.i = null;
            }
        }
    }

    public static void a() {
        try {
            w.a("try main sleep for make a test block! sleep 3s", new Object[0]);
            try {
                Thread.sleep(3000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
        }
    }

    public final void a(final long j, final Map<String, String> map) {
        this.f.b(new Runnable() { // from class: com.tencent.bugly.proguard.z.1
            @Override // java.lang.Runnable
            public final void run() {
                try {
                    w.a("found visiable block, start to process!", new Object[0]);
                    z.this.a(z.this.b, j, map);
                } catch (Throwable th) {
                    if (!w.a(th)) {
                        th.printStackTrace();
                    }
                    w.e("handle anr error %s", th.getClass().toString());
                }
            }
        });
    }

    protected final boolean a(Context context, long j, Map<String, String> map) throws InterruptedException {
        this.d.c();
        if (!this.d.b()) {
            w.e("waiting for remote sync", new Object[0]);
            int i = 0;
            while (!this.d.b()) {
                try {
                    Thread.sleep(500L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                i += 500;
                if (i >= 3000) {
                    break;
                }
            }
        }
        y yVar = new y();
        yVar.b = j;
        yVar.a = AppInfo.c(context);
        yVar.c = "your app has occur a block exception. you can check the thread stack to slove your problem.";
        yVar.d = "your app has occur a block exception. you can check the thread stack to slove your problem.";
        yVar.f = map;
        if (map != null) {
            for (String str : map.keySet()) {
                if (str.startsWith("main(")) {
                    yVar.e = map.get(str);
                }
            }
        }
        if (!this.d.b()) {
            w.e("crash report sync remote fail, will not upload to Bugly , print local for helpful!", new Object[0]);
            com.tencent.bugly.crashreport.crash.b.a("Block", a.b(), yVar.a, null, yVar.d, null);
            return false;
        }
        if (!this.d.c().h) {
            w.d("Block Report is closed!", new Object[0]);
            return false;
        }
        w.a("found visible block, start to upload!", new Object[0]);
        CrashDetailBean crashDetailBeanA = a(yVar);
        if (yVar == null) {
            w.e("pack block fail!", new Object[0]);
            return false;
        }
        com.tencent.bugly.crashreport.crash.c.a().a(crashDetailBeanA);
        if (crashDetailBeanA.a >= 0) {
            w.a("backup block record success!", new Object[0]);
        } else {
            w.d("backup block record fail!", new Object[0]);
        }
        com.tencent.bugly.crashreport.crash.b.a("Block", a.b(), yVar.a, null, yVar.d, crashDetailBeanA);
        if (!this.c.a(crashDetailBeanA)) {
            this.c.a(crashDetailBeanA, 3000L, true);
        }
        this.c.b(crashDetailBeanA);
        return true;
    }

    private CrashDetailBean a(y yVar) {
        CrashDetailBean crashDetailBean = new CrashDetailBean();
        try {
            crashDetailBean.B = com.tencent.bugly.crashreport.common.info.b.h();
            crashDetailBean.C = com.tencent.bugly.crashreport.common.info.b.f();
            crashDetailBean.D = com.tencent.bugly.crashreport.common.info.b.j();
            crashDetailBean.E = this.e.o();
            crashDetailBean.F = this.e.n();
            crashDetailBean.G = this.e.p();
            crashDetailBean.w = a.a(this.b, com.tencent.bugly.crashreport.crash.c.d, (String) null);
            crashDetailBean.x = x.a(true);
            crashDetailBean.b = 7;
            crashDetailBean.e = this.e.g();
            crashDetailBean.f = this.e.i;
            crashDetailBean.g = this.e.v();
            crashDetailBean.m = this.e.f();
            crashDetailBean.n = "BLOCK_EXCEPTION";
            crashDetailBean.o = yVar.c;
            crashDetailBean.q = yVar.e;
            crashDetailBean.N = new HashMap();
            crashDetailBean.N.put("BUGLY_CR_01", yVar.d);
            int iIndexOf = crashDetailBean.q.indexOf("\n");
            crashDetailBean.p = iIndexOf > 0 ? crashDetailBean.q.substring(0, iIndexOf) : "GET_FAIL";
            crashDetailBean.r = yVar.b;
            crashDetailBean.u = a.c(crashDetailBean.q.getBytes());
            crashDetailBean.y = yVar.f;
            crashDetailBean.z = this.e.d;
            crashDetailBean.A = "main(1)";
            crashDetailBean.H = this.e.x();
            crashDetailBean.h = this.e.u();
            crashDetailBean.i = this.e.G();
            crashDetailBean.K = this.e.l;
            crashDetailBean.L = this.e.a;
            crashDetailBean.M = this.e.n;
            crashDetailBean.O = this.e.D();
            crashDetailBean.P = this.e.E();
            crashDetailBean.Q = this.e.y();
            crashDetailBean.R = this.e.C();
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
        }
        return crashDetailBean;
    }
}
