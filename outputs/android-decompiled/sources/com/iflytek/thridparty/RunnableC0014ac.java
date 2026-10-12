package com.iflytek.thridparty;

import android.content.Context;

/* renamed from: com.iflytek.thridparty.ac, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class RunnableC0014ac implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ String b;

    RunnableC0014ac(Context context, String str) {
        this.a = context;
        this.b = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        C0012aa.c(this.a, "iflytek.deviceid.key", this.b);
        C0012aa.d(this.a, ".2F6E2C5B63F0F83B", this.b);
    }
}
