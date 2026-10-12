package com.tencent.bugly.crashreport.crash.jni;

import android.content.Context;
import com.tencent.bugly.crashreport.crash.CrashDetailBean;
import com.tencent.bugly.crashreport.crash.c;
import com.tencent.bugly.proguard.v;
import com.tencent.bugly.proguard.w;
import java.io.File;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NativeCrashHandler {
    private static NativeCrashHandler a;
    private static boolean l = false;
    private static boolean m = false;
    private final Context b;
    private final com.tencent.bugly.crashreport.common.info.a c;
    private final v d;
    private NativeExceptionHandler e;
    private String f;
    private final boolean g;
    private boolean h = false;
    private boolean i = false;
    private boolean j = false;
    private boolean k = false;
    private com.tencent.bugly.crashreport.crash.b n;

    protected native boolean appendNativeLog(String str, String str2, String str3);

    protected native boolean appendWholeNativeLog(String str);

    protected native String getNativeKeyValueList();

    protected native String getNativeLog();

    protected native boolean putNativeKeyValue(String str, String str2);

    protected native String regist(String str, boolean z, int i);

    protected native String removeNativeKeyValue(String str);

    protected native void setNativeInfo(int i, String str);

    protected native void testCrash();

    protected native String unregist();

    /* JADX WARN: Removed duplicated region for block: B:16:0x0033  */
    @android.annotation.SuppressLint({"SdCardPath"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private NativeCrashHandler(android.content.Context r4, com.tencent.bugly.crashreport.common.info.a r5, com.tencent.bugly.crashreport.crash.b r6, com.tencent.bugly.proguard.v r7, boolean r8, java.lang.String r9) {
        /*
            r3 = this;
            r1 = 0
            r3.<init>()
            r3.h = r1
            r3.i = r1
            r3.j = r1
            r3.k = r1
            if (r4 != 0) goto L2b
            r0 = r4
        Lf:
            r3.b = r0
            if (r9 == 0) goto L33
            java.lang.String r0 = r9.trim()     // Catch: java.lang.Throwable -> L41
            int r0 = r0.length()     // Catch: java.lang.Throwable -> L41
            if (r0 <= 0) goto L33
            r0 = r1
        L1e:
            if (r0 != 0) goto L35
        L20:
            r3.n = r6
            r3.f = r9
            r3.c = r5
            r3.d = r7
            r3.g = r8
            return
        L2b:
            android.content.Context r0 = r4.getApplicationContext()
            if (r0 != 0) goto Lf
            r0 = r4
            goto Lf
        L33:
            r0 = 1
            goto L1e
        L35:
            java.lang.String r0 = "bugly"
            r1 = 0
            java.io.File r0 = r4.getDir(r0, r1)     // Catch: java.lang.Throwable -> L41
            java.lang.String r9 = r0.getAbsolutePath()     // Catch: java.lang.Throwable -> L41
            goto L20
        L41:
            r0 = move-exception
            com.tencent.bugly.crashreport.common.info.a r0 = com.tencent.bugly.crashreport.common.info.a.a(r4)
            java.lang.String r0 = r0.c
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "/data/data/"
            r1.<init>(r2)
            java.lang.StringBuilder r0 = r1.append(r0)
            java.lang.String r1 = "/app_bugly"
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r9 = r0.toString()
            goto L20
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler.<init>(android.content.Context, com.tencent.bugly.crashreport.common.info.a, com.tencent.bugly.crashreport.crash.b, com.tencent.bugly.proguard.v, boolean, java.lang.String):void");
    }

    public static synchronized NativeCrashHandler getInstance(Context context, com.tencent.bugly.crashreport.common.info.a aVar, com.tencent.bugly.crashreport.crash.b bVar, com.tencent.bugly.crashreport.common.strategy.a aVar2, v vVar, boolean z, String str) {
        if (a == null) {
            a = new NativeCrashHandler(context, aVar, bVar, vVar, z, str);
        }
        return a;
    }

    public static synchronized NativeCrashHandler getInstance() {
        return a;
    }

    public synchronized String getDumpFilePath() {
        return this.f;
    }

    public synchronized void setDumpFilePath(String str) {
        this.f = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00be A[Catch: all -> 0x00c6, TRY_LEAVE, TryCatch #1 {, blocks: (B:4:0x0004, B:6:0x0008, B:9:0x0012, B:11:0x0029, B:13:0x0032, B:15:0x0067, B:16:0x007a, B:18:0x0084, B:19:0x0087, B:21:0x0091, B:22:0x0094, B:24:0x0098, B:25:0x00a0, B:27:0x00a4, B:28:0x00ac, B:41:0x00ec, B:40:0x00e3, B:37:0x00c9, B:39:0x00cf, B:32:0x00be, B:43:0x00f5, B:45:0x00f9, B:47:0x0147, B:49:0x0188, B:52:0x01b1, B:31:0x00b6), top: B:61:0x0004, inners: #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void a(boolean r10) {
        /*
            Method dump skipped, instructions count: 469
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler.a(boolean):void");
    }

    public synchronized void startNativeMonitor() {
        synchronized (this) {
            if (this.i || this.h) {
                a(this.g);
            } else {
                String str = this.c.k;
                if (!(str == null || str.trim().length() <= 0)) {
                    String str2 = this.c.k;
                }
                String str3 = this.c.k;
                String str4 = str3 == null || str3.trim().length() <= 0 ? "Bugly" : this.c.k;
                String str5 = this.c.k;
                this.i = a(str4, str5 == null || str5.trim().length() <= 0 ? false : true);
                if (this.i || this.h) {
                    a(this.g);
                    this.d.b(new Runnable() { // from class: com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler.1
                        @Override // java.lang.Runnable
                        public final void run() throws Throwable {
                            if (com.tencent.bugly.proguard.a.a(NativeCrashHandler.this.b, "native_record_lock", 10000L)) {
                                NativeCrashHandler.this.setNativeAppVersion(NativeCrashHandler.this.c.i);
                                NativeCrashHandler.this.setNativeUserId(NativeCrashHandler.this.c.f());
                                CrashDetailBean crashDetailBeanA = b.a(NativeCrashHandler.this.b, NativeCrashHandler.this.f, NativeCrashHandler.this.e);
                                if (crashDetailBeanA != null) {
                                    if (!NativeCrashHandler.this.n.a(crashDetailBeanA)) {
                                        NativeCrashHandler.this.n.a(crashDetailBeanA, 3000L, false);
                                    }
                                    b.b(NativeCrashHandler.this.f);
                                    w.a("get crash from native record!", new Object[0]);
                                }
                                NativeCrashHandler.this.a();
                                com.tencent.bugly.proguard.a.b(NativeCrashHandler.this.b, "native_record_lock");
                                return;
                            }
                            w.a("Failed to lock file for handling native crash record.", new Object[0]);
                        }
                    });
                }
            }
        }
    }

    private static boolean a(String str, boolean z) {
        boolean z2;
        try {
            w.a("[native] trying to load so: %s", str);
            if (z) {
                System.load(str);
            } else {
                System.loadLibrary(str);
            }
        } catch (Throwable th) {
            th = th;
            z2 = false;
        }
        try {
            w.a("[native] load so success: %s", str);
            return true;
        } catch (Throwable th2) {
            th = th2;
            z2 = true;
            w.d(th.getMessage(), new Object[0]);
            w.d("[native] Failed to load so, please check.", str);
            return z2;
        }
    }

    private synchronized void b() {
        if (!this.j) {
            w.d("native already unregisted!", new Object[0]);
        } else {
            try {
            } catch (Throwable th) {
                w.c("unregist bugly so fail", new Object[0]);
            }
            if (unregist() != null) {
                w.a("Native Crash Report close!", new Object[0]);
                this.j = false;
            } else {
                w.c("unregist bugly so success", new Object[0]);
                try {
                    com.tencent.bugly.proguard.a.a("com.tencent.feedback.eup.jni.NativeExceptionUpload", "enableHandler", null, new Class[]{Boolean.TYPE}, new Object[]{false});
                    this.j = false;
                    w.c("unregist rqd so success", new Object[0]);
                } catch (Throwable th2) {
                    w.c("unregist rqd so fail", new Object[0]);
                    this.i = false;
                    this.h = false;
                }
            }
        }
    }

    public void testNativeCrash() {
        if (!this.i) {
            w.d("libBugly.so has not been load! so fail!", new Object[0]);
        } else {
            testCrash();
        }
    }

    public NativeExceptionHandler getNativeExceptionHandler() {
        return this.e;
    }

    protected final void a() {
        File[] fileArrListFiles;
        int iIndexOf;
        long jC = com.tencent.bugly.proguard.a.c() - c.f;
        File file = new File(this.f);
        if (file.exists() && file.isDirectory() && (fileArrListFiles = file.listFiles()) != null && fileArrListFiles.length != 0) {
            int length = "tomb_".length();
            int i = 0;
            for (File file2 : fileArrListFiles) {
                String name = file2.getName();
                if (name.startsWith("tomb_")) {
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

    private synchronized void b(boolean z) {
        if (z) {
            startNativeMonitor();
        } else {
            b();
        }
    }

    public synchronized boolean isUserOpened() {
        return this.k;
    }

    private synchronized void c(boolean z) {
        if (this.k != z) {
            w.a("user change native %b", Boolean.valueOf(z));
            this.k = z;
        }
    }

    public void setUserOpened(boolean z) {
        c(z);
        boolean z2 = com.tencent.bugly.crashreport.common.strategy.a.a().c().d && isUserOpened();
        if (z2 != this.j) {
            w.a("native changed to %b", Boolean.valueOf(z2));
            b(z2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0030 A[Catch: all -> 0x0046, TRY_LEAVE, TryCatch #0 {, blocks: (B:5:0x0005, B:7:0x000b, B:8:0x001c, B:10:0x0028, B:12:0x002c, B:14:0x0030), top: B:21:0x0005 }] */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void onStrategyChanged(com.tencent.bugly.crashreport.common.strategy.StrategyBean r7) {
        /*
            r6 = this;
            r0 = 1
            r1 = 0
            monitor-enter(r6)
            if (r7 == 0) goto L1c
            boolean r2 = r7.d     // Catch: java.lang.Throwable -> L46
            boolean r3 = r6.j     // Catch: java.lang.Throwable -> L46
            if (r2 == r3) goto L1c
            java.lang.String r2 = "server native changed to %b"
            r3 = 1
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L46
            r4 = 0
            boolean r5 = r7.d     // Catch: java.lang.Throwable -> L46
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r5)     // Catch: java.lang.Throwable -> L46
            r3[r4] = r5     // Catch: java.lang.Throwable -> L46
            com.tencent.bugly.proguard.w.d(r2, r3)     // Catch: java.lang.Throwable -> L46
        L1c:
            com.tencent.bugly.crashreport.common.strategy.a r2 = com.tencent.bugly.crashreport.common.strategy.a.a()     // Catch: java.lang.Throwable -> L46
            com.tencent.bugly.crashreport.common.strategy.StrategyBean r2 = r2.c()     // Catch: java.lang.Throwable -> L46
            boolean r2 = r2.d     // Catch: java.lang.Throwable -> L46
            if (r2 == 0) goto L44
            boolean r2 = r6.k     // Catch: java.lang.Throwable -> L46
            if (r2 == 0) goto L44
        L2c:
            boolean r1 = r6.j     // Catch: java.lang.Throwable -> L46
            if (r0 == r1) goto L42
            java.lang.String r1 = "native changed to %b"
            r2 = 1
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.Throwable -> L46
            r3 = 0
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r0)     // Catch: java.lang.Throwable -> L46
            r2[r3] = r4     // Catch: java.lang.Throwable -> L46
            com.tencent.bugly.proguard.w.a(r1, r2)     // Catch: java.lang.Throwable -> L46
            r6.b(r0)     // Catch: java.lang.Throwable -> L46
        L42:
            monitor-exit(r6)
            return
        L44:
            r0 = r1
            goto L2c
        L46:
            r0 = move-exception
            monitor-exit(r6)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler.onStrategyChanged(com.tencent.bugly.crashreport.common.strategy.StrategyBean):void");
    }

    public boolean appendLogToNative(String str, String str2, String str3) {
        if (!this.i || !l || str == null || str2 == null || str3 == null) {
            return false;
        }
        try {
            return appendNativeLog(str, str2, str3);
        } catch (UnsatisfiedLinkError e) {
            l = false;
            return false;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    public boolean putKeyValueToNative(String str, String str2) {
        if (!this.i || !l || str == null || str2 == null) {
            return false;
        }
        try {
            return putNativeKeyValue(str, str2);
        } catch (UnsatisfiedLinkError e) {
            l = false;
            return false;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    private boolean a(int i, String str) {
        if (!this.i || !m) {
            return false;
        }
        try {
            setNativeInfo(i, str);
            return true;
        } catch (UnsatisfiedLinkError e) {
            m = false;
            return false;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    public boolean setNativeAppVersion(String str) {
        return a(10, str);
    }

    public boolean setNativeUserId(String str) {
        return a(11, str);
    }
}
