package com.iflytek.thridparty;

import android.content.Context;

/* renamed from: com.iflytek.thridparty.f, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class RunnableC0042f implements Runnable {
    private final /* synthetic */ Context a;

    RunnableC0042f(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        String strA = C0011a.a(this.a);
        if (strA == null || strA.trim().equals("")) {
            return;
        }
        C0038b.h(this.a, "#lxapkmd5", strA);
    }
}
