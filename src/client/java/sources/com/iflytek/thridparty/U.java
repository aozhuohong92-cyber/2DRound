package com.iflytek.thridparty;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import java.io.File;
import java.io.IOException;
import org.apache.commons.httpclient.cookie.CookieSpec;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class U {
    private static String a = "";

    public static String a(Context context) {
        if (!TextUtils.isEmpty(a)) {
            return a;
        }
        String absolutePath = context.getFilesDir().getAbsolutePath();
        if (!absolutePath.endsWith(CookieSpec.PATH_DELIM)) {
            absolutePath = absolutePath + CookieSpec.PATH_DELIM;
        }
        String str = absolutePath + "msclib/";
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
        a = str;
        return a;
    }

    public static String a(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            str = System.currentTimeMillis() + "";
        }
        String absolutePath = "mounted".equals(Environment.getExternalStorageState()) ? Environment.getExternalStorageDirectory().getAbsolutePath() : context.getFilesDir().getAbsolutePath();
        if (!absolutePath.endsWith(CookieSpec.PATH_DELIM)) {
            absolutePath = absolutePath + CookieSpec.PATH_DELIM;
        }
        String str2 = (absolutePath + "msc/") + "res/";
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        String str3 = str2 + str;
        return !str3.endsWith(".jet") ? str3 + ".jet" : str3;
    }

    public static void a(String str) {
        File file = new File(str);
        if (file.exists()) {
            file.delete();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0051 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean a(android.os.MemoryFile r9, long r10, java.lang.String r12) throws java.lang.Throwable {
        /*
            r6 = 1024(0x400, double:5.06E-321)
            r0 = 0
            if (r9 == 0) goto Lb
            boolean r1 = android.text.TextUtils.isEmpty(r12)
            if (r1 == 0) goto Lc
        Lb:
            return r0
        Lc:
            r3 = 0
            a(r12)     // Catch: java.lang.Exception -> L42 java.lang.Throwable -> L4d
            b(r12)     // Catch: java.lang.Exception -> L42 java.lang.Throwable -> L4d
            java.io.FileOutputStream r2 = new java.io.FileOutputStream     // Catch: java.lang.Exception -> L42 java.lang.Throwable -> L4d
            r2.<init>(r12)     // Catch: java.lang.Exception -> L42 java.lang.Throwable -> L4d
            r1 = 1024(0x400, float:1.435E-42)
            byte[] r3 = new byte[r1]     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            r1 = r0
        L1d:
            long r4 = (long) r1     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            int r4 = (r4 > r10 ? 1 : (r4 == r10 ? 0 : -1))
            if (r4 >= 0) goto L39
            long r4 = (long) r1     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            long r4 = r10 - r4
            int r4 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r4 <= 0) goto L35
            r4 = r6
        L2a:
            int r4 = (int) r4     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            r5 = 0
            r9.readBytes(r3, r1, r5, r4)     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            r5 = 0
            r2.write(r3, r5, r4)     // Catch: java.lang.Throwable -> L57 java.lang.Exception -> L59
            int r1 = r1 + r4
            goto L1d
        L35:
            long r4 = (long) r1
            long r4 = r10 - r4
            goto L2a
        L39:
            r0 = 1
            if (r2 == 0) goto Lb
            r2.close()     // Catch: java.lang.Exception -> L40
            goto Lb
        L40:
            r1 = move-exception
            goto Lb
        L42:
            r1 = move-exception
            r2 = r3
        L44:
            com.iflytek.thridparty.C0020ai.a(r1)     // Catch: java.lang.Throwable -> L57
            if (r2 == 0) goto Lb
            r2.close()     // Catch: java.lang.Exception -> L40
            goto Lb
        L4d:
            r0 = move-exception
            r2 = r3
        L4f:
            if (r2 == 0) goto L54
            r2.close()     // Catch: java.lang.Exception -> L55
        L54:
            throw r0
        L55:
            r1 = move-exception
            goto L54
        L57:
            r0 = move-exception
            goto L4f
        L59:
            r1 = move-exception
            goto L44
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.U.a(android.os.MemoryFile, long, java.lang.String):boolean");
    }

    public static boolean a(String str, int i) {
        try {
            new com.iflytek.cloud.record.f(new File(str), i).b();
            return true;
        } catch (IOException e) {
            C0020ai.a(e);
            return false;
        }
    }

    public static boolean a(String str, String str2) {
        if (str.equals(R.a(new File(str2)))) {
            return true;
        }
        a(str2);
        return false;
    }

    public static boolean a(String str, String str2, int i) {
        if (TextUtils.isEmpty(str) || "pcm".equals(str)) {
            return true;
        }
        if ("wav".equals(str)) {
            return a(str2, i);
        }
        C0020ai.b("format not supported");
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x003d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean a(java.util.concurrent.ConcurrentLinkedQueue<byte[]> r5, java.lang.String r6) throws java.lang.Throwable {
        /*
            r3 = 0
            r1 = 0
            b(r6)     // Catch: java.lang.Throwable -> L39 java.lang.Exception -> L4d
            java.io.FileOutputStream r2 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L39 java.lang.Exception -> L4d
            r2.<init>(r6)     // Catch: java.lang.Throwable -> L39 java.lang.Exception -> L4d
            java.util.Iterator r4 = r5.iterator()     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
        Le:
            boolean r0 = r4.hasNext()     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
            if (r0 == 0) goto L29
            java.lang.Object r0 = r4.next()     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
            byte[] r0 = (byte[]) r0     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
            r2.write(r0)     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
            goto Le
        L1e:
            r0 = move-exception
        L1f:
            com.iflytek.thridparty.C0020ai.a(r0)     // Catch: java.lang.Throwable -> L4b
            if (r2 == 0) goto L27
            r2.close()     // Catch: java.lang.Exception -> L46
        L27:
            r0 = r1
        L28:
            return r0
        L29:
            r2.close()     // Catch: java.lang.Exception -> L1e java.lang.Throwable -> L4b
            r1 = 0
            r0 = 1
            if (r3 == 0) goto L28
            r1.close()     // Catch: java.lang.Exception -> L34
            goto L28
        L34:
            r1 = move-exception
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L28
        L39:
            r0 = move-exception
            r2 = r3
        L3b:
            if (r2 == 0) goto L40
            r2.close()     // Catch: java.lang.Exception -> L41
        L40:
            throw r0
        L41:
            r1 = move-exception
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L40
        L46:
            r0 = move-exception
            com.iflytek.thridparty.C0020ai.a(r0)
            goto L27
        L4b:
            r0 = move-exception
            goto L3b
        L4d:
            r0 = move-exception
            r2 = r3
            goto L1f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.U.a(java.util.concurrent.ConcurrentLinkedQueue, java.lang.String):boolean");
    }

    public static void b(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        File file = new File(str);
        if (!str.endsWith(CookieSpec.PATH_DELIM)) {
            file = file.getParentFile();
        }
        if (file.exists()) {
            return;
        }
        file.mkdirs();
    }
}
