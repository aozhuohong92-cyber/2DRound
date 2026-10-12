package com.tencent.bugly.proguard;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.android.vending.expansion.zipfile.APEZProvider;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class o {
    private static o a = null;
    private static p b = null;
    private static boolean c = false;

    private o(Context context, List<com.tencent.bugly.a> list) {
        b = new p(context, list);
    }

    public static synchronized o a(Context context, List<com.tencent.bugly.a> list) {
        if (a == null) {
            a = new o(context, list);
        }
        return a;
    }

    public static synchronized o a() {
        return a;
    }

    public final long a(String str, ContentValues contentValues, n nVar, boolean z) {
        return a(str, contentValues, (n) null);
    }

    public final Cursor a(String str, String[] strArr, String str2, String[] strArr2, n nVar, boolean z) {
        return a(false, str, strArr, str2, null, null, null, null, null, null);
    }

    public final int a(String str, String str2, String[] strArr, n nVar, boolean z) {
        return a(str, str2, (String[]) null, (n) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized long a(String str, ContentValues contentValues, n nVar) {
        long j = 0;
        synchronized (this) {
            try {
                try {
                    SQLiteDatabase writableDatabase = b.getWritableDatabase();
                    if (writableDatabase != null && contentValues != null) {
                        long jReplace = writableDatabase.replace(str, APEZProvider.FILEID, contentValues);
                        if (jReplace >= 0) {
                            w.c("[db] insert %s success", str);
                        } else {
                            w.d("[db] replace %s error", str);
                        }
                        j = jReplace;
                    }
                    if (nVar != null) {
                        Long.valueOf(j);
                    }
                } catch (Throwable th) {
                    if (!w.a(th)) {
                        th.printStackTrace();
                    }
                    if (nVar != null) {
                        Long.valueOf(0L);
                    }
                }
            } catch (Throwable th2) {
                if (nVar != null) {
                    Long.valueOf(0L);
                }
                throw th2;
            }
        }
        return j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized Cursor a(boolean z, String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5, String str6, n nVar) {
        Cursor cursorQuery;
        try {
            try {
                SQLiteDatabase writableDatabase = b.getWritableDatabase();
                cursorQuery = writableDatabase != null ? writableDatabase.query(z, str, strArr, str2, strArr2, str3, str4, str5, str6) : null;
                if (nVar != null) {
                }
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                cursorQuery = nVar != null ? null : null;
            }
        } finally {
        }
        return cursorQuery;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized int a(String str, String str2, String[] strArr, n nVar) {
        synchronized (this) {
            try {
                try {
                    SQLiteDatabase writableDatabase = b.getWritableDatabase();
                    iDelete = writableDatabase != null ? writableDatabase.delete(str, str2, strArr) : 0;
                    if (nVar != null) {
                        Integer.valueOf(iDelete);
                    }
                } catch (Throwable th) {
                    if (!w.a(th)) {
                        th.printStackTrace();
                    }
                    if (nVar != null) {
                        Integer.valueOf(0);
                    }
                }
            } catch (Throwable th2) {
                if (nVar != null) {
                    Integer.valueOf(0);
                }
                throw th2;
            }
        }
        return iDelete;
    }

    public final boolean a(int i, String str, byte[] bArr, n nVar, boolean z) {
        if (z) {
            return a(i, str, bArr, (n) null);
        }
        a aVar = new a(4, null);
        aVar.a(i, str, bArr);
        v.a().b(aVar);
        return true;
    }

    public final Map<String, byte[]> a(int i, n nVar, boolean z) {
        return a(i, (n) null);
    }

    public final boolean a(int i, String str, n nVar, boolean z) {
        return a(555, str, (n) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(int i, String str, byte[] bArr, n nVar) {
        boolean zB = false;
        try {
            try {
                q qVar = new q();
                qVar.a = i;
                qVar.f = str;
                qVar.e = System.currentTimeMillis();
                qVar.g = bArr;
                zB = b(qVar);
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                if (nVar != null) {
                    Boolean.valueOf(false);
                }
            }
            return zB;
        } finally {
            if (nVar != null) {
                Boolean.valueOf(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, byte[]> a(int i, n nVar) {
        Throwable th;
        HashMap map = null;
        try {
            List<q> listC = c(i);
            HashMap map2 = new HashMap();
            try {
                for (q qVar : listC) {
                    byte[] bArr = qVar.g;
                    if (bArr != null) {
                        map2.put(qVar.f, bArr);
                    }
                }
                return nVar != null ? map2 : map2;
            } catch (Throwable th2) {
                th = th2;
                map = map2;
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                if (nVar != null) {
                }
                return map;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final boolean a(q qVar) {
        ContentValues contentValuesC;
        if (qVar == null) {
            return false;
        }
        try {
            SQLiteDatabase writableDatabase = b.getWritableDatabase();
            if (writableDatabase == null || (contentValuesC = c(qVar)) == null) {
                return false;
            }
            long jReplace = writableDatabase.replace("t_lr", APEZProvider.FILEID, contentValuesC);
            if (jReplace < 0) {
                return false;
            }
            w.c("insert %s success!", "t_lr");
            qVar.a = jReplace;
            return true;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    private boolean b(q qVar) {
        ContentValues contentValuesD;
        if (qVar == null) {
            return false;
        }
        try {
            SQLiteDatabase writableDatabase = b.getWritableDatabase();
            if (writableDatabase == null || (contentValuesD = d(qVar)) == null) {
                return false;
            }
            long jReplace = writableDatabase.replace("t_pf", APEZProvider.FILEID, contentValuesD);
            if (jReplace < 0) {
                return false;
            }
            w.c("insert %s success!", "t_pf");
            qVar.a = jReplace;
            return true;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0058 A[Catch: all -> 0x00d4, TRY_LEAVE, TryCatch #1 {all -> 0x00d4, blocks: (B:24:0x0052, B:26:0x0058), top: B:57:0x0052 }] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x008f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<com.tencent.bugly.proguard.q> a(int r10) {
        /*
            Method dump skipped, instructions count: 219
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.o.a(int):java.util.List");
    }

    public static void a(List<q> list) {
        SQLiteDatabase writableDatabase;
        if (list != null && list.size() != 0 && (writableDatabase = b.getWritableDatabase()) != null) {
            StringBuilder sb = new StringBuilder();
            Iterator<q> it2 = list.iterator();
            while (it2.hasNext()) {
                sb.append(" or _id").append(" = ").append(it2.next().a);
            }
            String string = sb.toString();
            if (string.length() > 0) {
                string = string.substring(4);
            }
            sb.setLength(0);
            try {
                w.c("deleted %s data %d", "t_lr", Integer.valueOf(writableDatabase.delete("t_lr", string, null)));
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
            }
        }
    }

    public static void b(int i) {
        String str = null;
        SQLiteDatabase writableDatabase = b.getWritableDatabase();
        if (writableDatabase != null) {
            if (i >= 0) {
                try {
                    str = "_tp = " + i;
                    w.c("deleted %s data %d", "t_lr", Integer.valueOf(writableDatabase.delete("t_lr", str, null)));
                    return;
                } catch (Throwable th) {
                    if (!w.a(th)) {
                        th.printStackTrace();
                        return;
                    }
                    return;
                }
            }
            w.c("deleted %s data %d", "t_lr", Integer.valueOf(writableDatabase.delete("t_lr", str, null)));
            return;
        }
    }

    private static ContentValues c(q qVar) {
        if (qVar == null) {
            return null;
        }
        try {
            ContentValues contentValues = new ContentValues();
            if (qVar.a > 0) {
                contentValues.put(APEZProvider.FILEID, Long.valueOf(qVar.a));
            }
            contentValues.put("_tp", Integer.valueOf(qVar.b));
            contentValues.put("_pc", qVar.c);
            contentValues.put("_th", qVar.d);
            contentValues.put("_tm", Long.valueOf(qVar.e));
            if (qVar.g != null) {
                contentValues.put("_dt", qVar.g);
            }
            return contentValues;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }

    private static q a(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        try {
            q qVar = new q();
            qVar.a = cursor.getLong(cursor.getColumnIndex(APEZProvider.FILEID));
            qVar.b = cursor.getInt(cursor.getColumnIndex("_tp"));
            qVar.c = cursor.getString(cursor.getColumnIndex("_pc"));
            qVar.d = cursor.getString(cursor.getColumnIndex("_th"));
            qVar.e = cursor.getLong(cursor.getColumnIndex("_tm"));
            qVar.g = cursor.getBlob(cursor.getColumnIndex("_dt"));
            return qVar;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }

    private List<q> c(int i) throws Throwable {
        Cursor cursorQuery;
        Cursor cursor;
        try {
            SQLiteDatabase writableDatabase = b.getWritableDatabase();
            if (writableDatabase != null) {
                String str = "_id = " + i;
                cursorQuery = writableDatabase.query("t_pf", null, str, null, null, null, null);
                if (cursorQuery == null) {
                    if (cursorQuery != null && !cursorQuery.isClosed()) {
                        cursorQuery.close();
                    }
                    return null;
                }
                try {
                    try {
                        StringBuilder sb = new StringBuilder();
                        ArrayList arrayList = new ArrayList();
                        while (cursorQuery.moveToNext()) {
                            q qVarB = b(cursorQuery);
                            if (qVarB != null) {
                                arrayList.add(qVarB);
                            } else {
                                try {
                                    sb.append(" or _tp").append(" = ").append(cursorQuery.getString(cursorQuery.getColumnIndex("_tp")));
                                } catch (Throwable th) {
                                    w.d("unknown id!", new Object[0]);
                                }
                            }
                        }
                        if (sb.length() > 0) {
                            sb.append(" and _id").append(" = ").append(i);
                            w.d("deleted %s illegle data %d", "t_pf", Integer.valueOf(writableDatabase.delete("t_pf", str.substring(4), null)));
                        }
                        if (cursorQuery != null && !cursorQuery.isClosed()) {
                            cursorQuery.close();
                        }
                        return arrayList;
                    } catch (Throwable th2) {
                        th = th2;
                        cursor = cursorQuery;
                        try {
                            if (!w.a(th)) {
                                th.printStackTrace();
                            }
                            if (cursor != null && !cursor.isClosed()) {
                                cursor.close();
                            }
                            return null;
                        } catch (Throwable th3) {
                            th = th3;
                            cursorQuery = cursor;
                            if (cursorQuery != null) {
                                cursorQuery.close();
                            }
                            throw th;
                        }
                    }
                } catch (Throwable th4) {
                    th = th4;
                    if (cursorQuery != null && !cursorQuery.isClosed()) {
                        cursorQuery.close();
                    }
                    throw th;
                }
            }
        } catch (Throwable th5) {
            th = th5;
            cursorQuery = null;
        }
        return null;
    }

    public static boolean a(int i, String str, n nVar) {
        String str2;
        boolean z = false;
        try {
            try {
                SQLiteDatabase writableDatabase = b.getWritableDatabase();
                if (writableDatabase != null) {
                    if (str == null || str.trim().length() <= 0) {
                        str2 = "_id = " + i;
                    } else {
                        str2 = "_id = " + i + " and _tp = \"" + str + "\"";
                    }
                    int iDelete = writableDatabase.delete("t_pf", str2, null);
                    w.c("deleted %s data %d", "t_pf", Integer.valueOf(iDelete));
                    z = iDelete > 0;
                }
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                if (nVar != null) {
                    Boolean.valueOf(false);
                }
            }
            return z;
        } finally {
            if (nVar != null) {
                Boolean.valueOf(false);
            }
        }
    }

    private static ContentValues d(q qVar) {
        if (qVar != null) {
            String str = qVar.f;
            if (!(str == null || str.trim().length() <= 0)) {
                try {
                    ContentValues contentValues = new ContentValues();
                    if (qVar.a > 0) {
                        contentValues.put(APEZProvider.FILEID, Long.valueOf(qVar.a));
                    }
                    contentValues.put("_tp", qVar.f);
                    contentValues.put("_tm", Long.valueOf(qVar.e));
                    if (qVar.g != null) {
                        contentValues.put("_dt", qVar.g);
                        return contentValues;
                    }
                    return contentValues;
                } catch (Throwable th) {
                    if (!w.a(th)) {
                        th.printStackTrace();
                    }
                    return null;
                }
            }
        }
        return null;
    }

    private static q b(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        try {
            q qVar = new q();
            qVar.a = cursor.getLong(cursor.getColumnIndex(APEZProvider.FILEID));
            qVar.e = cursor.getLong(cursor.getColumnIndex("_tm"));
            qVar.f = cursor.getString(cursor.getColumnIndex("_tp"));
            qVar.g = cursor.getBlob(cursor.getColumnIndex("_dt"));
            return qVar;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }

    /* compiled from: BUGLY */
    class a extends Thread {
        private int a;
        private n b;
        private String c;
        private ContentValues d;
        private boolean e;
        private String[] f;
        private String g;
        private String[] h;
        private String i;
        private String j;
        private String k;
        private String l;
        private String m;
        private String[] n;
        private int o;
        private String p;
        private byte[] q;

        public a(int i, n nVar) {
            this.a = i;
            this.b = nVar;
        }

        public final void a(boolean z, String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5, String str6) {
            this.e = z;
            this.c = str;
            this.f = strArr;
            this.g = str2;
            this.h = strArr2;
            this.i = str3;
            this.j = str4;
            this.k = str5;
            this.l = str6;
        }

        public final void a(int i, String str, byte[] bArr) {
            this.o = i;
            this.p = str;
            this.q = bArr;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public final void run() {
            switch (this.a) {
                case 1:
                    o.this.a(this.c, this.d, this.b);
                    break;
                case 2:
                    o.this.a(this.c, this.m, this.n, this.b);
                    break;
                case 3:
                    o.this.a(this.e, this.c, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.b);
                    break;
                case 4:
                    o.this.a(this.o, this.p, this.q, this.b);
                    break;
                case 5:
                    o.this.a(this.o, this.b);
                    break;
                case 6:
                    o oVar = o.this;
                    o.a(this.o, this.p, this.b);
                    break;
            }
        }
    }

    public final boolean a(l lVar) {
        ContentValues contentValuesB;
        if (lVar == null) {
            return false;
        }
        try {
            SQLiteDatabase writableDatabase = b.getWritableDatabase();
            if (writableDatabase == null || (contentValuesB = b(lVar)) == null) {
                return false;
            }
            long jReplace = writableDatabase.replace("t_crd", APEZProvider.FILEID, contentValuesB);
            if (jReplace < 0) {
                return false;
            }
            w.c("insert %s success!", "t_crd");
            lVar.a = jReplace;
            return true;
        } catch (Throwable th) {
            if (w.a(th)) {
                return false;
            }
            th.printStackTrace();
            return false;
        }
    }

    /* JADX WARN: Not initialized variable reg: 1, insn: 0x00c1: MOVE (r8 I:??[OBJECT, ARRAY]) = (r1 I:??[OBJECT, ARRAY]), block:B:44:0x00c1 */
    public final List<l> a(int i, String str, long j, String str2) throws Throwable {
        Cursor cursor;
        Cursor cursorQuery;
        Cursor cursor2 = null;
        SQLiteDatabase writableDatabase = b.getWritableDatabase();
        try {
            if (writableDatabase != null) {
                try {
                    cursorQuery = writableDatabase.query("t_crd", null, "_id = " + i + " and _pc = '" + str + "' and _fl > 0 and _sv = '" + str2 + "' " + (j != 0 ? " and _tm > " + j : ""), null, null, null, "_tm ASC");
                    if (cursorQuery == null) {
                        if (cursorQuery != null && !cursorQuery.isClosed()) {
                            cursorQuery.close();
                        }
                        return null;
                    }
                    try {
                        ArrayList arrayList = new ArrayList();
                        while (cursorQuery.moveToNext()) {
                            l lVarC = c(cursorQuery);
                            if (lVarC != null) {
                                arrayList.add(lVarC);
                            }
                        }
                        if (cursorQuery == null || cursorQuery.isClosed()) {
                            return arrayList;
                        }
                        cursorQuery.close();
                        return arrayList;
                    } catch (Throwable th) {
                        th = th;
                        if (!w.a(th)) {
                            th.printStackTrace();
                        }
                        if (cursorQuery != null && !cursorQuery.isClosed()) {
                            cursorQuery.close();
                        }
                        return null;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursorQuery = null;
                }
            }
            return null;
        } catch (Throwable th3) {
            th = th3;
            cursor2 = cursor;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.tencent.bugly.proguard.l a(int r10, java.lang.String r11) throws java.lang.Throwable {
        /*
            r9 = this;
            r8 = 0
            com.tencent.bugly.proguard.p r0 = com.tencent.bugly.proguard.o.b
            android.database.sqlite.SQLiteDatabase r0 = r0.getWritableDatabase()
            if (r0 == 0) goto L4d
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r2 = "_id = "
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.StringBuilder r1 = r1.append(r10)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r2 = " and _pc"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r2 = " = '"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.StringBuilder r1 = r1.append(r11)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r2 = "' and _fl"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r2 = " > 0"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r3 = r1.toString()     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            java.lang.String r1 = "t_crd"
            r2 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "_tm DESC"
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L67 java.lang.Throwable -> L7e
            if (r1 != 0) goto L4e
            if (r1 == 0) goto L4d
            boolean r0 = r1.isClosed()
            if (r0 != 0) goto L4d
            r1.close()
        L4d:
            return r8
        L4e:
            if (r1 == 0) goto L90
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L8b java.lang.Throwable -> L8e
            if (r0 == 0) goto L90
            com.tencent.bugly.proguard.l r0 = c(r1)     // Catch: java.lang.Throwable -> L8b java.lang.Throwable -> L8e
        L5a:
            if (r1 == 0) goto L65
            boolean r2 = r1.isClosed()
            if (r2 != 0) goto L65
            r1.close()
        L65:
            r8 = r0
            goto L4d
        L67:
            r0 = move-exception
            r1 = r8
        L69:
            boolean r2 = com.tencent.bugly.proguard.w.a(r0)     // Catch: java.lang.Throwable -> L8b
            if (r2 != 0) goto L72
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L8b
        L72:
            if (r1 == 0) goto L4d
            boolean r0 = r1.isClosed()
            if (r0 != 0) goto L4d
            r1.close()
            goto L4d
        L7e:
            r0 = move-exception
        L7f:
            if (r8 == 0) goto L8a
            boolean r1 = r8.isClosed()
            if (r1 != 0) goto L8a
            r8.close()
        L8a:
            throw r0
        L8b:
            r0 = move-exception
            r8 = r1
            goto L7f
        L8e:
            r0 = move-exception
            goto L69
        L90:
            r0 = r8
            goto L5a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.o.a(int, java.lang.String):com.tencent.bugly.proguard.l");
    }

    public final int a(int i, String str, long j) {
        return a("t_crd", "_id = " + i + " and _pc = '" + str + "' " + (j == 0 ? "" : " and _tm < " + j), (String[]) null, (n) null);
    }

    public final int b() {
        StringBuilder sb = new StringBuilder("_fl = 0 or _sv <> '");
        com.tencent.bugly.crashreport.common.info.a.a().getClass();
        return a("t_crd", sb.append("2.2.2'").toString(), (String[]) null, (n) null);
    }

    private static ContentValues b(l lVar) {
        if (lVar == null) {
            return null;
        }
        try {
            ContentValues contentValues = new ContentValues();
            if (lVar.a <= 0 || TextUtils.isEmpty(lVar.b)) {
                return null;
            }
            contentValues.put(APEZProvider.FILEID, Long.valueOf(lVar.a));
            contentValues.put("_pc", lVar.b);
            contentValues.put("_tm", Long.valueOf(lVar.c));
            contentValues.put("_fl", Integer.valueOf(lVar.d));
            contentValues.put("_av", lVar.f);
            contentValues.put("_sv", lVar.e);
            contentValues.put("_uid", Long.valueOf(lVar.g));
            return contentValues;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }

    private static l c(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        try {
            l lVar = new l();
            lVar.a = cursor.getLong(cursor.getColumnIndex(APEZProvider.FILEID));
            lVar.b = cursor.getString(cursor.getColumnIndex("_pc"));
            lVar.e = cursor.getString(cursor.getColumnIndex("_sv"));
            lVar.f = cursor.getString(cursor.getColumnIndex("_av"));
            lVar.c = cursor.getLong(cursor.getColumnIndex("_tm"));
            lVar.d = cursor.getInt(cursor.getColumnIndex("_fl"));
            lVar.g = cursor.getLong(cursor.getColumnIndex("_uid"));
            return lVar;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }
}
