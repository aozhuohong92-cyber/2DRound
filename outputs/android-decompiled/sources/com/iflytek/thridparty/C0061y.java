package com.iflytek.thridparty;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.iflytek.speech.UtilityConfig;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.iflytek.thridparty.y, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0061y {
    JSONObject a = new JSONObject();
    long b = 0;
    long c = 0;

    public synchronized String a() {
        return this.a.toString();
    }

    public void a(C0027ap c0027ap) {
        this.c = System.currentTimeMillis();
        this.b = SystemClock.elapsedRealtime();
        a("app_start", Q.a(this.c), false);
        String strE = c0027ap.e(UtilityConfig.KEY_CALLER_APPID);
        if (!TextUtils.isEmpty(strE)) {
            a("app_caller_appid", strE, false);
        }
        String strE2 = N.a((Context) null).e("app.ver.code");
        if (TextUtils.isEmpty(strE2)) {
            return;
        }
        a("app_cver", strE2, false);
    }

    public synchronized void a(String str) {
        a(str, SystemClock.elapsedRealtime() - this.b, false);
    }

    public synchronized void a(String str, long j, boolean z) {
        if (!TextUtils.isEmpty(str)) {
            try {
                if (z) {
                    JSONArray jSONArrayOptJSONArray = this.a.optJSONArray(str);
                    if (jSONArrayOptJSONArray == null) {
                        jSONArrayOptJSONArray = new JSONArray();
                        this.a.put(str, jSONArrayOptJSONArray);
                    }
                    if (jSONArrayOptJSONArray != null) {
                        jSONArrayOptJSONArray.put(j);
                    }
                } else {
                    this.a.put(str, j);
                }
            } catch (JSONException e) {
                C0020ai.a(e);
            }
        }
    }

    public synchronized void a(String str, String str2, boolean z) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            try {
                if (z) {
                    JSONArray jSONArrayOptJSONArray = this.a.optJSONArray(str);
                    if (jSONArrayOptJSONArray == null) {
                        jSONArrayOptJSONArray = new JSONArray();
                        this.a.put(str, jSONArrayOptJSONArray);
                    }
                    if (jSONArrayOptJSONArray != null) {
                        jSONArrayOptJSONArray.put(str2);
                    }
                } else {
                    this.a.put(str, str2);
                }
            } catch (JSONException e) {
                C0020ai.a(e);
            }
        }
    }
}
