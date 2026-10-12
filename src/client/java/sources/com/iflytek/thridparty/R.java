package com.iflytek.thridparty;

import java.security.MessageDigest;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class R {
    /* JADX WARN: Removed duplicated region for block: B:37:0x004d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String a(java.io.File r8) throws java.lang.Throwable {
        /*
            r6 = 0
            boolean r0 = r8.exists()
            if (r0 != 0) goto L8
        L7:
            return r6
        L8:
            java.io.FileInputStream r7 = new java.io.FileInputStream     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L49
            r7.<init>(r8)     // Catch: java.lang.Exception -> L3d java.lang.Throwable -> L49
            java.nio.channels.FileChannel r0 = r7.getChannel()     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            java.nio.channels.FileChannel$MapMode r1 = java.nio.channels.FileChannel.MapMode.READ_ONLY     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            r2 = 0
            long r4 = r8.length()     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            java.nio.MappedByteBuffer r0 = r0.map(r1, r2, r4)     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            java.lang.String r1 = "MD5"
            java.security.MessageDigest r1 = java.security.MessageDigest.getInstance(r1)     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            r1.update(r0)     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            java.math.BigInteger r0 = new java.math.BigInteger     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            r2 = 1
            byte[] r1 = r1.digest()     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            r0.<init>(r2, r1)     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            r1 = 16
            java.lang.String r0 = r0.toString(r1)     // Catch: java.lang.Throwable -> L60 java.lang.Exception -> L65
            if (r7 == 0) goto L3b
            r7.close()     // Catch: java.io.IOException -> L5b
        L3b:
            r6 = r0
            goto L7
        L3d:
            r0 = move-exception
            r1 = r6
        L3f:
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L62
            if (r1 == 0) goto L47
            r1.close()     // Catch: java.io.IOException -> L56
        L47:
            r0 = r6
            goto L3b
        L49:
            r0 = move-exception
            r7 = r6
        L4b:
            if (r7 == 0) goto L50
            r7.close()     // Catch: java.io.IOException -> L51
        L50:
            throw r0
        L51:
            r1 = move-exception
            r1.printStackTrace()
            goto L50
        L56:
            r0 = move-exception
            r0.printStackTrace()
            goto L47
        L5b:
            r1 = move-exception
            r1.printStackTrace()
            goto L3b
        L60:
            r0 = move-exception
            goto L4b
        L62:
            r0 = move-exception
            r7 = r1
            goto L4b
        L65:
            r0 = move-exception
            r1 = r7
            goto L3f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.R.a(java.io.File):java.lang.String");
    }

    public static synchronized String a(String str) {
        String string;
        synchronized (R.class) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                char[] charArray = str.toCharArray();
                byte[] bArr = new byte[charArray.length];
                for (int i = 0; i < charArray.length; i++) {
                    bArr[i] = (byte) charArray[i];
                }
                byte[] bArrDigest = messageDigest.digest(bArr);
                StringBuffer stringBuffer = new StringBuffer();
                for (byte b : bArrDigest) {
                    int i2 = b & 255;
                    if (i2 < 16) {
                        stringBuffer.append("0");
                    }
                    stringBuffer.append(Integer.toHexString(i2));
                }
                string = stringBuffer.toString();
            } catch (Exception e) {
                C0020ai.a(e);
                string = "";
            }
        }
        return string;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x005f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static byte[] a(byte[] r5) throws java.lang.Throwable {
        /*
            r1 = 0
            if (r5 != 0) goto L5
            r0 = r1
        L4:
            return r0
        L5:
            java.io.ByteArrayOutputStream r4 = new java.io.ByteArrayOutputStream
            r4.<init>()
            java.util.zip.GZIPOutputStream r3 = new java.util.zip.GZIPOutputStream     // Catch: java.io.IOException -> L30 java.lang.Throwable -> L46
            r3.<init>(r4)     // Catch: java.io.IOException -> L30 java.lang.Throwable -> L46
            r3.write(r5)     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L69
            r3.finish()     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L69
            int r0 = android.os.Build.VERSION.SDK_INT     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L69
            r2 = 19
            if (r0 >= r2) goto L1e
            r3.flush()     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L69
        L1e:
            byte[] r0 = r4.toByteArray()     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L69
            r1 = 0
        L23:
            int r2 = r0.length     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L6c
            if (r1 >= r2) goto L58
            r2 = r0[r1]     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L6c
            r2 = r2 ^ 5
            byte r2 = (byte) r2     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L6c
            r0[r1] = r2     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L6c
            int r1 = r1 + 1
            goto L23
        L30:
            r2 = move-exception
            r3 = r1
            r0 = r1
        L33:
            com.iflytek.thridparty.C0020ai.a(r2)     // Catch: java.lang.Throwable -> L67
            if (r3 == 0) goto L3b
            r3.close()     // Catch: java.io.IOException -> L41
        L3b:
            if (r4 == 0) goto L4
            r4.close()     // Catch: java.io.IOException -> L41
            goto L4
        L41:
            r1 = move-exception
        L42:
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L4
        L46:
            r0 = move-exception
            r3 = r1
        L48:
            if (r3 == 0) goto L4d
            r3.close()     // Catch: java.io.IOException -> L53
        L4d:
            if (r4 == 0) goto L52
            r4.close()     // Catch: java.io.IOException -> L53
        L52:
            throw r0
        L53:
            r1 = move-exception
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L52
        L58:
            if (r3 == 0) goto L5d
            r3.close()     // Catch: java.io.IOException -> L65
        L5d:
            if (r4 == 0) goto L4
            r4.close()     // Catch: java.io.IOException -> L63
            goto L4
        L63:
            r1 = move-exception
            goto L42
        L65:
            r1 = move-exception
            goto L42
        L67:
            r0 = move-exception
            goto L48
        L69:
            r2 = move-exception
            r0 = r1
            goto L33
        L6c:
            r1 = move-exception
            r2 = r1
            goto L33
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.R.a(byte[]):byte[]");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0070 A[Catch: IOException -> 0x0079, TryCatch #0 {IOException -> 0x0079, blocks: (B:43:0x006b, B:45:0x0070, B:47:0x0075), top: B:61:0x006b }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0075 A[Catch: IOException -> 0x0079, TRY_LEAVE, TryCatch #0 {IOException -> 0x0079, blocks: (B:43:0x006b, B:45:0x0070, B:47:0x0075), top: B:61:0x006b }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x006b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0061 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x005c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:81:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static byte[] b(byte[] r7) throws java.lang.Throwable {
        /*
            r1 = 0
            r0 = 0
            if (r7 != 0) goto L6
            r0 = r1
        L5:
            return r0
        L6:
            int r2 = r7.length
            if (r0 >= r2) goto L13
            r2 = r7[r0]
            r2 = r2 ^ 5
            byte r2 = (byte) r2
            r7[r0] = r2
            int r0 = r0 + 1
            goto L6
        L13:
            java.io.ByteArrayInputStream r4 = new java.io.ByteArrayInputStream
            r4.<init>(r7)
            java.io.ByteArrayOutputStream r5 = new java.io.ByteArrayOutputStream
            r5.<init>()
            java.util.zip.GZIPInputStream r3 = new java.util.zip.GZIPInputStream     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L84
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L67 java.io.IOException -> L84
            r0 = 1024(0x400, float:1.435E-42)
            byte[] r0 = new byte[r0]     // Catch: java.io.IOException -> L34 java.lang.Throwable -> L82
        L26:
            r2 = 0
            int r6 = r0.length     // Catch: java.io.IOException -> L34 java.lang.Throwable -> L82
            int r2 = r3.read(r0, r2, r6)     // Catch: java.io.IOException -> L34 java.lang.Throwable -> L82
            r6 = -1
            if (r2 == r6) goto L4e
            r6 = 0
            r5.write(r0, r6, r2)     // Catch: java.io.IOException -> L34 java.lang.Throwable -> L82
            goto L26
        L34:
            r2 = move-exception
            r0 = r1
        L36:
            com.iflytek.thridparty.C0020ai.a(r2)     // Catch: java.lang.Throwable -> L82
            if (r3 == 0) goto L3e
            r3.close()     // Catch: java.io.IOException -> L49
        L3e:
            if (r4 == 0) goto L43
            r4.close()     // Catch: java.io.IOException -> L49
        L43:
            if (r5 == 0) goto L5
            r5.close()     // Catch: java.io.IOException -> L49
            goto L5
        L49:
            r1 = move-exception
        L4a:
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L5
        L4e:
            byte[] r0 = r5.toByteArray()     // Catch: java.io.IOException -> L34 java.lang.Throwable -> L82
            r5.flush()     // Catch: java.lang.Throwable -> L82 java.io.IOException -> L88
            if (r3 == 0) goto L5a
            r3.close()     // Catch: java.io.IOException -> L7e
        L5a:
            if (r4 == 0) goto L5f
            r4.close()     // Catch: java.io.IOException -> L80
        L5f:
            if (r5 == 0) goto L5
            r5.close()     // Catch: java.io.IOException -> L65
            goto L5
        L65:
            r1 = move-exception
            goto L4a
        L67:
            r0 = move-exception
            r3 = r1
        L69:
            if (r3 == 0) goto L6e
            r3.close()     // Catch: java.io.IOException -> L79
        L6e:
            if (r4 == 0) goto L73
            r4.close()     // Catch: java.io.IOException -> L79
        L73:
            if (r5 == 0) goto L78
            r5.close()     // Catch: java.io.IOException -> L79
        L78:
            throw r0
        L79:
            r1 = move-exception
            com.iflytek.thridparty.C0020ai.a(r1)
            goto L78
        L7e:
            r1 = move-exception
            goto L4a
        L80:
            r1 = move-exception
            goto L4a
        L82:
            r0 = move-exception
            goto L69
        L84:
            r2 = move-exception
            r3 = r1
            r0 = r1
            goto L36
        L88:
            r1 = move-exception
            r2 = r1
            goto L36
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.R.b(byte[]):byte[]");
    }
}
