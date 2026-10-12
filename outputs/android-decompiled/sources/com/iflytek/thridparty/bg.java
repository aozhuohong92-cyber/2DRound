package com.iflytek.thridparty;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class bg {
    private long a;
    private long b;
    private String[] c;
    private long d;
    private long e;
    private String f;
    private bn g;

    public bg(bn bnVar) {
        this.d = 0L;
        this.e = 0L;
        this.g = bnVar;
        this.a = this.g.b("KEY_PERIOD_RUN", 0L);
        this.b = this.g.b("KEY_PERIOD_UPDATE", 259200000L);
        String strB = this.g.b("KEY_PKG_RUN", (String) null);
        if (strB != null && strB.length() > 0) {
            this.c = strB.split(",");
        }
        this.d = this.g.b("KEY_LAST_UPDATE", 0L);
        this.e = this.g.b("KEY_LAST_LAUNCH", 0L);
        this.f = this.g.b("KEY_APPID", (String) null);
    }

    public long a() {
        return this.a;
    }

    public void a(long j) {
        this.g.a("KEY_PERIOD_UPDATE", j);
        this.b = j;
    }

    public void a(String str) {
        this.f = str;
        this.g.a("KEY_APPID", str);
    }

    public void a(String[] strArr) {
        String str = "";
        if (strArr != null) {
            for (String str2 : strArr) {
                if (str2 != null && str2.length() > 0) {
                    if (str.length() > 0) {
                        str = str + ",";
                    }
                    str = str + str2;
                }
            }
        }
        this.g.a("KEY_PKG_RUN", str);
        this.c = strArr;
    }

    public long b() {
        return this.b;
    }

    public void b(long j) {
        this.g.a("KEY_PERIOD_RUN", j);
        this.a = j;
    }

    public void c(long j) {
        this.d = j;
        this.g.a("KEY_LAST_UPDATE", j);
    }

    public String[] c() {
        return this.c;
    }

    public long d() {
        return this.d;
    }

    public void d(long j) {
        this.e = j;
        this.g.a("KEY_LAST_LAUNCH", j);
    }

    public long e() {
        return this.e;
    }

    public String f() {
        return this.f;
    }

    public String g() {
        String str = "";
        if (this.c != null) {
            for (String str2 : this.c) {
                str = str + str2 + ",";
            }
        }
        return str;
    }
}
