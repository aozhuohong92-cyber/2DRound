package com.iflytek.common;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.iflytek.thridparty.be;
import com.iflytek.thridparty.bm;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class b extends BroadcastReceiver {
    final /* synthetic */ LaunchService a;

    b(LaunchService launchService) {
        this.a = launchService;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        bm.a(context, "alarm onReceive");
        be.a(context);
        this.a.b();
    }
}
