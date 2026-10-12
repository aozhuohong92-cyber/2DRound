package com.iflytek.speech;

import android.content.Intent;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ISpeechModule {
    boolean destory();

    Intent getIntent();

    String getParameter(String str);

    boolean isAvailable();

    int setParameter(String str, String str2);
}
