package com.iflytek.cloud;

import android.os.Bundle;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface RequestListener {
    void onBufferReceived(byte[] bArr);

    void onCompleted(SpeechError speechError);

    void onEvent(int i, Bundle bundle);
}
