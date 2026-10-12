package org.apache.commons.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class URIException extends HttpException {
    public static final int ESCAPING = 3;
    public static final int PARSING = 1;
    public static final int PUNYCODE = 4;
    public static final int UNKNOWN = 0;
    public static final int UNSUPPORTED_ENCODING = 2;
    protected String reason;
    protected int reasonCode;

    public URIException() {
    }

    public URIException(int reasonCode) {
        this.reasonCode = reasonCode;
    }

    public URIException(int reasonCode, String reason) {
        super(reason);
        this.reason = reason;
        this.reasonCode = reasonCode;
    }

    public URIException(String reason) {
        super(reason);
        this.reason = reason;
        this.reasonCode = 0;
    }

    @Override // org.apache.commons.httpclient.HttpException
    public int getReasonCode() {
        return this.reasonCode;
    }

    @Override // org.apache.commons.httpclient.HttpException
    public void setReasonCode(int reasonCode) {
        this.reasonCode = reasonCode;
    }

    @Override // org.apache.commons.httpclient.HttpException
    public String getReason() {
        return this.reason;
    }

    @Override // org.apache.commons.httpclient.HttpException
    public void setReason(String reason) {
        this.reason = reason;
    }
}
