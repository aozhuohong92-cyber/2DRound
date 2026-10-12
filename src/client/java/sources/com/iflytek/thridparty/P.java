package com.iflytek.thridparty;

import java.util.HashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class P {
    private HashMap<String, ConcurrentLinkedQueue<byte[]>> a = new HashMap<>();

    public void a() throws Throwable {
        for (String str : this.a.keySet()) {
            U.a(this.a.get(str), str);
        }
    }

    public void a(String str, byte[] bArr) {
        if (this.a.containsKey(str)) {
            this.a.get(str).add(bArr);
            return;
        }
        ConcurrentLinkedQueue<byte[]> concurrentLinkedQueue = new ConcurrentLinkedQueue<>();
        concurrentLinkedQueue.add(bArr);
        this.a.put(str, concurrentLinkedQueue);
    }
}
