package org.apache.commons.httpclient.util;

import org.apache.commons.httpclient.NameValuePair;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ParameterFormatter {
    private static final char[] SEPARATORS = {'(', ')', '<', '>', '@', ',', ';', ':', '\\', '\"', '/', '[', ']', '?', '=', '{', '}', ' ', '\t'};
    private static final char[] UNSAFE_CHARS = {'\"', '\\'};
    private boolean alwaysUseQuotes = true;

    private static boolean isOneOf(char[] chars, char ch) {
        for (char c : chars) {
            if (ch == c) {
                return true;
            }
        }
        return false;
    }

    private static boolean isUnsafeChar(char ch) {
        return isOneOf(UNSAFE_CHARS, ch);
    }

    private static boolean isSeparator(char ch) {
        return isOneOf(SEPARATORS, ch);
    }

    public boolean isAlwaysUseQuotes() {
        return this.alwaysUseQuotes;
    }

    public void setAlwaysUseQuotes(boolean alwaysUseQuotes) {
        this.alwaysUseQuotes = alwaysUseQuotes;
    }

    public static void formatValue(StringBuffer buffer, String value, boolean alwaysUseQuotes) {
        if (buffer == null) {
            throw new IllegalArgumentException("String buffer may not be null");
        }
        if (value == null) {
            throw new IllegalArgumentException("Value buffer may not be null");
        }
        if (alwaysUseQuotes) {
            buffer.append('\"');
            for (int i = 0; i < value.length(); i++) {
                char ch = value.charAt(i);
                if (isUnsafeChar(ch)) {
                    buffer.append('\\');
                }
                buffer.append(ch);
            }
            buffer.append('\"');
            return;
        }
        int offset = buffer.length();
        boolean unsafe = false;
        for (int i2 = 0; i2 < value.length(); i2++) {
            char ch2 = value.charAt(i2);
            if (isSeparator(ch2)) {
                unsafe = true;
            }
            if (isUnsafeChar(ch2)) {
                buffer.append('\\');
            }
            buffer.append(ch2);
        }
        if (unsafe) {
            buffer.insert(offset, '\"');
            buffer.append('\"');
        }
    }

    public void format(StringBuffer buffer, NameValuePair param) {
        if (buffer == null) {
            throw new IllegalArgumentException("String buffer may not be null");
        }
        if (param == null) {
            throw new IllegalArgumentException("Parameter may not be null");
        }
        buffer.append(param.getName());
        String value = param.getValue();
        if (value != null) {
            buffer.append("=");
            formatValue(buffer, value, this.alwaysUseQuotes);
        }
    }

    public String format(NameValuePair param) {
        StringBuffer buffer = new StringBuffer();
        format(buffer, param);
        return buffer.toString();
    }
}
