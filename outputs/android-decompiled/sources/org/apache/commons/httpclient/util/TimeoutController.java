package org.apache.commons.httpclient.util;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class TimeoutController {

    public static class TimeoutException extends Exception {
    }

    private TimeoutController() {
    }

    public static void execute(Thread task, long timeout) throws InterruptedException, TimeoutException {
        task.start();
        try {
            task.join(timeout);
        } catch (InterruptedException e) {
        }
        if (task.isAlive()) {
            task.interrupt();
            throw new TimeoutException();
        }
    }

    public static void execute(Runnable task, long timeout) throws InterruptedException, TimeoutException {
        Thread t = new Thread(task, "Timeout guard");
        t.setDaemon(true);
        execute(t, timeout);
    }
}
