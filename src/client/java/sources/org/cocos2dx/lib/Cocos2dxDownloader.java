package org.cocos2dx.lib;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import javax.net.ssl.SSLException;
import org.apache.http.Header;
import org.apache.http.message.BasicHeader;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Cocos2dxDownloader {
    private int _countOfMaxProcessingTasks;
    private int _id;
    private String _tempFileNameSufix;
    private AsyncHttpClient _httpClient = new AsyncHttpClient();
    private HashMap _taskMap = new HashMap();
    private Queue<Runnable> _taskQueue = new LinkedList();

    native void nativeOnFinish(int i, int i2, int i3, String str, byte[] bArr);

    native void nativeOnProgress(int i, int i2, long j, long j2, long j3);

    void onProgress(final int id, final long downloadBytes, final long downloadNow, final long downloadTotal) {
        DownloadTask task = (DownloadTask) this._taskMap.get(Integer.valueOf(id));
        if (task != null) {
            task.bytesReceived = downloadBytes;
            task.totalBytesReceived = downloadNow;
            task.totalBytesExpected = downloadTotal;
        }
        Cocos2dxHelper.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxDownloader.1
            @Override // java.lang.Runnable
            public void run() {
                Cocos2dxDownloader.this.nativeOnProgress(Cocos2dxDownloader.this._id, id, downloadBytes, downloadNow, downloadTotal);
            }
        });
    }

    public void onStart(int id) {
        DownloadTask task = (DownloadTask) this._taskMap.get(Integer.valueOf(id));
        if (task != null) {
            task.resetStatus();
        }
    }

    public void onFinish(final int id, final int errCode, final String errStr, final byte[] data) {
        DownloadTask task = (DownloadTask) this._taskMap.get(Integer.valueOf(id));
        if (task != null) {
            this._taskMap.remove(Integer.valueOf(id));
            Cocos2dxHelper.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxDownloader.2
                @Override // java.lang.Runnable
                public void run() {
                    Cocos2dxDownloader.this.nativeOnFinish(Cocos2dxDownloader.this._id, id, errCode, errStr, data);
                }
            });
        }
    }

    public static Cocos2dxDownloader createDownloader(int id, int timeoutInSeconds, String tempFileNameSufix, int countOfMaxProcessingTasks) {
        Cocos2dxDownloader downloader = new Cocos2dxDownloader();
        downloader._id = id;
        downloader._httpClient.setEnableRedirects(true);
        if (timeoutInSeconds > 0) {
            downloader._httpClient.setTimeout(timeoutInSeconds * 1000);
        }
        AsyncHttpClient asyncHttpClient = downloader._httpClient;
        AsyncHttpClient.allowRetryExceptionClass(SSLException.class);
        downloader._tempFileNameSufix = tempFileNameSufix;
        downloader._countOfMaxProcessingTasks = countOfMaxProcessingTasks;
        return downloader;
    }

    public static void createTask(final Cocos2dxDownloader downloader, final int id_, final String url_, final String path_) {
        Runnable taskRunnable = new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxDownloader.3
            @Override // java.lang.Runnable
            public void run() {
                DownloadTask task = new DownloadTask();
                if (path_.length() == 0) {
                    task.handler = new DataTaskHandler(downloader, id_);
                    task.handle = downloader._httpClient.get(Cocos2dxHelper.getActivity(), url_, task.handler);
                }
                if (path_.length() != 0) {
                    File tempFile = new File(path_ + downloader._tempFileNameSufix);
                    if (!tempFile.isDirectory()) {
                        File parent = tempFile.getParentFile();
                        if (parent.isDirectory() || parent.mkdirs()) {
                            File finalFile = new File(path_);
                            if (!tempFile.isDirectory()) {
                                task.handler = new FileTaskHandler(downloader, id_, tempFile, finalFile);
                                Header[] headers = null;
                                long fileLen = tempFile.length();
                                if (fileLen > 0) {
                                    List<Header> list = new ArrayList<>();
                                    list.add(new BasicHeader("Range", "bytes=" + fileLen + "-"));
                                    headers = (Header[]) list.toArray(new Header[list.size()]);
                                }
                                task.handle = downloader._httpClient.get(Cocos2dxHelper.getActivity(), url_, headers, (RequestParams) null, task.handler);
                            }
                        }
                    }
                }
                if (task.handle != null) {
                    downloader._taskMap.put(Integer.valueOf(id_), task);
                } else {
                    final String errStr = "Can't create DownloadTask for " + url_;
                    Cocos2dxHelper.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxDownloader.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            downloader.nativeOnFinish(downloader._id, id_, 0, errStr, null);
                        }
                    });
                }
            }
        };
        if (downloader._taskQueue.size() < downloader._countOfMaxProcessingTasks) {
            Cocos2dxHelper.getActivity().runOnUiThread(taskRunnable);
            downloader._taskQueue.add(null);
        } else {
            downloader._taskQueue.add(taskRunnable);
        }
    }

    public static void cancelAllRequests(Cocos2dxDownloader downloader) {
        Cocos2dxHelper.getActivity().runOnUiThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxDownloader.4
            @Override // java.lang.Runnable
            public void run() {
                for (Map.Entry entry : Cocos2dxDownloader.this._taskMap.entrySet()) {
                    DownloadTask task = (DownloadTask) entry.getValue();
                    if (task.handle != null) {
                        task.handle.cancel(true);
                    }
                }
            }
        });
    }

    public Runnable dequeue() {
        if (!this._taskQueue.isEmpty() && this._taskQueue.element() == null) {
            this._taskQueue.remove();
        }
        if (this._taskQueue.isEmpty()) {
            return null;
        }
        return this._taskQueue.remove();
    }
}
