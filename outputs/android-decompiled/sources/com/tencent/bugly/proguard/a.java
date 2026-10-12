package com.tencent.bugly.proguard;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import com.tencent.bugly.crashreport.biz.UserInfoBean;
import com.tencent.bugly.crashreport.common.info.AppInfo;
import com.tencent.bugly.crashreport.common.info.PlugInBean;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class a {
    protected HashMap<String, HashMap<String, byte[]>> a = new HashMap<>();
    protected String b;
    h c;
    private HashMap<String, Object> d;

    a() {
        new HashMap();
        this.d = new HashMap<>();
        this.b = "GBK";
        this.c = new h();
    }

    public static aw a(UserInfoBean userInfoBean) {
        if (userInfoBean == null) {
            return null;
        }
        aw awVar = new aw();
        awVar.a = userInfoBean.e;
        awVar.e = userInfoBean.j;
        awVar.d = userInfoBean.c;
        awVar.c = userInfoBean.d;
        awVar.g = com.tencent.bugly.crashreport.common.info.a.a().h();
        awVar.h = userInfoBean.o == 1;
        switch (userInfoBean.b) {
            case 1:
                awVar.b = (byte) 1;
                break;
            case 2:
                awVar.b = (byte) 4;
                break;
            case 3:
                awVar.b = (byte) 2;
                break;
            case 4:
                awVar.b = (byte) 3;
                break;
            default:
                if (userInfoBean.b >= 10 && userInfoBean.b < 20) {
                    awVar.b = (byte) userInfoBean.b;
                    break;
                } else {
                    w.e("unknown uinfo type %d ", Integer.valueOf(userInfoBean.b));
                    return null;
                }
                break;
        }
        awVar.f = new HashMap();
        if (userInfoBean.p >= 0) {
            awVar.f.put("C01", new StringBuilder().append(userInfoBean.p).toString());
        }
        if (userInfoBean.q >= 0) {
            awVar.f.put("C02", new StringBuilder().append(userInfoBean.q).toString());
        }
        if (userInfoBean.r != null && userInfoBean.r.size() > 0) {
            for (Map.Entry<String, String> entry : userInfoBean.r.entrySet()) {
                awVar.f.put("C03_" + entry.getKey(), entry.getValue());
            }
        }
        if (userInfoBean.s != null && userInfoBean.s.size() > 0) {
            for (Map.Entry<String, String> entry2 : userInfoBean.s.entrySet()) {
                awVar.f.put("C04_" + entry2.getKey(), entry2.getValue());
            }
        }
        awVar.f.put("A36", new StringBuilder().append(!userInfoBean.l).toString());
        awVar.f.put("F02", new StringBuilder().append(userInfoBean.g).toString());
        awVar.f.put("F03", new StringBuilder().append(userInfoBean.h).toString());
        awVar.f.put("F04", userInfoBean.j);
        awVar.f.put("F05", new StringBuilder().append(userInfoBean.i).toString());
        awVar.f.put("F06", userInfoBean.m);
        awVar.f.put("F10", new StringBuilder().append(userInfoBean.k).toString());
        w.c("summary type %d vm:%d", Byte.valueOf(awVar.b), Integer.valueOf(awVar.f.size()));
        return awVar;
    }

    public void a(String str) {
        this.b = str;
    }

    public static String a(Throwable th) {
        if (th == null) {
            return "";
        }
        try {
            StringWriter stringWriter = new StringWriter();
            th.printStackTrace(new PrintWriter(stringWriter));
            return stringWriter.getBuffer().toString();
        } catch (Throwable th2) {
            if (!w.a(th2)) {
                th2.printStackTrace();
            }
            return "fail";
        }
    }

    public static String b() {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
        } catch (Exception e) {
            return new Date().toString();
        }
    }

    public static String a(ArrayList<String> arrayList) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < arrayList.size(); i++) {
            String str = arrayList.get(i);
            if (str.equals("java.lang.Integer") || str.equals("int")) {
                str = "int32";
            } else if (str.equals("java.lang.Boolean") || str.equals("boolean")) {
                str = "bool";
            } else if (str.equals("java.lang.Byte") || str.equals("byte")) {
                str = "char";
            } else if (str.equals("java.lang.Double") || str.equals("double")) {
                str = "double";
            } else if (str.equals("java.lang.Float") || str.equals("float")) {
                str = "float";
            } else if (str.equals("java.lang.Long") || str.equals("long")) {
                str = "int64";
            } else if (str.equals("java.lang.Short") || str.equals("short")) {
                str = "short";
            } else {
                if (str.equals("java.lang.Character")) {
                    throw new IllegalArgumentException("can not support java.lang.Character");
                }
                if (str.equals("java.lang.String")) {
                    str = "string";
                } else if (str.equals("java.util.List")) {
                    str = "list";
                } else if (str.equals("java.util.Map")) {
                    str = "map";
                }
            }
            arrayList.set(i, str);
        }
        Collections.reverse(arrayList);
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            String str2 = arrayList.get(i2);
            if (str2.equals("list")) {
                arrayList.set(i2 - 1, "<" + arrayList.get(i2 - 1));
                arrayList.set(0, arrayList.get(0) + ">");
            } else if (str2.equals("map")) {
                arrayList.set(i2 - 1, "<" + arrayList.get(i2 - 1) + ",");
                arrayList.set(0, arrayList.get(0) + ">");
            } else if (str2.equals("Array")) {
                arrayList.set(i2 - 1, "<" + arrayList.get(i2 - 1));
                arrayList.set(0, arrayList.get(0) + ">");
            }
        }
        Collections.reverse(arrayList);
        Iterator<String> it2 = arrayList.iterator();
        while (it2.hasNext()) {
            stringBuffer.append(it2.next());
        }
        return stringBuffer.toString();
    }

    public <T> void a(String str, T t) {
        if (str == null) {
            throw new IllegalArgumentException("put key can not is null");
        }
        if (t == null) {
            throw new IllegalArgumentException("put value can not is null");
        }
        if (t instanceof Set) {
            throw new IllegalArgumentException("can not support Set");
        }
        i iVar = new i();
        iVar.a(this.b);
        iVar.a(t, 0);
        byte[] bArrA = k.a(iVar.a());
        HashMap<String, byte[]> map = new HashMap<>(1);
        ArrayList<String> arrayList = new ArrayList<>(1);
        a(arrayList, t);
        map.put(a(arrayList), bArrA);
        this.d.remove(str);
        this.a.put(str, map);
    }

    public static String a(Date date) {
        if (date == null) {
            return null;
        }
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(date);
        } catch (Exception e) {
            return new Date().toString();
        }
    }

    public static ax a(List<UserInfoBean> list, int i) {
        if (list == null || list.size() == 0) {
            return null;
        }
        com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a();
        if (aVarA == null) {
            return null;
        }
        aVarA.s();
        ax axVar = new ax();
        axVar.b = aVarA.d;
        axVar.c = aVarA.g();
        ArrayList<aw> arrayList = new ArrayList<>();
        Iterator<UserInfoBean> it2 = list.iterator();
        while (it2.hasNext()) {
            aw awVarA = a(it2.next());
            if (awVarA != null) {
                arrayList.add(awVarA);
            }
        }
        axVar.d = arrayList;
        axVar.e = new HashMap();
        axVar.e.put("A7", aVarA.e);
        axVar.e.put("A6", aVarA.r());
        axVar.e.put("A5", aVarA.q());
        axVar.e.put("A2", new StringBuilder().append(aVarA.o()).toString());
        axVar.e.put("A1", new StringBuilder().append(aVarA.o()).toString());
        axVar.e.put("A24", aVarA.g);
        axVar.e.put("A17", new StringBuilder().append(aVarA.p()).toString());
        axVar.e.put("A15", aVarA.v());
        axVar.e.put("A13", new StringBuilder().append(aVarA.w()).toString());
        axVar.e.put("F08", aVarA.u);
        axVar.e.put("F09", aVarA.v);
        Map<String, String> mapC = aVarA.C();
        if (mapC != null && mapC.size() > 0) {
            for (Map.Entry<String, String> entry : mapC.entrySet()) {
                axVar.e.put("C04_" + entry.getKey(), entry.getValue());
            }
        }
        switch (i) {
            case 1:
                axVar.a = (byte) 1;
                break;
            case 2:
                axVar.a = (byte) 2;
                break;
            default:
                w.e("unknown up type %d ", Integer.valueOf(i));
                return null;
        }
        return axVar;
    }

    public static byte[] a(byte[] bArr, int i, String str) {
        am akVar;
        if (bArr != null && i != -1) {
            try {
                if (i == 1) {
                    akVar = new al();
                } else {
                    akVar = i == 3 ? new ak() : null;
                }
                if (akVar == null) {
                    return null;
                }
                akVar.a(str);
                return akVar.a(bArr);
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                w.d("encrytype %d %s", Integer.valueOf(i), str);
                return null;
            }
        }
        return bArr;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005c A[Catch: all -> 0x007c, TRY_LEAVE, TryCatch #8 {all -> 0x007c, blocks: (B:12:0x0039, B:14:0x004a, B:16:0x0050, B:28:0x0071, B:30:0x0077, B:40:0x0090, B:19:0x0056, B:21:0x005c), top: B:74:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0061 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0085 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0080 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0066 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static byte[] a(java.io.File r9, java.lang.String r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 221
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.a.a(java.io.File, java.lang.String):byte[]");
    }

    public static <T extends j> T a(byte[] bArr, Class<T> cls) {
        if (bArr == null || bArr.length <= 0) {
            return null;
        }
        try {
            T tNewInstance = cls.newInstance();
            h hVar = new h(bArr);
            hVar.a("utf-8");
            tNewInstance.a(hVar);
            return tNewInstance;
        } catch (Throwable th) {
            if (!w.b(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }

    public static as a(Context context, int i, byte[] bArr) {
        com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a();
        StrategyBean strategyBeanC = com.tencent.bugly.crashreport.common.strategy.a.a().c();
        if (aVarA == null || strategyBeanC == null) {
            w.e("illigle access to create req pkg!", new Object[0]);
            return null;
        }
        try {
            as asVar = new as();
            synchronized (aVarA) {
                asVar.a = 1;
                asVar.b = aVarA.e();
                asVar.c = aVarA.c;
                asVar.d = aVarA.i;
                asVar.e = aVarA.j;
                aVarA.getClass();
                asVar.f = "2.2.2";
                asVar.g = i;
                if (bArr == null) {
                    bArr = "".getBytes();
                }
                asVar.h = bArr;
                asVar.i = aVarA.f;
                asVar.j = aVarA.g;
                asVar.k = new HashMap();
                asVar.l = aVarA.d();
                asVar.m = strategyBeanC.m;
                asVar.o = aVarA.g();
                asVar.p = com.tencent.bugly.crashreport.common.info.b.e(context);
                asVar.q = System.currentTimeMillis();
                asVar.r = aVarA.j();
                asVar.s = aVarA.i();
                asVar.t = aVarA.l();
                asVar.u = aVarA.k();
                asVar.v = aVarA.m();
                asVar.w = asVar.p;
                aVarA.getClass();
                asVar.n = "com.tencent.bugly";
            }
            asVar.k.put("F11", new StringBuilder().append(aVarA.y).toString());
            asVar.k.put("F12", new StringBuilder().append(aVarA.x).toString());
            asVar.k.put("G1", aVarA.t());
            asVar.k.put("G2", aVarA.I());
            asVar.k.put("G3", aVarA.J());
            asVar.k.put("G4", aVarA.K());
            asVar.k.put("G5", aVarA.L());
            asVar.k.put("G6", aVarA.M());
            asVar.k.put("G7", Long.toString(aVarA.N()));
            return asVar;
        } catch (Throwable th) {
            if (!w.b(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }

    public static byte[] a(byte[] bArr, int i) {
        if (bArr != null) {
            w.c("rqdp{  zp:} %s rqdp{  len:} %s", 2, Integer.valueOf(bArr.length));
            try {
                ah ahVarA = ag.a(2);
                if (ahVarA == null) {
                    return null;
                }
                return ahVarA.a(bArr);
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                return null;
            }
        }
        return bArr;
    }

    public static byte[] b(byte[] bArr, int i) {
        if (bArr != null && i != -1) {
            w.c("rqdp{  unzp:} %s rqdp{  len:} %s", Integer.valueOf(i), Integer.valueOf(bArr.length));
            try {
                ah ahVarA = ag.a(i);
                if (ahVarA == null) {
                    return null;
                }
                return ahVarA.b(bArr);
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
                return null;
            }
        }
        return bArr;
    }

    private void a(ArrayList<String> arrayList, Object obj) {
        if (obj.getClass().isArray()) {
            if (!obj.getClass().getComponentType().toString().equals("byte")) {
                throw new IllegalArgumentException("only byte[] is supported");
            }
            if (Array.getLength(obj) > 0) {
                arrayList.add("java.util.List");
                a(arrayList, Array.get(obj, 0));
                return;
            } else {
                arrayList.add("Array");
                arrayList.add("?");
                return;
            }
        }
        if (obj instanceof Array) {
            throw new IllegalArgumentException("can not support Array, please use List");
        }
        if (obj instanceof List) {
            arrayList.add("java.util.List");
            List list = (List) obj;
            if (list.size() > 0) {
                a(arrayList, list.get(0));
                return;
            } else {
                arrayList.add("?");
                return;
            }
        }
        if (obj instanceof Map) {
            arrayList.add("java.util.Map");
            Map map = (Map) obj;
            if (map.size() > 0) {
                Object next = map.keySet().iterator().next();
                Object obj2 = map.get(next);
                arrayList.add(next.getClass().getName());
                a(arrayList, obj2);
                return;
            }
            arrayList.add("?");
            arrayList.add("?");
            return;
        }
        arrayList.add(obj.getClass().getName());
    }

    public static byte[] a(byte[] bArr, int i, int i2, String str) {
        try {
            return b(a(bArr, 1, str), 2);
        } catch (Exception e) {
            if (!w.a(e)) {
                e.printStackTrace();
            }
            return null;
        }
    }

    public static byte[] a(as asVar) {
        try {
            d dVar = new d();
            dVar.d();
            dVar.a("utf-8");
            dVar.b(1);
            dVar.b("RqdServer");
            dVar.c("sync");
            dVar.a("detail", (String) asVar);
            return dVar.a();
        } catch (Throwable th) {
            if (!w.b(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }

    public static long c() {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
            return simpleDateFormat.parse(simpleDateFormat.format(new Date())).getTime();
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return -1L;
        }
    }

    public static at a(byte[] bArr, boolean z) {
        if (bArr != null) {
            try {
                d dVar = new d();
                dVar.d();
                dVar.a("utf-8");
                dVar.a(bArr);
                Object objB = dVar.b("detail", (String) new at());
                at atVar = at.class.isInstance(objB) ? (at) at.class.cast(objB) : null;
                if (!z && atVar != null && atVar.c != null && atVar.c.length > 0) {
                    w.c("resp buf %d", Integer.valueOf(atVar.c.length));
                    atVar.c = a(atVar.c, 2, 1, StrategyBean.a);
                    if (atVar.c == null) {
                        w.e("resp sbuffer error!", new Object[0]);
                        return null;
                    }
                    return atVar;
                }
                return atVar;
            } catch (Throwable th) {
                if (!w.b(th)) {
                    th.printStackTrace();
                }
            }
        }
        return null;
    }

    public byte[] a() {
        i iVar = new i(0);
        iVar.a(this.b);
        iVar.a((Map) this.a, 0);
        return k.a(iVar.a());
    }

    public static String b(byte[] bArr) {
        if (bArr == null) {
            return "";
        }
        StringBuffer stringBuffer = new StringBuffer();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & 255);
            if (hexString.length() == 1) {
                stringBuffer.append("0");
            }
            stringBuffer.append(hexString);
        }
        return stringBuffer.toString().toUpperCase();
    }

    public void a(byte[] bArr) {
        this.c.a(bArr);
        this.c.a(this.b);
        HashMap map = new HashMap(1);
        HashMap map2 = new HashMap(1);
        map2.put("", new byte[0]);
        map.put("", map2);
        this.a = this.c.a((Map) map, 0, false);
    }

    public static String c(byte[] bArr) {
        if (bArr == null || bArr.length == 0) {
            return "NULL";
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(bArr);
            return b(messageDigest.digest());
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }

    public static byte[] a(j jVar) {
        try {
            i iVar = new i();
            iVar.a("utf-8");
            jVar.a(iVar);
            return iVar.b();
        } catch (Throwable th) {
            if (!w.b(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:85:0x00e6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00e1 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean a(java.io.File r6, java.io.File r7, int r8) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.a.a(java.io.File, java.io.File, int):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x0091 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0096 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.ArrayList<java.lang.String> a(android.content.Context r6, java.lang.String[] r7) throws java.lang.Throwable {
        /*
            r1 = 0
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            com.tencent.bugly.crashreport.common.info.a r2 = com.tencent.bugly.crashreport.common.info.a.a(r6)
            boolean r2 = r2.F()
            if (r2 == 0) goto L20
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            java.lang.String r1 = new java.lang.String
            java.lang.String r2 = "unknown(low memory)"
            r1.<init>(r2)
            r0.add(r1)
        L1f:
            return r0
        L20:
            java.lang.Runtime r2 = java.lang.Runtime.getRuntime()     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            java.lang.Process r4 = r2.exec(r7)     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            java.io.BufferedReader r3 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            java.io.InputStreamReader r2 = new java.io.InputStreamReader     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            java.io.InputStream r5 = r4.getInputStream()     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            r2.<init>(r5)     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
            r3.<init>(r2)     // Catch: java.lang.Throwable -> L8c java.lang.Throwable -> La9
        L36:
            java.lang.String r2 = r3.readLine()     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            if (r2 == 0) goto L57
            r0.add(r2)     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            goto L36
        L40:
            r0 = move-exception
            r2 = r1
        L42:
            boolean r4 = com.tencent.bugly.proguard.w.a(r0)     // Catch: java.lang.Throwable -> La7
            if (r4 != 0) goto L4b
            r0.printStackTrace()     // Catch: java.lang.Throwable -> La7
        L4b:
            if (r3 == 0) goto L50
            r3.close()     // Catch: java.io.IOException -> L82
        L50:
            if (r2 == 0) goto L55
            r2.close()     // Catch: java.io.IOException -> L87
        L55:
            r0 = r1
            goto L1f
        L57:
            java.io.BufferedReader r2 = new java.io.BufferedReader     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            java.io.InputStreamReader r5 = new java.io.InputStreamReader     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            java.io.InputStream r4 = r4.getErrorStream()     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            r5.<init>(r4)     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
            r2.<init>(r5)     // Catch: java.lang.Throwable -> L40 java.lang.Throwable -> La4
        L65:
            java.lang.String r4 = r2.readLine()     // Catch: java.lang.Throwable -> L6f java.lang.Throwable -> La7
            if (r4 == 0) goto L71
            r0.add(r4)     // Catch: java.lang.Throwable -> L6f java.lang.Throwable -> La7
            goto L65
        L6f:
            r0 = move-exception
            goto L42
        L71:
            r3.close()     // Catch: java.io.IOException -> L7d
        L74:
            r2.close()     // Catch: java.io.IOException -> L78
            goto L1f
        L78:
            r1 = move-exception
            r1.printStackTrace()
            goto L1f
        L7d:
            r1 = move-exception
            r1.printStackTrace()
            goto L74
        L82:
            r0 = move-exception
            r0.printStackTrace()
            goto L50
        L87:
            r0 = move-exception
            r0.printStackTrace()
            goto L55
        L8c:
            r0 = move-exception
            r2 = r1
            r3 = r1
        L8f:
            if (r3 == 0) goto L94
            r3.close()     // Catch: java.io.IOException -> L9a
        L94:
            if (r2 == 0) goto L99
            r2.close()     // Catch: java.io.IOException -> L9f
        L99:
            throw r0
        L9a:
            r1 = move-exception
            r1.printStackTrace()
            goto L94
        L9f:
            r1 = move-exception
            r1.printStackTrace()
            goto L99
        La4:
            r0 = move-exception
            r2 = r1
            goto L8f
        La7:
            r0 = move-exception
            goto L8f
        La9:
            r0 = move-exception
            r2 = r1
            r3 = r1
            goto L42
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.a.a(android.content.Context, java.lang.String[]):java.util.ArrayList");
    }

    public static String a(Context context, String str) throws Throwable {
        if (str == null || str.trim().equals("")) {
            return "";
        }
        ArrayList<String> arrayListA = a(context, new String[]{"/system/bin/sh", "-c", "getprop " + str});
        if (arrayListA != null && arrayListA.size() > 0) {
            return arrayListA.get(0);
        }
        return "fail";
    }

    public static byte[] a(long j) {
        try {
            return new StringBuilder().append(j).toString().getBytes("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static long d(byte[] bArr) {
        if (bArr == null) {
            return -1L;
        }
        try {
            return Long.parseLong(new String(bArr, "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return -1L;
        }
    }

    public static Object a(String str, String str2, Object obj, Class<?>[] clsArr, Object[] objArr) throws NoSuchMethodException, SecurityException {
        try {
            Method declaredMethod = Class.forName(str).getDeclaredMethod(str2, clsArr);
            declaredMethod.setAccessible(true);
            return declaredMethod.invoke(null, objArr);
        } catch (Exception e) {
            return null;
        }
    }

    public static void a(Parcel parcel, Map<String, PlugInBean> map) {
        if (map == null || map == null || map.size() <= 0) {
            parcel.writeBundle(null);
            return;
        }
        int size = map.size();
        ArrayList arrayList = new ArrayList(size);
        ArrayList arrayList2 = new ArrayList(size);
        for (Map.Entry<String, PlugInBean> entry : map.entrySet()) {
            arrayList.add(entry.getKey());
            arrayList2.add(entry.getValue());
        }
        Bundle bundle = new Bundle();
        bundle.putInt("pluginNum", arrayList.size());
        for (int i = 0; i < arrayList.size(); i++) {
            bundle.putString("pluginKey" + i, (String) arrayList.get(i));
        }
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            bundle.putString("pluginVal" + i2 + "plugInId", ((PlugInBean) arrayList2.get(i2)).a);
            bundle.putString("pluginVal" + i2 + "plugInUUID", ((PlugInBean) arrayList2.get(i2)).c);
            bundle.putString("pluginVal" + i2 + "plugInVersion", ((PlugInBean) arrayList2.get(i2)).b);
        }
        parcel.writeBundle(bundle);
    }

    public static Map<String, PlugInBean> a(Parcel parcel) {
        HashMap map;
        Bundle bundle = parcel.readBundle();
        if (bundle == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int iIntValue = ((Integer) bundle.get("pluginNum")).intValue();
        for (int i = 0; i < iIntValue; i++) {
            arrayList.add(bundle.getString("pluginKey" + i));
        }
        for (int i2 = 0; i2 < iIntValue; i2++) {
            arrayList2.add(new PlugInBean(bundle.getString("pluginVal" + i2 + "plugInId"), bundle.getString("pluginVal" + i2 + "plugInVersion"), bundle.getString("pluginVal" + i2 + "plugInUUID")));
        }
        if (arrayList.size() == arrayList2.size()) {
            HashMap map2 = new HashMap(arrayList.size());
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                map2.put(arrayList.get(i3), PlugInBean.class.cast(arrayList2.get(i3)));
            }
            map = map2;
        } else {
            w.e("map plugin parcel error!", new Object[0]);
            map = null;
        }
        return map;
    }

    public static void b(Parcel parcel, Map<String, String> map) {
        if (map == null || map == null || map.size() <= 0) {
            parcel.writeBundle(null);
            return;
        }
        int size = map.size();
        ArrayList<String> arrayList = new ArrayList<>(size);
        ArrayList<String> arrayList2 = new ArrayList<>(size);
        for (Map.Entry<String, String> entry : map.entrySet()) {
            arrayList.add(entry.getKey());
            arrayList2.add(entry.getValue());
        }
        Bundle bundle = new Bundle();
        bundle.putStringArrayList("keys", arrayList);
        bundle.putStringArrayList("values", arrayList2);
        parcel.writeBundle(bundle);
    }

    public static Map<String, String> b(Parcel parcel) {
        HashMap map;
        Bundle bundle = parcel.readBundle();
        if (bundle == null) {
            return null;
        }
        ArrayList<String> stringArrayList = bundle.getStringArrayList("keys");
        ArrayList<String> stringArrayList2 = bundle.getStringArrayList("values");
        if (stringArrayList != null && stringArrayList2 != null && stringArrayList.size() == stringArrayList2.size()) {
            HashMap map2 = new HashMap(stringArrayList.size());
            for (int i = 0; i < stringArrayList.size(); i++) {
                map2.put(stringArrayList.get(i), stringArrayList2.get(i));
            }
            map = map2;
        } else {
            w.e("map parcel error!", new Object[0]);
            map = null;
        }
        return map;
    }

    public static <T> T a(byte[] bArr, Parcelable.Creator<T> creator) {
        T tCreateFromParcel;
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.unmarshall(bArr, 0, bArr.length);
        parcelObtain.setDataPosition(0);
        try {
            try {
                tCreateFromParcel = creator.createFromParcel(parcelObtain);
                if (parcelObtain != null) {
                    parcelObtain.recycle();
                }
            } catch (Throwable th) {
                th.printStackTrace();
                if (parcelObtain != null) {
                    parcelObtain.recycle();
                }
                tCreateFromParcel = null;
            }
            return tCreateFromParcel;
        } catch (Throwable th2) {
            if (parcelObtain != null) {
                parcelObtain.recycle();
            }
            throw th2;
        }
    }

    public static String a(Context context, int i, String str) throws Throwable {
        Process processExec;
        if (!AppInfo.a(context, "android.permission.READ_LOGS")) {
            w.d("no read_log permission!", new Object[0]);
            return null;
        }
        String[] strArr = str == null ? new String[]{"logcat", "-d", "-v", "threadtime"} : new String[]{"logcat", "-d", "-v", "threadtime", "-s", str};
        Process process = null;
        StringBuilder sb = new StringBuilder();
        try {
            try {
                processExec = Runtime.getRuntime().exec(strArr);
            } catch (Throwable th) {
                th = th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(processExec.getInputStream()));
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line).append("\n");
                if (i > 0 && sb.length() > i) {
                    sb.delete(0, sb.length() - i);
                }
            }
            String string = sb.toString();
            if (processExec == null) {
                return string;
            }
            try {
                processExec.getOutputStream().close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                processExec.getInputStream().close();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            try {
                processExec.getErrorStream().close();
                return string;
            } catch (IOException e3) {
                e3.printStackTrace();
                return string;
            }
        } catch (Throwable th3) {
            th = th3;
            process = processExec;
            if (process != null) {
                try {
                    process.getOutputStream().close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                try {
                    process.getInputStream().close();
                } catch (IOException e5) {
                    e5.printStackTrace();
                }
                try {
                    process.getErrorStream().close();
                } catch (IOException e6) {
                    e6.printStackTrace();
                }
            }
            throw th;
        }
    }

    public static Map<String, String> a(int i, boolean z) {
        HashMap map = new HashMap(12);
        Map<Thread, StackTraceElement[]> allStackTraces = Thread.getAllStackTraces();
        if (allStackTraces == null) {
            return null;
        }
        Thread.currentThread().getId();
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Thread, StackTraceElement[]> entry : allStackTraces.entrySet()) {
            sb.setLength(0);
            if (entry.getValue() != null && entry.getValue().length != 0) {
                StackTraceElement[] value = entry.getValue();
                int length = value.length;
                int i2 = 0;
                while (true) {
                    if (i2 >= length) {
                        break;
                    }
                    StackTraceElement stackTraceElement = value[i2];
                    if (i > 0 && sb.length() >= i) {
                        sb.append("\n[Stack over limit size :" + i + " , has been cutted !]");
                        break;
                    }
                    sb.append(stackTraceElement.toString()).append("\n");
                    i2++;
                }
                map.put(entry.getKey().getName() + "(" + entry.getKey().getId() + ")", sb.toString());
            }
        }
        return map;
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x001f, code lost:
    
        r0 = null;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v2, types: [boolean] */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8, types: [java.io.DataInputStream] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static synchronized byte[] a(int r7) {
        /*
            r1 = 0
            java.lang.Class<com.tencent.bugly.proguard.a> r3 = com.tencent.bugly.proguard.a.class
            monitor-enter(r3)
            r0 = 16
            byte[] r0 = new byte[r0]     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            java.io.DataInputStream r2 = new java.io.DataInputStream     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            java.io.File r5 = new java.io.File     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            java.lang.String r6 = "/dev/urandom"
            r5.<init>(r6)     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            r4.<init>(r5)     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            r2.<init>(r4)     // Catch: java.lang.Exception -> L21 java.lang.Throwable -> L4c
            r2.readFully(r0)     // Catch: java.lang.Throwable -> L63 java.lang.Exception -> L65
            r2.close()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
        L1f:
            monitor-exit(r3)
            return r0
        L21:
            r0 = move-exception
            r2 = r1
        L23:
            java.lang.String r4 = "Failed to read from /dev/urandom : %s"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch: java.lang.Throwable -> L63
            r6 = 0
            r5[r6] = r0     // Catch: java.lang.Throwable -> L63
            com.tencent.bugly.proguard.w.e(r4, r5)     // Catch: java.lang.Throwable -> L63
            if (r2 == 0) goto L33
            r2.close()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
        L33:
            java.lang.String r0 = "AES"
            javax.crypto.KeyGenerator r0 = javax.crypto.KeyGenerator.getInstance(r0)     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            r2 = 128(0x80, float:1.8E-43)
            java.security.SecureRandom r4 = new java.security.SecureRandom     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            r4.<init>()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            r0.init(r2, r4)     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            javax.crypto.SecretKey r0 = r0.generateKey()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            byte[] r0 = r0.getEncoded()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
            goto L1f
        L4c:
            r0 = move-exception
            r2 = r1
        L4e:
            if (r2 == 0) goto L53
            r2.close()     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
        L53:
            throw r0     // Catch: java.lang.Exception -> L54 java.lang.Throwable -> L60
        L54:
            r0 = move-exception
            boolean r2 = com.tencent.bugly.proguard.w.b(r0)     // Catch: java.lang.Throwable -> L60
            if (r2 != 0) goto L5e
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L60
        L5e:
            r0 = r1
            goto L1f
        L60:
            r0 = move-exception
            monitor-exit(r3)
            throw r0
        L63:
            r0 = move-exception
            goto L4e
        L65:
            r0 = move-exception
            goto L23
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.proguard.a.a(int):byte[]");
    }

    public static byte[] a(int i, byte[] bArr, byte[] bArr2) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(i, secretKeySpec, new IvParameterSpec(bArr2));
            return cipher.doFinal(bArr);
        } catch (Exception e) {
            if (!w.b(e)) {
                e.printStackTrace();
            }
            return null;
        }
    }

    public static byte[] b(int i, byte[] bArr, byte[] bArr2) throws InvalidKeySpecException, NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException {
        try {
            PublicKey publicKeyGeneratePublic = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(bArr2));
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(1, publicKeyGeneratePublic);
            return cipher.doFinal(bArr);
        } catch (Exception e) {
            if (!w.b(e)) {
                e.printStackTrace();
            }
            return null;
        }
    }

    public static boolean a(Context context, String str, long j) {
        w.c("[Util] try to lock file:%s (pid=%d | tid=%d)", str, Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
        try {
            File file = new File(context.getFilesDir() + File.separator + str);
            if (file.exists()) {
                if (System.currentTimeMillis() - file.lastModified() < j) {
                    return false;
                }
                w.c("[Util] lock file(%s) is expired, unlock it", str);
                b(context, str);
            }
            if (!file.createNewFile()) {
                return false;
            }
            w.c("[Util] successfully locked file:%s (pid=%d | tid=%d)", str, Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
            return true;
        } catch (Throwable th) {
            w.a(th);
            return false;
        }
    }

    public static boolean b(Context context, String str) {
        w.c("[Util] try to unlock file:%s (pid=%d | tid=%d)", str, Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
        try {
            File file = new File(context.getFilesDir() + File.separator + str);
            if (!file.exists()) {
                return true;
            }
            if (!file.delete()) {
                return false;
            }
            w.c("[Util] successfully unlocked file:%s (pid=%d | tid=%d)", str, Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
            return true;
        } catch (Throwable th) {
            w.a(th);
            return false;
        }
    }

    public static BufferedReader a(File file) {
        if (file == null || !file.exists() || !file.canRead()) {
            return null;
        }
        try {
            return new BufferedReader(new InputStreamReader(new FileInputStream(file), "utf-8"));
        } catch (Throwable th) {
            w.a(th);
            return null;
        }
    }

    public static BufferedReader a(String str, String str2) {
        if (str == null) {
            return null;
        }
        try {
            File file = new File(str, str2);
            if (file.exists() && file.canRead()) {
                return a(file);
            }
            return null;
        } catch (NullPointerException e) {
            w.a(e);
            return null;
        }
    }
}
