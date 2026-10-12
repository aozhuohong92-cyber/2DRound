package com.iflytek.thridparty;

import android.content.Context;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.cloud.Version;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Locale;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class bq {
    public static final int a;
    public static final int b;
    public static final int c;
    public static final int d;
    public static final int e;
    private static boolean f = true;
    private static String g = "300008448508";
    private static final byte[] h = {31};
    private static final String i = new String(h);
    private static Context j = null;
    private static boolean k = false;
    private static int l;
    private static final int m;
    private static final int n;
    private static final int o;
    private static final int p;
    private static final int q;
    private static final int r;
    private static Object s;
    private static boolean v;
    private String[] t = new String[r];
    private Object u = this;

    static {
        l = 0;
        int i2 = l;
        l = i2 + 1;
        a = i2;
        int i3 = l;
        l = i3 + 1;
        m = i3;
        int i4 = l;
        l = i4 + 1;
        n = i4;
        int i5 = l;
        l = i5 + 1;
        b = i5;
        int i6 = l;
        l = i6 + 1;
        o = i6;
        int i7 = l;
        l = i7 + 1;
        p = i7;
        int i8 = l;
        l = i8 + 1;
        q = i8;
        int i9 = l;
        l = i9 + 1;
        c = i9;
        int i10 = l;
        l = i10 + 1;
        d = i10;
        int i11 = l;
        l = i11 + 1;
        e = i11;
        r = l;
        s = new Object();
        v = MSC.isIflyVersion() ? false : true;
    }

    private bq() {
        g();
    }

    private static String a(String str) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS", Locale.CHINA).format(Long.valueOf(str));
        } catch (Exception e2) {
            h("DC exception:" + e2.getLocalizedMessage());
            e2.printStackTrace();
            return null;
        }
    }

    public static synchronized void a() {
        g("DC destory enter.");
        synchronized (s) {
            try {
                j = null;
                k = false;
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
        }
        g("DC destory leave.");
    }

    private static void a(Context context) {
        synchronized (s) {
            j = context;
        }
    }

    private static synchronized void a(boolean z) {
        synchronized (s) {
            f = z;
        }
    }

    private static final boolean a(int i2) {
        return n == i2 || o == i2 || p == i2 || q == i2;
    }

    public static synchronized boolean a(Context context, String str, boolean z) {
        g("DC init enter.");
        synchronized (s) {
            try {
                a(z);
                a(context);
                c(str);
                f();
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
        }
        g("DC init leave.");
        return false;
    }

    public static synchronized boolean b() {
        boolean z;
        g("DC getEnable enter.");
        synchronized (s) {
            g("DC getEnable static value=" + f);
            z = f;
        }
        if (z) {
            String strD = d("idc");
            g("DC getEnable msc val=" + strD);
            if (!TextUtils.isEmpty(strD)) {
                if ("li".equalsIgnoreCase(strD)) {
                    v = true;
                } else {
                    v = false;
                }
            }
            z = v;
        }
        g("DC getEnable value=" + z);
        g("DC getEnable leave.");
        return z;
    }

    private static boolean b(String str) {
        return str != null && str.length() >= 12;
    }

    private static void c(String str) {
        synchronized (s) {
            if (b(str)) {
                g = str;
            }
        }
    }

    public static boolean c() {
        boolean z;
        f("DC isActive enter.");
        synchronized (s) {
            z = k;
        }
        g("DC isActive=" + z);
        f("DC isActive leave.");
        return z;
    }

    public static synchronized bq d() {
        bq bqVar;
        g("DC create enter.");
        bqVar = new bq();
        g("DC create leave.");
        return bqVar;
    }

    private static String d(String str) throws UnsupportedEncodingException {
        String str2;
        String str3 = null;
        g("getMscParameter enter key=" + str);
        if (!MSC.isLoaded()) {
            h("getMscParameter MSC is not loaded");
        } else if (TextUtils.isEmpty(str)) {
            h("getMscParameter key is empty");
        } else {
            try {
                SpeechUtility utility = SpeechUtility.getUtility();
                String parameter = utility != null ? utility.getParameter("pte") : null;
                String str4 = TextUtils.isEmpty(parameter) ? "utf-8" : parameter;
                byte[] bytes = str.getBytes(str4);
                MSCSessionInfo mSCSessionInfo = new MSCSessionInfo();
                int iQMSPGetParam = MSC.QMSPGetParam(bytes, mSCSessionInfo);
                if (iQMSPGetParam == 0) {
                    str2 = new String(mSCSessionInfo.buffer, str4);
                } else {
                    h("getMscParameter MSC return " + iQMSPGetParam);
                    str2 = null;
                }
                str3 = str2;
            } catch (Exception e2) {
                e2.printStackTrace();
            } catch (UnsatisfiedLinkError e3) {
                e3.printStackTrace();
            }
        }
        g("getMscParameter value=" + str3);
        g("getMscParameter leave");
        return str3;
    }

    private static void e(String str) {
    }

    private static void f() {
        f("DC inner init enter.");
        synchronized (s) {
            try {
                if (!b()) {
                    g("DC init is not enable.");
                } else if (m() != null) {
                    g("DC calling MA.init");
                    C0038b.d(m(), l(), "MobileMarket");
                    g("DC MA.init end");
                    k = true;
                }
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
        }
        f("DC inner init leave.");
    }

    private static void f(String str) {
    }

    private void g() {
        g("DC resetAllValues enter.");
        synchronized (this.u) {
            for (int i2 = 0; i2 < this.t.length; i2++) {
                try {
                    this.t[i2] = "";
                } catch (Exception e2) {
                    h("DC exception:" + e2.getLocalizedMessage());
                    e2.printStackTrace();
                }
            }
        }
        g("DC resetAllValues leave.");
    }

    private static void g(String str) {
        C0020ai.a(str);
    }

    private void h() {
        g("DC resetDynamicValues enter.");
        synchronized (this.u) {
            for (int i2 = 0; i2 < this.t.length; i2++) {
                try {
                    if (!a(i2)) {
                        this.t[i2] = "";
                    }
                } catch (Exception e2) {
                    h("DC exception:" + e2.getLocalizedMessage());
                    e2.printStackTrace();
                }
            }
        }
        g("DC resetDynamicValues leave.");
    }

    private static void h(String str) {
        C0020ai.b(str);
    }

    private void i() {
        g("DC initStaticValues enter.");
        synchronized (this.u) {
            try {
                if (TextUtils.isEmpty(this.t[n])) {
                    this.t[n] = SpeechUtility.getUtility().getParameter(SpeechConstant.APPID);
                    f("DC info APPID:" + this.t[n]);
                }
                if (TextUtils.isEmpty(this.t[o])) {
                    this.t[o] = Version.getVersion();
                }
                if (TextUtils.isEmpty(this.t[p])) {
                    this.t[p] = N.a(j).e("os.imsi");
                }
                if (TextUtils.isEmpty(this.t[q])) {
                    this.t[q] = N.a(j).e("os.imei");
                }
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
            if (TextUtils.isEmpty(this.t[m])) {
                this.t[m] = k();
            }
        }
        g("DC initStaticValues leave.");
    }

    private final void j() {
        f("DC check enter.");
        for (int i2 = 0; i2 < this.t.length; i2++) {
            try {
                if (this.t[i2] == null) {
                    this.t[i2] = "";
                }
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
        }
        f("DC check leave.");
    }

    private static synchronized String k() {
        String strSubstring;
        g("DC getUid enter.");
        strSubstring = null;
        try {
            String parameter = SpeechUtility.getUtility().getParameter("pte");
            if (TextUtils.isEmpty(parameter)) {
                parameter = "utf-8";
            }
            MSCSessionInfo mSCSessionInfo = new MSCSessionInfo();
            int iQMSPGetParam = MSC.QMSPGetParam("loginid".getBytes(parameter), mSCSessionInfo);
            if (iQMSPGetParam == 0) {
                String strTrim = new String(mSCSessionInfo.buffer).trim();
                f("DC getUid loginid=" + strTrim);
                int iIndexOf = strTrim.indexOf("@");
                if (iIndexOf < 0 || iIndexOf >= strTrim.length()) {
                    h("DC getUid error, loginid has no tag of @:" + strTrim);
                } else {
                    strSubstring = strTrim.substring(0, iIndexOf);
                }
            } else {
                h("DC getUid error:" + iQMSPGetParam);
            }
        } catch (Exception e2) {
            h("DC exception:" + e2.getLocalizedMessage());
            e2.printStackTrace();
        }
        g("DC getUid leave.");
        return strSubstring;
    }

    private static String l() {
        String str;
        synchronized (s) {
            str = g;
        }
        return str;
    }

    private static Context m() {
        Context context;
        synchronized (s) {
            context = j;
        }
        return context;
    }

    public void a(int i2, int i3) {
        a(i2, String.valueOf(i3));
    }

    public void a(int i2, long j2) {
        a(i2, String.valueOf(j2));
    }

    public void a(int i2, String str) {
        f("DC setData enter: key=" + i2 + ", value=" + str);
        synchronized (this.u) {
            try {
                this.t[i2] = str;
                if (c == i2 || d == i2) {
                    this.t[i2] = a(str);
                }
            } catch (Exception e2) {
                h("DC exception:" + e2.getLocalizedMessage());
                e2.printStackTrace();
            }
            if (c == i2 || d == i2 || a == i2 || b == i2) {
                g("DC info: key=" + i2 + ", value=" + this.t[i2]);
            }
        }
        f("DC setData leave.");
    }

    public boolean e() {
        g("DC flush enter.");
        try {
            if (!c()) {
                f();
            }
            if (c()) {
                i();
                j();
                StringBuffer stringBuffer = new StringBuffer();
                for (int i2 = 0; i2 < this.t.length; i2++) {
                    if (this.t[i2] != null) {
                        stringBuffer.append(this.t[i2]);
                    }
                    stringBuffer.append(i);
                }
                String strSubstring = stringBuffer.substring(0, stringBuffer.length() - 1);
                f("DC flush data=" + strSubstring);
                e(strSubstring);
                synchronized (s) {
                    if (!TextUtils.isEmpty(strSubstring) && c()) {
                        g("DC calling MA.onEvent");
                        C0038b.a(j, "iflytek", strSubstring);
                        g("DC MA.onEvent end");
                    }
                }
                h();
            }
        } catch (Exception e2) {
            h("DC exception:" + e2.getLocalizedMessage());
            e2.printStackTrace();
        }
        g("DC flush leave.");
        return true;
    }
}
