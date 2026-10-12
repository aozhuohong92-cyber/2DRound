package org.apache.commons.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class StatusLine {
    private final String httpVersion;
    private final String reasonPhrase;
    private final int statusCode;
    private final String statusLine;

    public StatusLine(String statusLine) throws HttpException {
        int length = statusLine.length();
        int start = 0;
        int at = 0;
        while (Character.isWhitespace(statusLine.charAt(at))) {
            try {
                start++;
                at++;
            } catch (StringIndexOutOfBoundsException e) {
            }
        }
        int at2 = at + 4;
        try {
            if (!"HTTP".equals(statusLine.substring(at, at2))) {
                throw new HttpException(new StringBuffer().append("Status-Line '").append(statusLine).append("' does not start with HTTP").toString());
            }
            int at3 = statusLine.indexOf(" ", at2);
            if (at3 <= 0) {
                throw new ProtocolException(new StringBuffer().append("Unable to parse HTTP-Version from the status line: '").append(statusLine).append("'").toString());
            }
            this.httpVersion = statusLine.substring(start, at3).toUpperCase();
            while (statusLine.charAt(at3) == ' ') {
                at3++;
            }
            int to = statusLine.indexOf(" ", at3);
            to = to < 0 ? length : to;
            try {
                this.statusCode = Integer.parseInt(statusLine.substring(at3, to));
                int at4 = to + 1;
                if (at4 < length) {
                    this.reasonPhrase = statusLine.substring(at4).trim();
                } else {
                    this.reasonPhrase = "";
                }
                this.statusLine = statusLine;
            } catch (NumberFormatException e2) {
                throw new ProtocolException(new StringBuffer().append("Unable to parse status code from status line: '").append(statusLine).append("'").toString());
            }
        } catch (StringIndexOutOfBoundsException e3) {
            throw new HttpException(new StringBuffer().append("Status-Line '").append(statusLine).append("' is not valid").toString());
        }
    }

    public final int getStatusCode() {
        return this.statusCode;
    }

    public final String getHttpVersion() {
        return this.httpVersion;
    }

    public final String getReasonPhrase() {
        return this.reasonPhrase;
    }

    public final String toString() {
        return this.statusLine;
    }

    public static boolean startsWithHTTP(String s) {
        int at = 0;
        while (Character.isWhitespace(s.charAt(at))) {
            try {
                at++;
            } catch (StringIndexOutOfBoundsException e) {
                return false;
            }
        }
        return "HTTP".equals(s.substring(at, at + 4));
    }
}
