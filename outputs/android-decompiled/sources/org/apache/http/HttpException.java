package org.apache.http;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpException extends Exception {
    private static final int FIRST_VALID_CHAR = 32;
    private static final long serialVersionUID = -5437299376222011036L;

    static String clean(String message) {
        char[] chars = message.toCharArray();
        int i = 0;
        while (i < chars.length && chars[i] >= ' ') {
            i++;
        }
        if (i != chars.length) {
            StringBuilder builder = new StringBuilder(chars.length * 2);
            for (int i2 = 0; i2 < chars.length; i2++) {
                char ch = chars[i2];
                if (ch < ' ') {
                    builder.append("[0x");
                    String hexString = Integer.toHexString(i2);
                    if (hexString.length() == 1) {
                        builder.append("0");
                    }
                    builder.append(hexString);
                    builder.append("]");
                } else {
                    builder.append(ch);
                }
            }
            return builder.toString();
        }
        return message;
    }

    public HttpException() {
    }

    public HttpException(String message) {
        super(clean(message));
    }

    public HttpException(String message, Throwable cause) {
        super(clean(message));
        initCause(cause);
    }
}
