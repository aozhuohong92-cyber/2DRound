package com.iflytek.cloud.util;

import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface FileDownloadListener {
    void onCompleted(String str, SpeechError speechError);

    void onProgress(int i);

    void onStart();
}
