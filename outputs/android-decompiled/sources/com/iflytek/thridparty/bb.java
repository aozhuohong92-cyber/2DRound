package com.iflytek.thridparty;

import android.content.Context;
import android.net.Uri;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class bb {
    protected static final String[] a = {"number", "name", "date"};
    protected static String[] c;
    protected Context b;

    public bb(Context context) {
        this.b = null;
        this.b = context;
    }

    public abstract Uri a();

    protected void a(Context context) {
        c = new String[100];
        c[0] = "其他";
        c[1] = "住宅";
        c[2] = "手机";
        c[3] = "工作";
        c[4] = "工作传真";
        c[5] = "住宅传真";
        c[6] = "寻呼机";
        c[7] = "其他";
        c[9] = "SIM卡";
        for (int i = 10; i < c.length; i++) {
            c[i] = "自定义电话";
        }
    }

    protected abstract String[] b();

    protected abstract String c();

    /* JADX WARN: Removed duplicated region for block: B:25:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0029 A[PHI: r1
      0x0029: PHI (r1v4 android.database.Cursor) = (r1v3 android.database.Cursor), (r1v6 android.database.Cursor) binds: [B:15:0x003f, B:6:0x0027] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.HashMap<java.lang.String, java.lang.String> d() throws java.lang.Throwable {
        /*
            r8 = this;
            r6 = 0
            java.lang.String[] r2 = r8.b()
            java.util.HashMap r7 = new java.util.HashMap
            r7.<init>()
            android.content.Context r0 = r8.b     // Catch: java.lang.Throwable -> L88 java.lang.Exception -> L8b
            android.content.ContentResolver r0 = r0.getContentResolver()     // Catch: java.lang.Throwable -> L88 java.lang.Exception -> L8b
            android.net.Uri r1 = r8.a()     // Catch: java.lang.Throwable -> L88 java.lang.Exception -> L8b
            r3 = 0
            r4 = 0
            java.lang.String r5 = r8.c()     // Catch: java.lang.Throwable -> L88 java.lang.Exception -> L8b
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L88 java.lang.Exception -> L8b
            if (r1 != 0) goto L2d
            java.lang.String r0 = "iFly_ContactManager"
            java.lang.String r2 = "queryContacts------cursor is null"
            com.iflytek.thridparty.C0020ai.a(r0, r2)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
        L27:
            if (r1 == 0) goto L2c
        L29:
            r1.close()
        L2c:
            return r7
        L2d:
            int r0 = r1.getCount()     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            if (r0 != 0) goto L42
            java.lang.String r0 = "iFly_ContactManager"
            java.lang.String r2 = "queryContacts------cursor getCount == 0"
            com.iflytek.thridparty.C0020ai.a(r0, r2)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            goto L27
        L3b:
            r0 = move-exception
        L3c:
            com.iflytek.thridparty.C0020ai.a(r0)     // Catch: java.lang.Throwable -> L64
            if (r1 == 0) goto L2c
            goto L29
        L42:
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            if (r0 == 0) goto L6b
            r0 = 0
            r0 = r2[r0]     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            int r0 = r1.getColumnIndex(r0)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            java.lang.String r0 = r1.getString(r0)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            r3 = 1
            r3 = r2[r3]     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            int r3 = r1.getColumnIndex(r3)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            java.lang.String r3 = r1.getString(r3)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            if (r0 == 0) goto L42
            r7.put(r3, r0)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            goto L42
        L64:
            r0 = move-exception
        L65:
            if (r1 == 0) goto L6a
            r1.close()
        L6a:
            throw r0
        L6b:
            java.lang.String r0 = "iFly_ContactManager"
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            r2.<init>()     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            java.lang.String r3 = "queryContacts_20------count = "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            int r3 = r1.getCount()     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            com.iflytek.thridparty.C0020ai.a(r0, r2)     // Catch: java.lang.Exception -> L3b java.lang.Throwable -> L64
            goto L27
        L88:
            r0 = move-exception
            r1 = r6
            goto L65
        L8b:
            r0 = move-exception
            r1 = r6
            goto L3c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.bb.d():java.util.HashMap");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x008e A[Catch: Exception -> 0x0061, all -> 0x0096, TRY_ENTER, TRY_LEAVE, TryCatch #5 {Exception -> 0x0061, all -> 0x0096, blocks: (B:5:0x001c, B:7:0x0022, B:9:0x0028, B:11:0x0050, B:19:0x006c, B:22:0x008e), top: B:36:0x001c }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0099  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.iflytek.thridparty.aX> e() throws java.lang.Throwable {
        /*
            r10 = this;
            r6 = 0
            java.util.ArrayList r8 = new java.util.ArrayList
            r8.<init>()
            android.content.Context r0 = r10.b     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> La3
            android.content.ContentResolver r0 = r0.getContentResolver()     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> La3
            java.lang.String r1 = "content://icc/adn"
            android.net.Uri r1 = android.net.Uri.parse(r1)     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> La3
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            android.database.Cursor r7 = r0.query(r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> La3
            if (r7 == 0) goto L8e
            int r0 = r7.getCount()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            if (r0 <= 0) goto L8e
        L22:
            boolean r0 = r7.moveToNext()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            if (r0 == 0) goto L6c
            java.lang.String r0 = "name"
            int r0 = r7.getColumnIndex(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r2 = r7.getString(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r0 = "_id"
            int r0 = r7.getColumnIndex(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r1 = r7.getString(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r0 = "number"
            int r0 = r7.getColumnIndex(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r0 = r7.getString(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r0 = com.iflytek.thridparty.aW.a(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r4 = com.iflytek.thridparty.R.a(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            if (r2 == 0) goto L22
            com.iflytek.thridparty.aX r0 = new com.iflytek.thridparty.aX     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            r3 = 0
            r5 = 0
            java.lang.String[] r6 = com.iflytek.thridparty.bb.c     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            r9 = 9
            r6 = r6[r9]     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            r0.<init>(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            r8.add(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            goto L22
        L61:
            r0 = move-exception
            r1 = r7
        L63:
            com.iflytek.thridparty.C0020ai.a(r0)     // Catch: java.lang.Throwable -> La0
            if (r1 == 0) goto L6b
            r1.close()
        L6b:
            return r8
        L6c:
            java.lang.String r0 = "iFly_ContactManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            r1.<init>()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r2 = "querySIM-------count = "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            int r2 = r7.getCount()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            com.iflytek.thridparty.C0020ai.a(r0, r1)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
        L88:
            if (r7 == 0) goto L6b
            r7.close()
            goto L6b
        L8e:
            java.lang.String r0 = "iFly_ContactManager"
            java.lang.String r1 = "querySIM-------cursor getCount = 0 or cursor is null"
            com.iflytek.thridparty.C0020ai.a(r0, r1)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L96
            goto L88
        L96:
            r0 = move-exception
        L97:
            if (r7 == 0) goto L9c
            r7.close()
        L9c:
            throw r0
        L9d:
            r0 = move-exception
            r7 = r6
            goto L97
        La0:
            r0 = move-exception
            r7 = r1
            goto L97
        La3:
            r0 = move-exception
            r1 = r6
            goto L63
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.bb.e():java.util.List");
    }
}
