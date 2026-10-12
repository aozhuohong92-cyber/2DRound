package com.iflytek.cloud.ui;

import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechError;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface RecognizerDialogListener {
    void onError(SpeechError speechError);

    void onResult(RecognizerResult recognizerResult, boolean z);
}
