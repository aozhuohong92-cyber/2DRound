package com.iflytek.thridparty;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class bp implements ThreadFactory {
    private final AtomicInteger a = new AtomicInteger(1);

    bp() {
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable, "CommonTask#" + this.a.getAndIncrement());
        thread.setPriority(5);
        return thread;
    }
}
