package com.iflytek.thridparty;

import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.Field;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class bk {
    private String a;
    private String b;
    private String c;
    private String d;
    private TelephonyManager e;

    public bk(Context context) {
        this.e = (TelephonyManager) context.getSystemService("phone");
        a();
        this.d = a(context);
        String str = Build.VERSION.SDK_INT > 7 ? Build.HARDWARE : "";
        this.c = "Android";
        this.b = String.valueOf(a("MANUFACTURER")) + "|" + a("MODEL") + "|" + a("PRODUCT") + "|ANDROID" + Build.VERSION.RELEASE + "|" + this.d + "|" + str;
    }

    private String a(Context context) {
        int height;
        int width;
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        if (defaultDisplay.getOrientation() == 0) {
            height = defaultDisplay.getWidth();
            width = defaultDisplay.getHeight();
        } else {
            height = defaultDisplay.getHeight();
            width = defaultDisplay.getWidth();
        }
        return height + "*" + width;
    }

    private String a(String str) throws NoSuchFieldException {
        try {
            Field field = Build.class.getField(str);
            Build build = new Build();
            if (field != null) {
                return field.get(build).toString();
            }
        } catch (Exception e) {
            bm.a("", "", e);
        }
        return "";
    }

    public String a() {
        try {
            if (this.a == null || this.a.length() <= 0) {
                this.a = this.e.getDeviceId();
                bm.a("", "getIMEI:" + this.a);
            }
        } catch (Exception e) {
            bm.a("", "", e);
        }
        return this.a;
    }

    public String b() {
        return this.b;
    }
}
