package com.tencent.bugly.crashreport.crash;

import android.content.Context;
import android.os.Process;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import com.tencent.bugly.proguard.w;
import com.tencent.bugly.proguard.x;
import java.lang.Thread;
import java.util.HashMap;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class e implements Thread.UncaughtExceptionHandler {
    private static Thread.UncaughtExceptionHandler f;
    private static boolean h;
    private static final Object i = new Object();
    private static int j;
    private Context a;
    private b b;
    private com.tencent.bugly.crashreport.common.strategy.a c;
    private com.tencent.bugly.crashreport.common.info.a d;
    private Thread.UncaughtExceptionHandler e;
    private boolean g = false;

    public e(Context context, b bVar, com.tencent.bugly.crashreport.common.strategy.a aVar, com.tencent.bugly.crashreport.common.info.a aVar2) {
        this.a = context;
        this.b = bVar;
        this.c = aVar;
        this.d = aVar2;
    }

    public final synchronized void a() {
        if (j >= 10) {
            w.a("java crash handler over %d, no need set.", 10);
        } else {
            Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            if (defaultUncaughtExceptionHandler != null && !getClass().getName().equals(defaultUncaughtExceptionHandler.getClass().getName())) {
                if ("com.android.internal.os.RuntimeInit$UncaughtHandler".equals(defaultUncaughtExceptionHandler.getClass().getName())) {
                    w.a("backup system java handler: %s", defaultUncaughtExceptionHandler.toString());
                    f = defaultUncaughtExceptionHandler;
                    this.e = defaultUncaughtExceptionHandler;
                } else {
                    w.a("backup java handler: %s", defaultUncaughtExceptionHandler.toString());
                    this.e = defaultUncaughtExceptionHandler;
                }
                a(defaultUncaughtExceptionHandler);
                Thread.setDefaultUncaughtExceptionHandler(this);
                this.g = true;
                j++;
                w.a("registered java monitor: %s", toString());
            }
        }
    }

    public final synchronized void b() {
        this.g = false;
        w.a("close java monitor!", new Object[0]);
        if (Thread.getDefaultUncaughtExceptionHandler().getClass().getName().contains("bugly")) {
            w.a("Java monitor to unregister: %s", toString());
            Thread.setDefaultUncaughtExceptionHandler(this.e);
            j--;
        }
    }

    private synchronized void a(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.e = uncaughtExceptionHandler;
    }

    private CrashDetailBean b(Thread thread, Throwable th, boolean z, String str, byte[] bArr) {
        String strA;
        boolean zN = c.a().n();
        String str2 = (zN && z) ? " This Crash Caused By ANR , PLS To Fix ANR , This Trace May Be Not Useful![Bugly]" : "";
        if (zN && z) {
            w.e("This Crash Caused By ANR , PLS To Fix ANR , This Trace May Be Not Useful!", new Object[0]);
        }
        CrashDetailBean crashDetailBean = new CrashDetailBean();
        w.e("3", new Object[0]);
        crashDetailBean.B = com.tencent.bugly.crashreport.common.info.b.h();
        crashDetailBean.C = com.tencent.bugly.crashreport.common.info.b.f();
        crashDetailBean.D = com.tencent.bugly.crashreport.common.info.b.j();
        crashDetailBean.E = this.d.o();
        crashDetailBean.F = this.d.n();
        crashDetailBean.G = this.d.p();
        crashDetailBean.w = com.tencent.bugly.proguard.a.a(this.a, c.d, (String) null);
        crashDetailBean.x = x.a(z);
        Object[] objArr = new Object[1];
        objArr[0] = Integer.valueOf(crashDetailBean.x == null ? 0 : crashDetailBean.x.length);
        w.a("user log size:%d", objArr);
        crashDetailBean.b = z ? 0 : 2;
        crashDetailBean.e = this.d.g();
        crashDetailBean.f = this.d.i;
        crashDetailBean.g = this.d.v();
        crashDetailBean.m = this.d.f();
        if (th == null) {
            return null;
        }
        Throwable cause = th;
        while (cause.getCause() != null) {
            cause = cause.getCause();
        }
        String name = th.getClass().getName();
        String strB = b(th, 1000);
        if (strB == null) {
            strB = "";
        }
        Object[] objArr2 = new Object[2];
        objArr2[0] = Integer.valueOf(th.getStackTrace().length);
        objArr2[1] = Boolean.valueOf(th.getCause() != null);
        w.e("stack frame :%d, has cause %b", objArr2);
        String string = "";
        if (th.getStackTrace().length > 0) {
            string = th.getStackTrace()[0].toString();
        }
        if (cause != th) {
            crashDetailBean.n = cause.getClass().getName();
            crashDetailBean.o = b(cause, 1000);
            if (crashDetailBean.o == null) {
                crashDetailBean.o = "";
            }
            crashDetailBean.p = cause.getStackTrace()[0].toString();
            StringBuilder sb = new StringBuilder();
            sb.append(name).append(":").append(strB).append("\n");
            sb.append(string);
            sb.append("\n......");
            sb.append("\nCaused by:\n");
            sb.append(crashDetailBean.n).append(":").append(crashDetailBean.o).append("\n");
            strA = a(cause, c.e);
            sb.append(strA);
            crashDetailBean.q = sb.toString();
        } else {
            crashDetailBean.n = name;
            crashDetailBean.o = strB + str2;
            if (crashDetailBean.o == null) {
                crashDetailBean.o = "";
            }
            crashDetailBean.p = string;
            strA = a(th, c.e);
            crashDetailBean.q = strA;
        }
        crashDetailBean.r = System.currentTimeMillis();
        crashDetailBean.u = com.tencent.bugly.proguard.a.c(crashDetailBean.q.getBytes());
        try {
            crashDetailBean.y = com.tencent.bugly.proguard.a.a(c.e, false);
            crashDetailBean.z = this.d.d;
            crashDetailBean.A = thread.getName() + "(" + thread.getId() + ")";
            crashDetailBean.y.put(crashDetailBean.A, strA);
            crashDetailBean.H = this.d.x();
            crashDetailBean.h = this.d.u();
            crashDetailBean.i = this.d.G();
            crashDetailBean.L = this.d.a;
            crashDetailBean.M = this.d.n;
            crashDetailBean.O = this.d.D();
            crashDetailBean.P = this.d.E();
            crashDetailBean.Q = this.d.y();
            crashDetailBean.R = this.d.C();
        } catch (Throwable th2) {
            w.e("handle crash error %s", th2.toString());
        }
        if (z) {
            this.b.b(crashDetailBean);
        } else {
            boolean z2 = str != null && str.length() > 0;
            boolean z3 = bArr != null && bArr.length > 0;
            if (z2) {
                crashDetailBean.N = new HashMap(1);
                crashDetailBean.N.put("UserData", str);
            }
            if (z3) {
                crashDetailBean.S = bArr;
            }
        }
        return crashDetailBean;
    }

    private static boolean c() {
        boolean z;
        synchronized (i) {
            z = h;
            h = true;
        }
        return z;
    }

    public final void a(Thread thread, Throwable th, boolean z, String str, byte[] bArr) {
        if (z) {
            w.e("Java Crash Happen cause by %s(%d)", thread.getName(), Long.valueOf(thread.getId()));
            if (c()) {
                w.a("this class has handled this exception", new Object[0]);
                if (f != null) {
                    w.a("call system handler", new Object[0]);
                    f.uncaughtException(thread, th);
                } else {
                    w.e("current process die", new Object[0]);
                    Process.killProcess(Process.myPid());
                    System.exit(1);
                }
            }
        } else {
            w.e("Java Catch Happen", new Object[0]);
        }
        try {
            try {
                if (!this.g) {
                    w.c("Java crash handler is disable. Just return.", new Object[0]);
                    if (!z) {
                        w.e("not to shut down return", new Object[0]);
                        return;
                    }
                    if (this.e != null && b(this.e)) {
                        w.e("sys default last handle start!", new Object[0]);
                        this.e.uncaughtException(thread, th);
                        w.e("sys default last handle end!", new Object[0]);
                        return;
                    } else if (f != null) {
                        w.e("system handle start!", new Object[0]);
                        f.uncaughtException(thread, th);
                        w.e("system handle end!", new Object[0]);
                        return;
                    } else {
                        w.e("crashreport last handle start!", new Object[0]);
                        w.e("current process die", new Object[0]);
                        Process.killProcess(Process.myPid());
                        System.exit(1);
                        w.e("crashreport last handle end!", new Object[0]);
                        return;
                    }
                }
                if (!this.c.b()) {
                    w.e("waiting for remote sync", new Object[0]);
                    int i2 = 0;
                    while (!this.c.b()) {
                        try {
                            Thread.sleep(500L);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        i2 += 500;
                        if (i2 >= 3000) {
                            break;
                        }
                    }
                }
                if (!this.c.b()) {
                    w.d("no remote but still store!", new Object[0]);
                }
                if (!this.c.c().d && this.c.b()) {
                    w.e("crash report was closed by remote , will not upload to Bugly , print local for helpful!", new Object[0]);
                    b.a(z ? "JAVA_CRASH" : "JAVA_CATCH", com.tencent.bugly.proguard.a.b(), this.d.d, thread, com.tencent.bugly.proguard.a.a(th), null);
                    if (!z) {
                        w.e("not to shut down return", new Object[0]);
                        return;
                    }
                    if (this.e != null && b(this.e)) {
                        w.e("sys default last handle start!", new Object[0]);
                        this.e.uncaughtException(thread, th);
                        w.e("sys default last handle end!", new Object[0]);
                        return;
                    } else if (f != null) {
                        w.e("system handle start!", new Object[0]);
                        f.uncaughtException(thread, th);
                        w.e("system handle end!", new Object[0]);
                        return;
                    } else {
                        w.e("crashreport last handle start!", new Object[0]);
                        w.e("current process die", new Object[0]);
                        Process.killProcess(Process.myPid());
                        System.exit(1);
                        w.e("crashreport last handle end!", new Object[0]);
                        return;
                    }
                }
                CrashDetailBean crashDetailBeanB = b(thread, th, z, str, bArr);
                if (crashDetailBeanB == null) {
                    w.e("pkg crash datas fail!", new Object[0]);
                    if (!z) {
                        w.e("not to shut down return", new Object[0]);
                        return;
                    }
                    if (this.e != null && b(this.e)) {
                        w.e("sys default last handle start!", new Object[0]);
                        this.e.uncaughtException(thread, th);
                        w.e("sys default last handle end!", new Object[0]);
                        return;
                    } else if (f != null) {
                        w.e("system handle start!", new Object[0]);
                        f.uncaughtException(thread, th);
                        w.e("system handle end!", new Object[0]);
                        return;
                    } else {
                        w.e("crashreport last handle start!", new Object[0]);
                        w.e("current process die", new Object[0]);
                        Process.killProcess(Process.myPid());
                        System.exit(1);
                        w.e("crashreport last handle end!", new Object[0]);
                        return;
                    }
                }
                b.a(z ? "JAVA_CRASH" : "JAVA_CATCH", com.tencent.bugly.proguard.a.b(), this.d.d, thread, com.tencent.bugly.proguard.a.a(th), crashDetailBeanB);
                if (!this.b.a(crashDetailBeanB)) {
                    this.b.a(crashDetailBeanB, 3000L, z);
                }
                if (!z) {
                    w.e("not to shut down return", new Object[0]);
                    return;
                }
                if (this.e != null && b(this.e)) {
                    w.e("sys default last handle start!", new Object[0]);
                    this.e.uncaughtException(thread, th);
                    w.e("sys default last handle end!", new Object[0]);
                } else if (f != null) {
                    w.e("system handle start!", new Object[0]);
                    f.uncaughtException(thread, th);
                    w.e("system handle end!", new Object[0]);
                } else {
                    w.e("crashreport last handle start!", new Object[0]);
                    w.e("current process die", new Object[0]);
                    Process.killProcess(Process.myPid());
                    System.exit(1);
                    w.e("crashreport last handle end!", new Object[0]);
                }
            } catch (Throwable th2) {
                if (!z) {
                    w.e("not to shut down return", new Object[0]);
                    return;
                }
                if (this.e != null && b(this.e)) {
                    w.e("sys default last handle start!", new Object[0]);
                    this.e.uncaughtException(thread, th);
                    w.e("sys default last handle end!", new Object[0]);
                } else if (f != null) {
                    w.e("system handle start!", new Object[0]);
                    f.uncaughtException(thread, th);
                    w.e("system handle end!", new Object[0]);
                } else {
                    w.e("crashreport last handle start!", new Object[0]);
                    w.e("current process die", new Object[0]);
                    Process.killProcess(Process.myPid());
                    System.exit(1);
                    w.e("crashreport last handle end!", new Object[0]);
                }
                throw th2;
            }
        } catch (Throwable th3) {
            if (!w.a(th3)) {
                th3.printStackTrace();
            }
            if (!z) {
                w.e("not to shut down return", new Object[0]);
                return;
            }
            if (this.e != null && b(this.e)) {
                w.e("sys default last handle start!", new Object[0]);
                this.e.uncaughtException(thread, th);
                w.e("sys default last handle end!", new Object[0]);
            } else if (f != null) {
                w.e("system handle start!", new Object[0]);
                f.uncaughtException(thread, th);
                w.e("system handle end!", new Object[0]);
            } else {
                w.e("crashreport last handle start!", new Object[0]);
                w.e("current process die", new Object[0]);
                Process.killProcess(Process.myPid());
                System.exit(1);
                w.e("crashreport last handle end!", new Object[0]);
            }
        }
    }

    private static boolean b(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        if (uncaughtExceptionHandler == null) {
            return true;
        }
        String name = uncaughtExceptionHandler.getClass().getName();
        for (StackTraceElement stackTraceElement : Thread.currentThread().getStackTrace()) {
            String className = stackTraceElement.getClassName();
            String methodName = stackTraceElement.getMethodName();
            if (name.equals(className) && "uncaughtException".equals(methodName)) {
                return false;
            }
        }
        return true;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th) {
        a(thread, th, true, null, null);
    }

    public final synchronized void a(StrategyBean strategyBean) {
        if (strategyBean != null) {
            if (strategyBean.d != this.g) {
                w.a("java changed to %b", Boolean.valueOf(strategyBean.d));
                if (strategyBean.d) {
                    a();
                } else {
                    b();
                }
            }
        }
    }

    private static String a(Throwable th, int i2) {
        if (th == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        try {
            if (th.getStackTrace() != null) {
                for (StackTraceElement stackTraceElement : th.getStackTrace()) {
                    if (i2 > 0 && sb.length() >= i2) {
                        sb.append("\n[Stack over limit size :" + i2 + " , has been cutted !]");
                        return sb.toString();
                    }
                    sb.append(stackTraceElement.toString()).append("\n");
                }
            }
        } catch (Throwable th2) {
            w.e("gen stack error %s", th2.toString());
        }
        return sb.toString();
    }

    private static String b(Throwable th, int i2) {
        if (th.getMessage() == null) {
            return "";
        }
        if (th.getMessage().length() <= 1000) {
            return th.getMessage();
        }
        return th.getMessage().substring(0, 1000) + "\n[Message over limit size:1000, has been cutted!]";
    }
}
