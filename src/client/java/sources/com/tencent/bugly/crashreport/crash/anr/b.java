package com.tencent.bugly.crashreport.crash.anr;

import android.app.ActivityManager;
import android.content.Context;
import android.os.FileObserver;
import android.os.Process;
import com.loopj.android.http.AsyncHttpClient;
import com.tencent.bugly.crashreport.crash.CrashDetailBean;
import com.tencent.bugly.crashreport.crash.anr.TraceFileHelper;
import com.tencent.bugly.crashreport.crash.c;
import com.tencent.bugly.proguard.v;
import com.tencent.bugly.proguard.w;
import com.tencent.bugly.proguard.x;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class b {
    private final Context c;
    private final com.tencent.bugly.crashreport.common.info.a d;
    private final v e;
    private final com.tencent.bugly.crashreport.common.strategy.a f;
    private final String g;
    private final com.tencent.bugly.crashreport.crash.b h;
    private FileObserver i;
    private AtomicInteger a = new AtomicInteger(0);
    private long b = -1;
    private boolean j = true;

    public b(Context context, com.tencent.bugly.crashreport.common.strategy.a aVar, com.tencent.bugly.crashreport.common.info.a aVar2, v vVar, com.tencent.bugly.crashreport.crash.b bVar) {
        Context applicationContext;
        if (context == null || (applicationContext = context.getApplicationContext()) == null) {
            applicationContext = context;
        }
        this.c = applicationContext;
        this.g = context.getDir("bugly", 0).getAbsolutePath();
        this.d = aVar2;
        this.e = vVar;
        this.f = aVar;
        this.h = bVar;
    }

    private static ActivityManager.ProcessErrorStateInfo a(Context context, long j) throws InterruptedException {
        long j2 = 10000 < 0 ? 0L : 10000L;
        w.c("to find!", new Object[0]);
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        long j3 = j2 / 500;
        int i = 0;
        while (true) {
            w.c("waiting!", new Object[0]);
            List<ActivityManager.ProcessErrorStateInfo> processesInErrorState = activityManager.getProcessesInErrorState();
            if (processesInErrorState != null) {
                for (ActivityManager.ProcessErrorStateInfo processErrorStateInfo : processesInErrorState) {
                    if (processErrorStateInfo.condition == 2) {
                        w.c("found!", new Object[0]);
                        return processErrorStateInfo;
                    }
                }
            }
            try {
                Thread.sleep(500L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            int i2 = i + 1;
            if (i >= j3) {
                w.c("end!", new Object[0]);
                return null;
            }
            i = i2;
        }
    }

    private CrashDetailBean a(a aVar) {
        CrashDetailBean crashDetailBean = new CrashDetailBean();
        try {
            crashDetailBean.B = com.tencent.bugly.crashreport.common.info.b.h();
            crashDetailBean.C = com.tencent.bugly.crashreport.common.info.b.f();
            crashDetailBean.D = com.tencent.bugly.crashreport.common.info.b.j();
            crashDetailBean.E = this.d.o();
            crashDetailBean.F = this.d.n();
            crashDetailBean.G = this.d.p();
            crashDetailBean.w = com.tencent.bugly.proguard.a.a(this.c, c.d, (String) null);
            crashDetailBean.x = x.a(true);
            crashDetailBean.b = 3;
            crashDetailBean.e = this.d.g();
            crashDetailBean.f = this.d.i;
            crashDetailBean.g = this.d.v();
            crashDetailBean.m = this.d.f();
            crashDetailBean.n = "ANR_EXCEPTION";
            crashDetailBean.o = aVar.f;
            crashDetailBean.q = aVar.g;
            crashDetailBean.N = new HashMap();
            crashDetailBean.N.put("BUGLY_CR_01", aVar.e);
            int iIndexOf = crashDetailBean.q.indexOf("\n");
            crashDetailBean.p = iIndexOf > 0 ? crashDetailBean.q.substring(0, iIndexOf) : "GET_FAIL";
            crashDetailBean.r = aVar.c;
            crashDetailBean.u = com.tencent.bugly.proguard.a.c(crashDetailBean.q.getBytes());
            crashDetailBean.y = aVar.b;
            crashDetailBean.z = this.d.d;
            crashDetailBean.A = "main(1)";
            crashDetailBean.H = this.d.x();
            crashDetailBean.h = this.d.u();
            crashDetailBean.i = this.d.G();
            crashDetailBean.v = aVar.d;
            crashDetailBean.K = this.d.l;
            crashDetailBean.L = this.d.a;
            crashDetailBean.M = this.d.n;
            crashDetailBean.O = this.d.D();
            crashDetailBean.P = this.d.E();
            crashDetailBean.Q = this.d.y();
            crashDetailBean.R = this.d.C();
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
        }
        return crashDetailBean;
    }

    /* JADX WARN: Removed duplicated region for block: B:79:0x01d6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean a(java.lang.String r12, java.lang.String r13, java.lang.String r14) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 492
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.anr.b.a(java.lang.String, java.lang.String, java.lang.String):boolean");
    }

    public final boolean a() {
        return this.a.get() != 0;
    }

    private boolean a(Context context, String str, ActivityManager.ProcessErrorStateInfo processErrorStateInfo, long j, Map<String, String> map) throws InterruptedException {
        this.f.c();
        if (!this.f.b()) {
            w.e("waiting for remote sync", new Object[0]);
            int i = 0;
            while (!this.f.b()) {
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
        File file = new File(context.getFilesDir(), "bugly/bugly_trace_" + j + ".txt");
        a aVar = new a();
        aVar.c = j;
        aVar.d = file.getAbsolutePath();
        aVar.a = processErrorStateInfo.processName;
        aVar.f = processErrorStateInfo.shortMsg;
        aVar.e = processErrorStateInfo.longMsg;
        aVar.b = map;
        if (map != null) {
            for (String str2 : map.keySet()) {
                if (str2.startsWith("main(")) {
                    aVar.g = map.get(str2);
                }
            }
        }
        Object[] objArr = new Object[6];
        objArr[0] = Long.valueOf(aVar.c);
        objArr[1] = aVar.d;
        objArr[2] = aVar.a;
        objArr[3] = aVar.f;
        objArr[4] = aVar.e;
        objArr[5] = Integer.valueOf(aVar.b == null ? 0 : aVar.b.size());
        w.c("anr tm:%d\ntr:%s\nproc:%s\nsMsg:%s\n lMsg:%s\n threads:%d", objArr);
        if (!this.f.b()) {
            w.e("crash report sync remote fail, will not upload to Bugly , print local for helpful!", new Object[0]);
            com.tencent.bugly.crashreport.crash.b.a("ANR", com.tencent.bugly.proguard.a.b(), aVar.a, null, aVar.e, null);
            return false;
        }
        if (!this.f.c().g) {
            w.d("ANR Report is closed!", new Object[0]);
            return false;
        }
        w.a("found visiable anr , start to upload!", new Object[0]);
        CrashDetailBean crashDetailBeanA = a(aVar);
        if (crashDetailBeanA == null) {
            w.e("pack anr fail!", new Object[0]);
            return false;
        }
        c.a().a(crashDetailBeanA);
        if (crashDetailBeanA.a >= 0) {
            w.a("backup anr record success!", new Object[0]);
        } else {
            w.d("backup anr record fail!", new Object[0]);
        }
        if (str != null && new File(str).exists()) {
            this.a.set(3);
            if (a(str, aVar.d, aVar.a)) {
                w.a("backup trace success", new Object[0]);
            }
        }
        com.tencent.bugly.crashreport.crash.b.a("ANR", com.tencent.bugly.proguard.a.b(), aVar.a, null, aVar.e, crashDetailBeanA);
        if (!this.h.a(crashDetailBeanA)) {
            this.h.a(crashDetailBeanA, 3000L, true);
        }
        this.h.b(crashDetailBeanA);
        return true;
    }

    public final void a(String str) {
        synchronized (this) {
            if (this.a.get() != 0) {
                w.c("trace started return ", new Object[0]);
                return;
            }
            this.a.set(1);
            try {
                w.c("read trace first dump for create time!", new Object[0]);
                TraceFileHelper.a firstDumpInfo = TraceFileHelper.readFirstDumpInfo(str, false);
                long jCurrentTimeMillis = firstDumpInfo != null ? firstDumpInfo.c : -1L;
                if (jCurrentTimeMillis == -1) {
                    w.d("trace dump fail could not get time!", new Object[0]);
                    jCurrentTimeMillis = System.currentTimeMillis();
                }
                if (Math.abs(jCurrentTimeMillis - this.b) < 10000) {
                    w.d("should not process ANR too Fre in %d", Integer.valueOf(AsyncHttpClient.DEFAULT_SOCKET_TIMEOUT));
                    return;
                }
                this.b = jCurrentTimeMillis;
                this.a.set(1);
                try {
                    Map<String, String> mapA = com.tencent.bugly.proguard.a.a(c.e, false);
                    if (mapA == null || mapA.size() <= 0) {
                        w.d("can't get all thread skip this anr", new Object[0]);
                        return;
                    }
                    ActivityManager.ProcessErrorStateInfo processErrorStateInfoA = a(this.c, 10000L);
                    if (processErrorStateInfoA == null) {
                        w.c("proc state is unvisiable!", new Object[0]);
                    } else if (processErrorStateInfoA.pid != Process.myPid()) {
                        w.c("not mind proc!", processErrorStateInfoA.processName);
                    } else {
                        w.a("found visiable anr , start to process!", new Object[0]);
                        a(this.c, str, processErrorStateInfoA, jCurrentTimeMillis, mapA);
                    }
                } catch (Throwable th) {
                    w.a(th);
                    w.e("get all thread stack fail!", new Object[0]);
                }
            } catch (Throwable th2) {
                if (!w.a(th2)) {
                    th2.printStackTrace();
                }
                w.e("handle anr error %s", th2.getClass().toString());
            } finally {
                this.a.set(0);
            }
        }
    }

    private synchronized void c() {
        if (e()) {
            w.d("start when started!", new Object[0]);
        } else {
            this.i = new FileObserver("/data/anr/", 8) { // from class: com.tencent.bugly.crashreport.crash.anr.b.1
                @Override // android.os.FileObserver
                public final void onEvent(int i, String str) {
                    if (str != null) {
                        String str2 = "/data/anr/" + str;
                        if (!str2.contains("trace")) {
                            w.d("not anr file %s", str2);
                        } else {
                            b.this.a(str2);
                        }
                    }
                }
            };
            try {
                this.i.startWatching();
                w.a("start anr monitor!", new Object[0]);
                this.e.b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.anr.b.2
                    @Override // java.lang.Runnable
                    public final void run() {
                        b.this.b();
                    }
                });
            } catch (Throwable th) {
                this.i = null;
                w.d("start anr monitor failed!", new Object[0]);
                if (!w.a(th)) {
                    th.printStackTrace();
                }
            }
        }
    }

    private synchronized void d() {
        if (!e()) {
            w.d("close when closed!", new Object[0]);
        } else {
            try {
                this.i.stopWatching();
                this.i = null;
                w.d("close anr monitor!", new Object[0]);
            } catch (Throwable th) {
                w.d("stop anr monitor failed!", new Object[0]);
                if (!w.a(th)) {
                    th.printStackTrace();
                }
            }
        }
    }

    private synchronized boolean e() {
        return this.i != null;
    }

    private synchronized void b(boolean z) {
        if (z) {
            c();
        } else {
            d();
        }
    }

    private synchronized boolean f() {
        return this.j;
    }

    private synchronized void c(boolean z) {
        if (this.j != z) {
            w.a("user change anr %b", Boolean.valueOf(z));
            this.j = z;
        }
    }

    public final void a(boolean z) {
        c(z);
        boolean z2 = com.tencent.bugly.crashreport.common.strategy.a.a().c().g && f();
        if (z2 != e()) {
            w.a("anr changed to %b", Boolean.valueOf(z2));
            b(z2);
        }
    }

    protected final void b() {
        File[] fileArrListFiles;
        int iIndexOf;
        long jC = com.tencent.bugly.proguard.a.c() - c.f;
        File file = new File(this.g);
        if (file.exists() && file.isDirectory() && (fileArrListFiles = file.listFiles()) != null && fileArrListFiles.length != 0) {
            int length = "bugly_trace_".length();
            int i = 0;
            for (File file2 : fileArrListFiles) {
                String name = file2.getName();
                if (name.startsWith("bugly_trace_")) {
                    try {
                        iIndexOf = name.indexOf(".txt");
                    } catch (Throwable th) {
                        w.e("tomb format error delete %s", name);
                    }
                    if (iIndexOf <= 0 || Long.parseLong(name.substring(length, iIndexOf)) < jC) {
                        if (file2.delete()) {
                            i++;
                        }
                    }
                }
            }
            w.c("clean tombs %d", Integer.valueOf(i));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002e A[Catch: all -> 0x0044, TRY_LEAVE, TryCatch #0 {, blocks: (B:5:0x0005, B:7:0x000d, B:8:0x001e, B:10:0x0022, B:12:0x0028, B:14:0x002e), top: B:21:0x0005 }] */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
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
            boolean r2 = r7.g     // Catch: java.lang.Throwable -> L44
            boolean r3 = r6.e()     // Catch: java.lang.Throwable -> L44
            if (r2 == r3) goto L1e
            java.lang.String r2 = "server anr changed to %b"
            r3 = 1
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L44
            r4 = 0
            boolean r5 = r7.g     // Catch: java.lang.Throwable -> L44
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r5)     // Catch: java.lang.Throwable -> L44
            r3[r4] = r5     // Catch: java.lang.Throwable -> L44
            com.tencent.bugly.proguard.w.d(r2, r3)     // Catch: java.lang.Throwable -> L44
        L1e:
            boolean r2 = r7.g     // Catch: java.lang.Throwable -> L44
            if (r2 == 0) goto L42
            boolean r2 = r6.f()     // Catch: java.lang.Throwable -> L44
            if (r2 == 0) goto L42
        L28:
            boolean r1 = r6.e()     // Catch: java.lang.Throwable -> L44
            if (r0 == r1) goto L40
            java.lang.String r1 = "anr changed to %b"
            r2 = 1
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L44
            r3 = 0
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r0)     // Catch: java.lang.Throwable -> L44
            r2[r3] = r4     // Catch: java.lang.Throwable -> L44
            com.tencent.bugly.proguard.w.a(r1, r2)     // Catch: java.lang.Throwable -> L44
            r6.b(r0)     // Catch: java.lang.Throwable -> L44
        L40:
            monitor-exit(r6)
            return
        L42:
            r0 = r1
            goto L28
        L44:
            r0 = move-exception
            monitor-exit(r6)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.anr.b.a(com.tencent.bugly.crashreport.common.strategy.StrategyBean):void");
    }
}
