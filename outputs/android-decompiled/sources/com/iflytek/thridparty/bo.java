package com.iflytek.thridparty;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class bo {
    private static final BlockingQueue b = new LinkedBlockingQueue(1);
    private static final ThreadFactory c = new bp();
    public static final ExecutorService a = new ThreadPoolExecutor(1, 1, 10, TimeUnit.SECONDS, b, c, new ThreadPoolExecutor.DiscardPolicy());
}
