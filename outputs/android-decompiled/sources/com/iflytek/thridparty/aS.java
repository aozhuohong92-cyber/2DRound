package com.iflytek.thridparty;

import android.content.Context;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aS {
    protected Context a;
    private bb b;
    private String[] c = null;
    private String[] d = null;
    private HashMap<String, String> e = new HashMap<>();
    private HashMap<String, String> f = new HashMap<>();
    private List<aX> g = new ArrayList();
    private HashMap<String, String> h = new HashMap<>();

    public aS(Context context, bb bbVar) {
        this.b = bbVar;
        this.a = context;
    }

    private void b() {
        if (this.f.size() > 0) {
            this.f = null;
            this.f = new HashMap<>();
        }
        if (this.h.size() > 0) {
            this.h = null;
            this.h = new HashMap<>();
        }
        if (this.e.size() > 0) {
            this.e = null;
            this.e = new HashMap<>();
        }
        if (this.c == null || this.c.length <= 0) {
            return;
        }
        this.c = null;
    }

    public String[] a() throws Throwable {
        b();
        ArrayList arrayList = new ArrayList();
        HashMap<String, String> mapD = this.b.d();
        List<aX> listE = this.b.e();
        for (String str : mapD.keySet()) {
            String str2 = mapD.get(str);
            this.e.put(str + "p", str2);
            arrayList.add(str2);
            if (str2.contains("\u0000")) {
                this.h.put(str2.replace("\u0000", " "), str2);
            }
        }
        for (aX aXVar : listE) {
            String strA = aXVar.a();
            String strC = aXVar.c();
            String strB = aXVar.b();
            this.f.put(strA + "s", strC);
            this.e.put(strA + "s", strB);
            arrayList.add(strB);
            if (strB.contains("\u0000")) {
                this.h.put(strB.replace("\u0000", " "), strB);
            }
            this.g.add(aXVar);
        }
        HashSet hashSet = new HashSet(arrayList);
        this.c = (String[]) hashSet.toArray(new String[hashSet.size()]);
        return this.c;
    }
}
