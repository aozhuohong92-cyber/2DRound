package org.cocos2dx.lib;

import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestHandle;

/* compiled from: Cocos2dxDownloader.java */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class DownloadTask {
    long bytesReceived;
    byte[] data;
    RequestHandle handle = null;
    AsyncHttpResponseHandler handler = null;
    long totalBytesExpected;
    long totalBytesReceived;

    DownloadTask() {
        resetStatus();
    }

    void resetStatus() {
        this.bytesReceived = 0L;
        this.totalBytesReceived = 0L;
        this.totalBytesExpected = 0L;
        this.data = null;
    }
}
