package com.iflytek.thridparty;

import android.app.ActivityManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.Version;
import com.iflytek.thridparty.X;
import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.ak, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0022ak {
    private static C0022ak a = null;
    private static Context b = null;
    private static SharedPreferences c;
    private boolean h;
    private long i;
    private long j;
    private long k;
    private long l;
    private long m;
    private boolean d = false;
    private boolean e = false;
    private boolean f = false;
    private boolean g = false;
    private long n = 43200;
    private X.a o = new C0025an(this);
    private X.a p = new C0026ao(this);

    private C0022ak(Context context) {
        this.h = false;
        this.i = 0L;
        this.j = 0L;
        this.k = 0L;
        this.l = 0L;
        this.m = 0L;
        if (context != null) {
            b = context.getApplicationContext();
            c = b.getSharedPreferences("iflytek_state_" + b.getPackageName(), 0);
            this.h = c.getBoolean("is_collect", false);
            this.i = c.getLong("ti_request", 0L);
            this.j = c.getLong("ti_app_list", this.n);
            this.l = c.getLong("list_app_time", 0L);
            this.k = c.getLong("ti_app_active", this.n);
            this.m = c.getLong("active_app_time", 0L);
        }
    }

    public static C0022ak a(Context context) {
        if (a == null) {
            a = new C0022ak(context);
        }
        return a;
    }

    private static JSONObject a(JSONObject jSONObject, JSONObject jSONObject2) {
        JSONObject jSONObject3 = new JSONObject();
        try {
            jSONObject3.put("header", jSONObject2);
            jSONObject3.put("body", jSONObject);
        } catch (Throwable th) {
            C0020ai.b(th);
        }
        return jSONObject3;
    }

    private static JSONObject a(boolean z, C0027ap c0027ap, String str) {
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        for (Map.Entry<String, String> entry : c0027ap.c().entrySet()) {
            try {
                jSONObject2.put(entry.getKey(), entry.getValue());
            } catch (Throwable th) {
                C0020ai.b(th);
            }
        }
        jSONObject.put(str, jSONObject2);
        return z ? jSONObject : jSONObject2;
    }

    private void a(JSONObject jSONObject) {
        try {
            if (Y.c(b)) {
                byte[] bytes = jSONObject.toString().getBytes("utf-8");
                byte[] bArrA = R.a(bytes);
                X x = new X();
                x.b(20000);
                x.a(1);
                x.a("http://scs.openspeech.cn/scs", "cmd=statsdklog&logver=1.0.2&size=" + bytes.length, bArrA);
                x.a(this.p);
            } else {
                this.e = false;
            }
        } catch (Throwable th) {
            this.e = false;
            C0020ai.b(th);
        }
    }

    private static JSONObject b(Context context) {
        C0027ap c0027apClone = N.b(context).clone();
        C0029ar.a(context, c0027apClone);
        c0027apClone.a(SpeechConstant.APPID, C0029ar.a());
        c0027apClone.a("unique_id", C0012aa.a(context));
        c0027apClone.a("src", SpeechConstant.MODE_MSC);
        c0027apClone.a("ver", Version.getVersion());
        c0027apClone.a("lang", Locale.getDefault().getLanguage());
        c0027apClone.a("logtime", "" + System.currentTimeMillis());
        JSONObject jSONObjectA = a(false, c0027apClone, "header");
        try {
            DecimalFormat decimalFormat = new DecimalFormat("#.########");
            jSONObjectA.put("lat", decimalFormat.format(O.a(context).b("msc.lat")));
            jSONObjectA.put("lng", decimalFormat.format(O.a(context).b("msc.lng")));
        } catch (Throwable th) {
            C0020ai.b(th);
        }
        return jSONObjectA;
    }

    private boolean d() {
        try {
            return (System.currentTimeMillis() / 1000) - c.getLong("request_time", 0L) > c.getLong("ti_request", this.n);
        } catch (Throwable th) {
            C0020ai.b(th);
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void e() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("pver", "3");
            jSONObject.put("type", "app_list");
            jSONObject.put(SpeechConstant.APPID, C0029ar.a());
            jSONObject.put("src", SpeechConstant.MODE_MSC);
            C0020ai.c("CollectInfo", jSONObject.toString());
            if (Y.c(b)) {
                byte[] bArrA = R.a(jSONObject.toString().getBytes("utf-8"));
                X x = new X();
                x.b(20000);
                x.a(1);
                x.a("http://data.openspeech.cn/index.php/clientrequest/clientcollect/isCollect", "", bArrA);
                x.a(this.o);
                SharedPreferences.Editor editorEdit = c.edit();
                editorEdit.putLong("request_time", System.currentTimeMillis() / 1000);
                editorEdit.commit();
            } else {
                this.d = false;
            }
        } catch (Throwable th) {
            this.d = false;
            C0020ai.b(th);
        }
    }

    private boolean f() {
        if (!this.h) {
            return false;
        }
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        this.f = jCurrentTimeMillis - this.l > this.j;
        this.g = jCurrentTimeMillis - this.m > this.k;
        return this.f || this.g;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void g() {
        JSONArray jSONArrayI;
        JSONArray jSONArrayH;
        SharedPreferences.Editor editorEdit = c.edit();
        if (this.f) {
            this.l = System.currentTimeMillis() / 1000;
            C0020ai.c("CollectInfo", "lastListAppTime:" + this.l);
            editorEdit.putLong("list_app_time", this.l);
        }
        if (this.g) {
            this.m = System.currentTimeMillis() / 1000;
            C0020ai.c("CollectInfo", "lastActiveAppTime:" + this.m);
            editorEdit.putLong("active_app_time", this.m);
        }
        editorEdit.commit();
        try {
            JSONArray jSONArray = new JSONArray();
            if (this.f && (jSONArrayH = h()) != null) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("appinfo", jSONArrayH);
                jSONObject.put("ts", System.currentTimeMillis());
                jSONArray.put(jSONObject);
            }
            if (this.g && (jSONArrayI = i()) != null) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("hisinfo", jSONArrayI);
                jSONObject2.put("ts", System.currentTimeMillis());
                jSONArray.put(jSONObject2);
            }
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("log", jSONArray);
            JSONObject jSONObjectA = a(jSONObject3, b(b));
            C0020ai.c("CollectInfo", jSONObjectA.toString());
            a(jSONObjectA);
        } catch (Throwable th) {
            this.e = false;
            C0020ai.b(th);
        }
    }

    private JSONArray h() {
        try {
            JSONArray jSONArray = new JSONArray();
            PackageManager packageManager = b.getPackageManager();
            List<PackageInfo> installedPackages = packageManager.getInstalledPackages(0);
            int size = installedPackages.size();
            for (int i = 0; i < size; i++) {
                PackageInfo packageInfo = installedPackages.get(i);
                if ((packageInfo.applicationInfo.flags & 1) == 0) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(packageInfo.packageName, packageInfo.applicationInfo.loadLabel(packageManager).toString());
                    jSONArray.put(jSONObject);
                }
            }
            return jSONArray;
        } catch (Throwable th) {
            C0020ai.b(th);
            return null;
        }
    }

    private JSONArray i() {
        try {
            JSONArray jSONArray = new JSONArray();
            PackageManager packageManager = b.getPackageManager();
            Iterator<ActivityManager.RecentTaskInfo> it2 = ((ActivityManager) b.getSystemService("activity")).getRecentTasks(20, 1).iterator();
            while (it2.hasNext()) {
                ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(it2.next().baseIntent, 0);
                if (resolveInfoResolveActivity != null) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(resolveInfoResolveActivity.activityInfo.packageName, resolveInfoResolveActivity.loadLabel(packageManager).toString());
                    jSONArray.put(jSONObject);
                }
            }
            return jSONArray;
        } catch (Throwable th) {
            C0020ai.b(th);
            return null;
        }
    }

    public synchronized void a() {
        if (!this.d) {
            this.d = true;
            if (d()) {
                new Thread(new RunnableC0023al(this)).start();
            } else {
                this.d = false;
            }
        }
    }

    public synchronized void b() {
        if (!this.e) {
            this.e = true;
            if (f()) {
                new Thread(new RunnableC0024am(this)).start();
            } else {
                this.e = false;
            }
        }
    }
}
