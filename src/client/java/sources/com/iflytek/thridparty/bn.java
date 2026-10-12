package com.iflytek.thridparty;

import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class bn {
    private SharedPreferences a;

    public bn(Context context) {
        this.a = context.getSharedPreferences("ifly_launch_lib", 0);
    }

    public final void a(String str, long j) {
        try {
            SharedPreferences.Editor editorEdit = this.a.edit();
            editorEdit.putLong(str, j);
            editorEdit.commit();
        } catch (Exception e) {
            bm.b("LaunchSetting", "setSetting(" + str + ", " + j + ")", e);
        }
    }

    public final void a(String str, String str2) {
        if (str2 != null) {
            str2 = str2.replace("\u0000", "");
        }
        try {
            SharedPreferences.Editor editorEdit = this.a.edit();
            editorEdit.putString(str, str2);
            editorEdit.commit();
        } catch (Exception e) {
            bm.b("LaunchSetting", "setSetting(" + str + ", " + str2 + ")", e);
        }
    }

    public final long b(String str, long j) {
        try {
            return this.a.getLong(str, j);
        } catch (Exception e) {
            bm.b("LaunchSetting", "getLongSetting()", e);
            return j;
        }
    }

    public final String b(String str, String str2) {
        try {
            return this.a.getString(str, str2);
        } catch (Exception e) {
            bm.b("LaunchSetting", "getString()", e);
            return str2;
        }
    }
}
