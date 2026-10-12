package com.iflytek.thridparty;

import android.content.Context;
import android.util.Log;

/* renamed from: com.iflytek.thridparty.d, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class C0040d extends Thread {
    private Context a;
    private String b;
    private int c;
    private String d;
    private String e;

    C0040d(Context context, int i) {
        this.b = "";
        this.d = "";
        this.e = "";
        this.a = context;
        this.c = i;
    }

    C0040d(Context context, int i, String str, String str2) {
        this.b = "";
        this.d = "";
        this.e = "";
        this.a = context;
        this.c = i;
        this.d = str;
        this.e = str2;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        try {
            switch (this.c) {
                case 1:
                    C0038b.a(this.a, this.b);
                    break;
                case 2:
                    C0038b.e(this.a, this.b, this.d);
                    break;
                case 3:
                    C0038b.b(this.a, this.b);
                    break;
                case 4:
                    C0038b.c(this.a, null);
                    break;
                case 6:
                    C0038b.g(this.a);
                    break;
                case 9:
                    String strH = C0044h.h(this.a);
                    String strI = C0044h.i(this.a);
                    if (strH != null && strH.length() != 0) {
                        if (strI == null || strI.length() == 0) {
                            Log.e("UploadThread", "unexpected empty channelId");
                        }
                        C0038b.a(this.a, true);
                        break;
                    } else {
                        Log.e("UploadThread", "unexpected empty appkey");
                        break;
                    }
                    break;
                case 10:
                    C0038b.a(this.a, false);
                    break;
                case 11:
                    C0038b.b(this.a, this.d, this.e);
                    break;
                case 12:
                    C0038b.f(this.a, this.d);
                    break;
                case 13:
                    C0038b.c(this.a, this.d, this.e);
                    break;
            }
        } catch (Exception e) {
            Log.e("MobileAgent", "Exception occurred when recording usage.");
            e.printStackTrace();
        }
    }
}
