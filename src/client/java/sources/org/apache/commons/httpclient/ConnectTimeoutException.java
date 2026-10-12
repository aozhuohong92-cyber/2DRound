package org.apache.commons.httpclient;

import java.io.InterruptedIOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.httpclient.util.ExceptionUtil;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ConnectTimeoutException extends InterruptedIOException {
    public ConnectTimeoutException() {
    }

    public ConnectTimeoutException(String message) {
        super(message);
    }

    public ConnectTimeoutException(String message, Throwable cause) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        super(message);
        ExceptionUtil.initCause(this, cause);
    }
}
