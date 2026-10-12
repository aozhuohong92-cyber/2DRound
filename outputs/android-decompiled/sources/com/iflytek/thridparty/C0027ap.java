package com.iflytek.thridparty;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.iflytek.thridparty.ap, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0027ap {
    HashMap<String, String> a = new HashMap<>();

    public C0027ap() {
    }

    public C0027ap(String str, String[][] strArr) {
        a(str);
        a(strArr);
    }

    public static String f(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return str.replaceAll("[,\n ]", "|");
    }

    public int a(String str, int i) {
        String str2 = this.a.get(str);
        if (str2 == null) {
            return i;
        }
        try {
            return Integer.parseInt(str2);
        } catch (Exception e) {
            return i;
        }
    }

    public void a() {
        this.a.clear();
    }

    public void a(C0027ap c0027ap) {
        if (c0027ap != null) {
            this.a.putAll(c0027ap.c());
        }
    }

    public void a(C0027ap c0027ap, String str) {
        if (c0027ap == null) {
            return;
        }
        a(str, c0027ap.e(str));
    }

    public void a(String str) {
        this.a.clear();
        b(str);
    }

    public void a(String str, String str2) {
        a(str, str2, true);
    }

    public void a(String str, String str2, boolean z) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        if (z || !this.a.containsKey(str)) {
            this.a.put(str, str2);
        }
    }

    public void a(String[][] strArr) {
        if (strArr == null) {
            return;
        }
        for (String[] strArr2 : strArr) {
            if (this.a.containsKey(strArr2[0])) {
                String str = this.a.get(strArr2[0]);
                this.a.remove(strArr2[0]);
                for (int i = 1; i < strArr2.length; i++) {
                    this.a.put(strArr2[i], str);
                }
            }
        }
    }

    public boolean a(String str, boolean z) {
        String str2 = this.a.get(str);
        if (str2 == null) {
            return z;
        }
        if (str2.equals("true") || str2.equals("1")) {
            return true;
        }
        if (str2.equals("false") || str2.equals("0")) {
            return false;
        }
        return z;
    }

    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public C0027ap clone() {
        C0027ap c0027ap = new C0027ap();
        c0027ap.a = (HashMap) this.a.clone();
        return c0027ap;
    }

    public String b(String str, String str2) {
        String str3 = this.a.get(str);
        return str3 == null ? str2 : str3;
    }

    public void b(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        for (String str2 : str.split(",")) {
            int iIndexOf = str2.indexOf("=");
            if (iIndexOf > 0 && iIndexOf < str2.length()) {
                this.a.put(str2.substring(0, iIndexOf), str2.substring(iIndexOf + 1));
            }
        }
    }

    public Boolean c(String str) {
        return Boolean.valueOf(this.a.remove(str) != null);
    }

    public HashMap<String, String> c() {
        return this.a;
    }

    public String d(String str) {
        return this.a.remove(str);
    }

    public void d() {
        for (Map.Entry<String, String> entry : this.a.entrySet()) {
            entry.setValue(f(entry.getValue()));
        }
    }

    public String e(String str) {
        return this.a.get(str);
    }

    public boolean g(String str) {
        return this.a.containsKey(str);
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        for (Map.Entry<String, String> entry : this.a.entrySet()) {
            stringBuffer.append(entry.getKey());
            stringBuffer.append("=");
            stringBuffer.append(entry.getValue());
            stringBuffer.append(",");
        }
        if (stringBuffer.length() > 0) {
            stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        }
        String string = stringBuffer.toString();
        C0020ai.c(string);
        return string;
    }
}
