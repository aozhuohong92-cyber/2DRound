package com.iflytek.thridparty;

import android.content.Context;

/* renamed from: com.iflytek.thridparty.ab, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class RunnableC0013ab implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ String b;

    RunnableC0013ab(Context context, String str) {
        this.a = context;
        this.b = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        C0012aa.c(this.a, "iflytek.deviceid.key", this.b);
    }
}
