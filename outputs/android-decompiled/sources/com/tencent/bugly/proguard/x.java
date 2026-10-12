package com.tencent.bugly.proguard;

import android.content.Context;
import android.os.Process;
import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class x {
    private static SimpleDateFormat b;
    private static StringBuilder d;
    private static StringBuilder e;
    private static a f;
    private static String g;
    private static String h;
    private static Context i;
    private static String j;
    private static boolean k;
    private static int l;
    private static Method o;
    public static boolean a = true;
    private static int c = 5120;
    private static Object m = new Object();
    private static Object n = null;

    static {
        b = null;
        o = null;
        try {
            b = new SimpleDateFormat("MM-dd HH:mm:ss");
            o = Class.forName("com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler").getDeclaredMethod("appendLogToNative", String.class, String.class, String.class);
        } catch (Throwable th) {
        }
    }

    private static boolean b(String str, String str2, String str3) throws NoSuchMethodException, SecurityException {
        if (o == null) {
            return false;
        }
        if (n == null) {
            Object objA = com.tencent.bugly.proguard.a.a("com.tencent.bugly.crashreport.crash.jni.NativeCrashHandler", "getInstance", null, null, null);
            n = objA;
            if (objA == null) {
                return false;
            }
        }
        try {
            return ((Boolean) o.invoke(n, str, str2, str3)).booleanValue();
        } catch (Throwable th) {
            Log.w(w.a, th.getMessage());
            return false;
        }
    }

    public static synchronized void a(Context context) {
        if (!k && context != null && a) {
            try {
                e = new StringBuilder(0);
                d = new StringBuilder(0);
                i = context;
                com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a(context);
                g = aVarA.d;
                aVarA.getClass();
                h = "";
                j = i.getFilesDir().getPath() + "/buglylog_" + g + "_" + h + ".txt";
                l = Process.myPid();
            } catch (Throwable th) {
            }
            k = true;
        }
    }

    public static void a(int i2) {
        synchronized (m) {
            c = i2;
            if (i2 < 0) {
                c = 0;
            } else if (i2 > 10240) {
                c = 10240;
            }
        }
    }

    public static void a(String str, String str2, Throwable th) {
        String string;
        if (th != null) {
            String message = th.getMessage();
            if (message == null) {
                message = "";
            }
            StringBuilder sbAppend = new StringBuilder().append(message).append('\n');
            if (th == null) {
                string = "";
            } else {
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                th.printStackTrace(printWriter);
                printWriter.flush();
                string = stringWriter.toString();
            }
            a(str, str2, sbAppend.append(string).toString());
        }
    }

    public static synchronized void a(String str, String str2, String str3) {
        if (k && a) {
            b(str, str2, str3);
            int iMyTid = Process.myTid();
            d.setLength(0);
            if (str3.length() > 30720) {
                str3 = str3.substring(str3.length() - 30720, str3.length() - 1);
            }
            Date date = new Date();
            d.append(b != null ? b.format(date) : date.toString()).append(" ").append(l).append(" ").append(iMyTid).append(" ").append(str).append(" ").append(str2).append(": ").append(str3).append("\u0001\r\n");
            final String string = d.toString();
            synchronized (m) {
                e.append(string);
            }
            if (e.length() > c) {
                v.a().a(new Runnable() { // from class: com.tencent.bugly.proguard.x.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        synchronized (x.m) {
                            if (x.e.length() > x.c) {
                                if (x.f == null) {
                                    a unused = x.f = new a(x.j);
                                } else if (x.f.b.length() + x.e.length() > x.f.e) {
                                    x.f.a();
                                }
                                if (x.f.a) {
                                    x.f.a(x.e.toString());
                                    x.e.setLength(0);
                                } else {
                                    x.e.setLength(0);
                                    x.e.append(string);
                                }
                            }
                        }
                    }
                });
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static byte[] a(boolean r4) {
        /*
            r0 = 0
            boolean r1 = com.tencent.bugly.proguard.x.a
            if (r1 != 0) goto L6
        L5:
            return r0
        L6:
            java.lang.Object r2 = com.tencent.bugly.proguard.x.m
            monitor-enter(r2)
            if (r4 == 0) goto L2c
            com.tencent.bugly.proguard.x$a r1 = com.tencent.bugly.proguard.x.f     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            if (r1 == 0) goto L2c
            com.tencent.bugly.proguard.x$a r1 = com.tencent.bugly.proguard.x.f     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            boolean r1 = com.tencent.bugly.proguard.x.a.d(r1)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            if (r1 == 0) goto L2c
            com.tencent.bugly.proguard.x$a r1 = com.tencent.bugly.proguard.x.f     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            java.io.File r1 = com.tencent.bugly.proguard.x.a.a(r1)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
        L1d:
            java.lang.StringBuilder r3 = com.tencent.bugly.proguard.x.e     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            int r3 = r3.length()     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            if (r3 != 0) goto L2e
            if (r1 != 0) goto L2e
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L29
            goto L5
        L29:
            r0 = move-exception
            monitor-exit(r2)
            throw r0
        L2c:
            r1 = r0
            goto L1d
        L2e:
            java.lang.StringBuilder r3 = com.tencent.bugly.proguard.x.e     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            byte[] r0 = com.tencent.bugly.proguard.a.a(r1, r3)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L3a
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L29
            goto L5
        L3a:
            r1 = move-exception
            monitor-exit(r2)
            goto L5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.x.a(boolean):byte[]");
    }

    /* compiled from: BUGLY */
    public static class a {
        private boolean a;
        private File b;
        private String c;
        private long d;
        private long e = 30720;

        public a(String str) {
            if (str != null && !str.equals("")) {
                this.c = str;
                this.a = a();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x001e, code lost:
        
            r0 = true;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public synchronized boolean a() {
            /*
                r3 = this;
                r0 = 0
                monitor-enter(r3)
                java.io.File r1 = new java.io.File     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                java.lang.String r2 = r3.c     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                r1.<init>(r2)     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                r3.b = r1     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                java.io.File r1 = r3.b     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                boolean r1 = r1.exists()     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                if (r1 == 0) goto L20
                java.io.File r1 = r3.b     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                boolean r1 = r1.delete()     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                if (r1 != 0) goto L20
                r1 = 0
                r3.a = r1     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
            L1e:
                monitor-exit(r3)
                return r0
            L20:
                java.io.File r1 = r3.b     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                boolean r1 = r1.createNewFile()     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                if (r1 != 0) goto L30
                r1 = 0
                r3.a = r1     // Catch: java.lang.Throwable -> L2c java.lang.Throwable -> L32
                goto L1e
            L2c:
                r0 = move-exception
                r0 = 0
                r3.a = r0     // Catch: java.lang.Throwable -> L32
            L30:
                r0 = 1
                goto L1e
            L32:
                r0 = move-exception
                monitor-exit(r3)
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.x.a.a():boolean");
        }

        public final synchronized boolean a(String str) {
            boolean z = false;
            synchronized (this) {
                if (this.a) {
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(this.b, true);
                        fileOutputStream.write(str.getBytes("UTF-8"));
                        fileOutputStream.flush();
                        fileOutputStream.close();
                        this.d = r3.length + this.d;
                        z = true;
                    } catch (Throwable th) {
                        this.a = false;
                    }
                }
            }
            return z;
        }
    }
}
