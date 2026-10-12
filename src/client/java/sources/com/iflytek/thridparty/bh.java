package com.iflytek.thridparty;

import android.content.Context;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class bh implements Runnable {
    final /* synthetic */ Context a;

    bh(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        be.c(this.a);
    }
}
