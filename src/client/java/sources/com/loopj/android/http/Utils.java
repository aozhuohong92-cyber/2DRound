package com.loopj.android.http;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class Utils {
    private Utils() {
    }

    public static void asserts(boolean expression, String failedMessage) {
        if (!expression) {
            throw new AssertionError(failedMessage);
        }
    }

    public static <T> T notNull(T argument, String name) {
        if (argument == null) {
            throw new IllegalArgumentException(name + " should not be null!");
        }
        return argument;
    }
}
