package com.iflytek.thridparty;

import android.content.Context;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.speech.VoiceWakeuperAidl;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class bf {
    private static bf a;
    private bn b;
    private Context d;
    private bg e;
    private bk f;
    private bc c = null;
    private bd g = new bi(this);

    private bf(Context context) {
        this.b = new bn(context);
        this.d = context;
        this.f = new bk(context);
        this.e = new bg(this.b);
        bm.a(this.d, "load settings: pkgRun=" + this.e.g() + " periodRun=" + this.e.a() + " periodUpdate=" + this.e.b());
    }

    public static synchronized bf a(Context context) {
        if (a == null) {
            a = new bf(context);
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(String str, int i) throws JSONException {
        if (i != 0 || str == null) {
            bm.a(this.d, "get config error:" + i);
        } else {
            this.e.c(System.currentTimeMillis());
            bm.a(this.d, "get config success");
            bm.a(this.d, str);
            b(str);
            be.a(this.d);
        }
        this.c = null;
    }

    private void b(String str) throws JSONException {
        if (str == null || str.length() <= 0) {
            bm.a("LaunchSettings", "loadJson empty.");
            return;
        }
        try {
            String str2 = "";
            JSONObject jSONObject = new JSONObject(new JSONTokener(str));
            long j = jSONObject.getLong("updateperiod");
            JSONObject jSONObject2 = jSONObject.getJSONObject("launch");
            JSONArray jSONArray = jSONObject2.getJSONArray("runpackage");
            String[] strArr = new String[jSONArray.length()];
            for (int i = 0; i < jSONArray.length(); i++) {
                strArr[i] = jSONArray.getString(i);
                str2 = str2 + strArr[i] + VoiceWakeuperAidl.PARAMS_SEPARATE;
            }
            long j2 = jSONObject2.getLong("runperiod");
            this.e.a(strArr);
            this.e.a(j);
            this.e.b(j2);
            bm.a(this.d, "parse json updateperiod:" + j + " runperiod:" + j2 + " runpackage:" + str2);
        } catch (JSONException e) {
            bm.a(this.d, "parse json error:" + e.getMessage());
        }
    }

    private String d() {
        return "?t=" + f() + "&p=" + e();
    }

    private String e() {
        String strA = this.f.a();
        String strB = this.f.b();
        String strF = this.e.f();
        StringBuilder sb = new StringBuilder();
        sb.append("imei=");
        if (strA == null || strA.length() == 0) {
            strA = "null";
        }
        sb.append(strA);
        sb.append(",ua=");
        sb.append(strB);
        sb.append(",appid=");
        sb.append((strF == null || strF.length() == 0) ? "null" : strF);
        sb.append(",sdkver=2.0");
        sb.append(",pkg=" + this.d.getPackageName());
        String string = sb.toString();
        char[] charArray = bl.a(string.getBytes()).toCharArray();
        for (int i = 0; i < 8; i++) {
            char c = charArray[i];
            charArray[i] = charArray[(charArray.length - 8) + i];
            charArray[(charArray.length - 8) + i] = c;
        }
        StringBuilder sb2 = new StringBuilder();
        for (char c2 : charArray) {
            sb2.append(c2);
        }
        bm.a(this.d, string);
        return sb2.toString();
    }

    private String f() {
        return new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault()).format(new Date());
    }

    public void a() {
        if (this.e.d() > System.currentTimeMillis()) {
            this.e.c(System.currentTimeMillis() - this.e.b());
        }
        long jCurrentTimeMillis = System.currentTimeMillis() - this.e.d();
        long jB = this.e.b();
        if (jCurrentTimeMillis <= jB) {
            bm.a(this.d, "check update interval=" + jCurrentTimeMillis + " period=" + jB + " ret=false");
            return;
        }
        if (this.c != null) {
            bm.a("LaunchSettings", "mGetThread running.");
            return;
        }
        String str = "http://hxqd.openspeech.cn/launchconfig" + d();
        this.c = new bc(str, this.g);
        this.c.start();
        bm.a(this.d, "check update start get config ");
        bm.a(this.d, str);
    }

    public void a(long j) {
        this.e.d(j);
    }

    public void a(String str, String str2) {
        if (SpeechConstant.APPID.equals(str)) {
            this.e.a(str2);
        } else {
            bm.a("LaunchSettings", "unkown key =" + str);
        }
    }

    public boolean a(String str) {
        if (this.e.c() == null || str == null) {
            return false;
        }
        for (String str2 : this.e.c()) {
            if (str.equals(str2)) {
                return true;
            }
        }
        return false;
    }

    public boolean b() {
        if (this.e.e() > System.currentTimeMillis()) {
            this.e.d(System.currentTimeMillis() - this.e.a());
        }
        boolean z = false;
        long jCurrentTimeMillis = System.currentTimeMillis() - this.e.e();
        if (this.e.a() > 0 && jCurrentTimeMillis > this.e.a()) {
            z = true;
        }
        bm.a(this.d, "check launch interval=" + jCurrentTimeMillis + " period=" + this.e.a() + " ret=" + z);
        return z;
    }

    public long c() {
        return this.e.a();
    }
}
