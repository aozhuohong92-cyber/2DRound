package org.apache.commons.httpclient;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.httpclient.util.ExceptionUtil;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class NoHttpResponseException extends IOException {
    public NoHttpResponseException() {
    }

    public NoHttpResponseException(String message) {
        super(message);
    }

    public NoHttpResponseException(String message, Throwable cause) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        super(message);
        ExceptionUtil.initCause(this, cause);
    }
}
