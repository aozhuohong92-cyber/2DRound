package com.iflytek.thridparty;

import android.text.TextUtils;
import com.iflytek.cloud.SpeechError;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import org.apache.http.util.ByteArrayBuffer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class X extends Thread {
    private String f;
    private int a = 20000;
    private a b = null;
    private volatile boolean c = false;
    private URL d = null;
    private ArrayList<byte[]> e = new ArrayList<>();
    private Object g = null;
    private int h = 0;

    public interface a {
        void a(SpeechError speechError);

        void a(X x, byte[] bArr);
    }

    public static URL a(String str, String str2) throws MalformedURLException {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            if (!str.endsWith("?")) {
                str = str + "?";
            }
            str = str + str2;
        }
        return new URL(str);
    }

    private void a(SpeechError speechError) {
        if (this.b == null || this.c) {
            return;
        }
        this.b.a(speechError);
    }

    private byte[] a(InputStream inputStream) throws IOException {
        int i;
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        ByteArrayBuffer byteArrayBuffer = new ByteArrayBuffer(1024);
        byte[] bArr = new byte[1024];
        while (!this.c && (i = bufferedInputStream.read(bArr, 0, 1024)) != -1) {
            byteArrayBuffer.append(bArr, 0, i);
        }
        return byteArrayBuffer.toByteArray();
    }

    private void b(byte[] bArr) {
        if (this.b == null || this.c) {
            return;
        }
        this.b.a(this, bArr);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00ba A[Catch: Exception -> 0x00be, TRY_LEAVE, TryCatch #1 {Exception -> 0x00be, blocks: (B:28:0x00b5, B:30:0x00ba), top: B:46:0x00b5 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void c() throws java.lang.Throwable {
        /*
            r5 = this;
            r3 = 0
            java.lang.String r0 = "Start connect server"
            com.iflytek.thridparty.C0020ai.a(r0)     // Catch: java.lang.Exception -> L77 java.lang.Throwable -> Laf
            java.net.URL r0 = r5.d     // Catch: java.lang.Exception -> L77 java.lang.Throwable -> Laf
            java.net.URLConnection r0 = r0.openConnection()     // Catch: java.lang.Exception -> L77 java.lang.Throwable -> Laf
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch: java.lang.Exception -> L77 java.lang.Throwable -> Laf
            int r1 = r5.a     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r0.setConnectTimeout(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            int r1 = r5.a     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r0.setReadTimeout(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.String r1 = "GET"
            r0.setRequestMethod(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            int r1 = r0.getResponseCode()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r2.<init>()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.String r4 = "responseCode = "
            java.lang.StringBuilder r2 = r2.append(r4)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.StringBuilder r2 = r2.append(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            com.iflytek.thridparty.C0020ai.a(r2)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r2 = 200(0xc8, float:2.8E-43)
            if (r2 != r1) goto L51
            java.io.InputStream r2 = r0.getInputStream()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            byte[] r1 = r5.a(r2)     // Catch: java.lang.Throwable -> Lc4 java.lang.Exception -> Lce
            r5.b(r1)     // Catch: java.lang.Throwable -> Lc4 java.lang.Exception -> Lce
        L46:
            if (r2 == 0) goto L4b
            r2.close()     // Catch: java.lang.Exception -> Ld1
        L4b:
            if (r0 == 0) goto L50
            r0.disconnect()     // Catch: java.lang.Exception -> Ld1
        L50:
            return
        L51:
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r2.<init>()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.String r4 = "MscHttpRequest connect error:"
            java.lang.StringBuilder r2 = r2.append(r4)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.StringBuilder r2 = r2.append(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            com.iflytek.thridparty.C0020ai.a(r2)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            com.iflytek.cloud.SpeechError r2 = new com.iflytek.cloud.SpeechError     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            int r1 = java.lang.Math.abs(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            int r1 = r1 + 12000
            r2.<init>(r1)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r5.a(r2)     // Catch: java.lang.Throwable -> Lc0 java.lang.Exception -> Lca
            r2 = r3
            goto L46
        L77:
            r0 = move-exception
            r1 = r0
            r2 = r3
            r4 = r3
        L7b:
            com.iflytek.thridparty.C0020ai.a(r1)     // Catch: java.lang.Throwable -> Lc7
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lc7
            r0.<init>()     // Catch: java.lang.Throwable -> Lc7
            java.lang.String r3 = "MscHttpRequest error:"
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch: java.lang.Throwable -> Lc7
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> Lc7
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> Lc7
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> Lc7
            com.iflytek.thridparty.C0020ai.a(r0)     // Catch: java.lang.Throwable -> Lc7
            com.iflytek.cloud.SpeechError r0 = new com.iflytek.cloud.SpeechError     // Catch: java.lang.Throwable -> Lc7
            r1 = 20003(0x4e23, float:2.803E-41)
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lc7
            r5.a(r0)     // Catch: java.lang.Throwable -> Lc7
            if (r2 == 0) goto La7
            r2.close()     // Catch: java.lang.Exception -> Lad
        La7:
            if (r4 == 0) goto L50
            r4.disconnect()     // Catch: java.lang.Exception -> Lad
            goto L50
        Lad:
            r0 = move-exception
            goto L50
        Laf:
            r0 = move-exception
            r1 = r0
            r2 = r3
            r4 = r3
        Lb3:
            if (r2 == 0) goto Lb8
            r2.close()     // Catch: java.lang.Exception -> Lbe
        Lb8:
            if (r4 == 0) goto Lbd
            r4.disconnect()     // Catch: java.lang.Exception -> Lbe
        Lbd:
            throw r1
        Lbe:
            r0 = move-exception
            goto Lbd
        Lc0:
            r1 = move-exception
            r2 = r3
            r4 = r0
            goto Lb3
        Lc4:
            r1 = move-exception
            r4 = r0
            goto Lb3
        Lc7:
            r0 = move-exception
            r1 = r0
            goto Lb3
        Lca:
            r1 = move-exception
            r2 = r3
            r4 = r0
            goto L7b
        Lce:
            r1 = move-exception
            r4 = r0
            goto L7b
        Ld1:
            r0 = move-exception
            goto L50
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.X.c():void");
    }

    private int d() {
        int length = 0;
        for (int i = 0; i < this.e.size(); i++) {
            length += this.e.get(i).length;
        }
        return length;
    }

    public void a() {
        this.c = true;
    }

    public void a(int i) {
        this.h = i;
    }

    public void a(a aVar) {
        this.b = aVar;
        start();
    }

    public void a(String str, String str2, byte[] bArr) {
        this.e.clear();
        a(bArr);
        try {
            this.d = a(str, str2);
        } catch (MalformedURLException e) {
            C0020ai.a(e);
        }
    }

    public void a(String str, String str2, byte[] bArr, String str3) {
        this.f = str3;
        a(str, str2, bArr);
    }

    public void a(byte[] bArr) {
        if (bArr != null) {
            this.e.add(bArr);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0111 A[Catch: Exception -> 0x0115, TRY_LEAVE, TryCatch #4 {Exception -> 0x0115, blocks: (B:37:0x010c, B:39:0x0111), top: B:55:0x010c }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x010c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void b() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.X.b():void");
    }

    public void b(int i) {
        this.a = i;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws Throwable {
        if (this.h == 1) {
            b();
        } else {
            c();
        }
    }
}
