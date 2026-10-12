package org.cocos2dx.lib;

import android.util.Log;
import com.loopj.android.http.FileAsyncHttpResponseHandler;
import java.io.File;
import org.apache.http.Header;

/* compiled from: Cocos2dxDownloader.java */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class FileTaskHandler extends FileAsyncHttpResponseHandler {
    private Cocos2dxDownloader _downloader;
    File _finalFile;
    int _id;
    private long _initFileLen;
    private long _lastBytesWritten;

    void LogD(String msg) {
        Log.d("Cocos2dxDownloader", msg);
    }

    public FileTaskHandler(Cocos2dxDownloader downloader, int id, File temp, File finalFile) {
        super(temp, true);
        this._finalFile = finalFile;
        this._downloader = downloader;
        this._id = id;
        this._initFileLen = getTargetFile().length();
        this._lastBytesWritten = 0L;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onProgress(long bytesWritten, long totalSize) {
        long dlBytes = bytesWritten - this._lastBytesWritten;
        long dlNow = bytesWritten + this._initFileLen;
        long dlTotal = totalSize + this._initFileLen;
        this._downloader.onProgress(this._id, dlBytes, dlNow, dlTotal);
        this._lastBytesWritten = bytesWritten;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onStart() {
        this._downloader.onStart(this._id);
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFinish() {
        Runnable taskRunnable = this._downloader.dequeue();
        if (taskRunnable != null) {
            Cocos2dxHelper.getActivity().runOnUiThread(taskRunnable);
        }
    }

    @Override // com.loopj.android.http.FileAsyncHttpResponseHandler
    public void onFailure(int i, Header[] headers, Throwable throwable, File file) {
        LogD("onFailure(i:" + i + " headers:" + headers + " throwable:" + throwable + " file:" + file);
        String errStr = "";
        if (throwable != null) {
            errStr = throwable.toString();
        }
        this._downloader.onFinish(this._id, i, errStr, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0080  */
    @Override // com.loopj.android.http.FileAsyncHttpResponseHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onSuccess(int r7, org.apache.http.Header[] r8, java.io.File r9) {
        /*
            r6 = this;
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "onSuccess(i:"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.StringBuilder r2 = r2.append(r7)
            java.lang.String r3 = " headers:"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.StringBuilder r2 = r2.append(r8)
            java.lang.String r3 = " file:"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.StringBuilder r2 = r2.append(r9)
            java.lang.String r2 = r2.toString()
            r6.LogD(r2)
            r0 = 0
            java.io.File r2 = r6._finalFile
            boolean r2 = r2.exists()
            if (r2 == 0) goto L80
            java.io.File r2 = r6._finalFile
            boolean r2 = r2.isDirectory()
            if (r2 == 0) goto L5e
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "Dest file is directory:"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.io.File r3 = r6._finalFile
            java.lang.String r3 = r3.getAbsolutePath()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r0 = r2.toString()
        L54:
            org.cocos2dx.lib.Cocos2dxDownloader r2 = r6._downloader
            int r3 = r6._id
            r4 = 0
            r5 = 0
            r2.onFinish(r3, r4, r0, r5)
            return
        L5e:
            java.io.File r2 = r6._finalFile
            boolean r2 = r2.delete()
            if (r2 != 0) goto L80
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "Can't remove old file:"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.io.File r3 = r6._finalFile
            java.lang.String r3 = r3.getAbsolutePath()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r0 = r2.toString()
            goto L54
        L80:
            java.io.File r1 = r6.getTargetFile()
            java.io.File r2 = r6._finalFile
            r1.renameTo(r2)
            goto L54
        */
        throw new UnsupportedOperationException("Method not decompiled: org.cocos2dx.lib.FileTaskHandler.onSuccess(int, org.apache.http.Header[], java.io.File):void");
    }
}
