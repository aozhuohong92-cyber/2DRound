package com.iflytek.thridparty;

import android.content.Context;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.RequestListener;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.cloud.util.FileDownloadListener;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import com.iflytek.thridparty.X;
import java.io.UnsupportedEncodingException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* renamed from: com.iflytek.thridparty.s, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0055s {
    private static String A = "http://wke.openspeech.cn/wakeup/";
    private Context w;
    private X x;
    private S z;
    private String b = "athinfo";
    private String c = "respath";
    private String d = SpeechConstant.APPID;
    private String e = "resid";
    private String f = "wakelist";
    private String g = "restype";
    private String h = "uid";
    private String i = "expiredate";
    private String j = "resver";
    private String k = "restime";
    private String l = "wakever";
    private String m = "ivwword";
    private String n = "words";
    private String o = "text";
    private String p = "threshold";
    private String q = "d";
    private String r = "netval";
    private String s = ":";
    private String t = "unkown";
    private String u = "header";
    private String v = "info";
    private RequestListener y = null;
    public X.a a = new C0056t(this);

    public C0055s(Context context) {
        this.w = null;
        this.x = null;
        this.z = null;
        this.w = context;
        this.z = S.a(this.w);
        this.x = new X();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private JSONObject a(JSONObject jSONObject, JSONObject jSONObject2) {
        JSONObject jSONObject3 = null;
        jSONObject3 = null;
        jSONObject3 = null;
        jSONObject3 = null;
        jSONObject3 = null;
        jSONObject3 = null;
        jSONObject3 = null;
        try {
            if (jSONObject.getString(this.j).equalsIgnoreCase(this.t)) {
                C0020ai.c("user ivw resver unkown");
                jSONObject = null;
            } else if (jSONObject2.getString(this.j).equalsIgnoreCase(this.t) || !jSONObject.getString(this.j).equalsIgnoreCase(jSONObject2.getString(this.j))) {
                C0020ai.c("cfg ivw resver unkown or unequal");
            } else if (Q.a(this.d, jSONObject, jSONObject2) && Q.a(this.e, jSONObject, jSONObject2) && Q.a(this.g, jSONObject, jSONObject2) && Q.a(this.f, jSONObject, jSONObject2)) {
                boolean zB = Q.b(this.k, jSONObject, jSONObject2);
                jSONObject3 = zB;
                if (zB != 0) {
                    jSONObject = jSONObject2;
                    jSONObject3 = zB;
                }
            }
            return jSONObject;
        } catch (JSONException e) {
            e.printStackTrace();
            return jSONObject3;
        }
    }

    private JSONObject c(String str, String str2) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(this.c, str);
            JSONObject jSONObject2 = new JSONObject(new JSONTokener(str2));
            JSONObject jSONObject3 = jSONObject2.getJSONObject(this.b);
            jSONObject.put(this.d, jSONObject3.getString(this.d));
            jSONObject.put(this.e, jSONObject3.getString(this.e));
            String string = jSONObject3.getString(this.g);
            jSONObject.put(this.g, string);
            if (!this.q.equalsIgnoreCase(string)) {
                jSONObject.put(this.h, jSONObject3.getString(this.h));
                jSONObject.put(this.i, jSONObject3.getString(this.i));
            }
            JSONArray jSONArray = jSONObject2.getJSONObject(this.m).getJSONArray(this.n);
            String str3 = "";
            for (int i = 0; i < jSONArray.length(); i++) {
                str3 = (((str3 + jSONArray.getJSONObject(i).getString(this.o)) + this.s) + jSONArray.getJSONObject(i).getInt(this.p)) + ",";
            }
            jSONObject.put(this.f, str3.substring(0, str3.length() - 1));
            try {
                jSONObject.put(this.j, jSONObject2.getString(this.j));
            } catch (JSONException e) {
                jSONObject.put(this.j, this.t);
            }
            try {
                jSONObject.put(this.k, jSONObject2.getLong(this.k));
            } catch (JSONException e2) {
                jSONObject.put(this.k, 0L);
            }
            jSONObject.put(this.l, SpeechUtility.getUtility() != null ? SpeechUtility.getUtility().getParameter("ver_ivw") : "");
            C0020ai.c("root:" + jSONObject.toString());
            return jSONObject;
        } catch (JSONException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public int a(String str, String str2, String str3, FileDownloadListener fileDownloadListener) {
        return (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) ? ErrorCode.ERROR_INVALID_PARAM : this.z.a(str, str2, str3, fileDownloadListener);
    }

    public int a(JSONObject jSONObject, RequestListener requestListener) throws Throwable {
        if (jSONObject == null) {
            return ErrorCode.ERROR_INVALID_DATA;
        }
        if (requestListener != null) {
            try {
                this.y = requestListener;
            } catch (Exception e) {
                C0020ai.a(e);
                return ErrorCode.ERROR_NET_EXCEPTION;
            }
        }
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put(this.u, C0029ar.d(this.w, new C0027ap()));
        jSONObject2.put(this.v, jSONObject);
        C0020ai.c("post data:" + jSONObject2);
        byte[] bArrA = R.a(jSONObject2.toString().getBytes());
        this.x.a(1);
        this.x.a(A, null, bArrA);
        this.x.a(this.a);
        return 0;
    }

    public synchronized JSONObject a(String str, String str2) {
        JSONObject jSONObjectB;
        if (TextUtils.isEmpty(str2)) {
            jSONObjectB = b(str, "");
        } else {
            jSONObjectB = b(str, "");
            if (jSONObjectB == null) {
                jSONObjectB = null;
            } else {
                JSONObject jSONObjectB2 = b(str2, "");
                if (jSONObjectB2 != null) {
                    jSONObjectB = a(jSONObjectB, jSONObjectB2);
                }
            }
        }
        return jSONObjectB;
    }

    public void a() {
        if (this.x != null) {
            this.x.a();
            this.x = null;
        }
        this.y = null;
    }

    public JSONObject b(String str, String str2) {
        MSCSessionInfo mSCSessionInfo = new MSCSessionInfo();
        int iQIVWGetResInfo = MSC.QIVWGetResInfo(str.getBytes(), str2.getBytes(), mSCSessionInfo);
        if (iQIVWGetResInfo != 0) {
            C0020ai.b("read ivw resoure error:" + iQIVWGetResInfo);
            return null;
        }
        try {
            String str3 = new String(mSCSessionInfo.buffer, "utf-8");
            C0020ai.c("resInfo:" + new String(mSCSessionInfo.buffer));
            return c(str, str3);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
