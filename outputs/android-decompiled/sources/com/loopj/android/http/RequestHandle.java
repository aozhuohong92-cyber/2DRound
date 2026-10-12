package com.loopj.android.http;

import android.os.Looper;
import java.lang.ref.WeakReference;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RequestHandle {
    private final WeakReference<AsyncHttpRequest> request;

    public RequestHandle(AsyncHttpRequest request) {
        this.request = new WeakReference<>(request);
    }

    public boolean cancel(final boolean mayInterruptIfRunning) {
        final AsyncHttpRequest _request = this.request.get();
        if (_request != null) {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                new Thread(new Runnable() { // from class: com.loopj.android.http.RequestHandle.1
                    @Override // java.lang.Runnable
                    public void run() throws UnsupportedOperationException {
                        _request.cancel(mayInterruptIfRunning);
                    }
                }).start();
                return true;
            }
            return _request.cancel(mayInterruptIfRunning);
        }
        return false;
    }

    public boolean isFinished() {
        AsyncHttpRequest _request = this.request.get();
        return _request == null || _request.isDone();
    }

    public boolean isCancelled() {
        AsyncHttpRequest _request = this.request.get();
        return _request == null || _request.isCancelled();
    }

    public boolean shouldBeGarbageCollected() {
        boolean should = isCancelled() || isFinished();
        if (should) {
            this.request.clear();
        }
        return should;
    }

    public RequestHandle setTag(Object tag) {
        AsyncHttpRequest _request = this.request.get();
        if (_request != null) {
            _request.setRequestTag(tag);
        }
        return this;
    }

    public Object getTag() {
        AsyncHttpRequest _request = this.request.get();
        if (_request == null) {
            return null;
        }
        return _request.getTag();
    }
}
