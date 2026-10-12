package org.apache.http.message;

import java.io.Serializable;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Contract(threading = ThreadingBehavior.IMMUTABLE)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicStatusLine implements StatusLine, Cloneable, Serializable {
    private static final long serialVersionUID = -2443303766890459269L;
    private final ProtocolVersion protoVersion;
    private final String reasonPhrase;
    private final int statusCode;

    public BasicStatusLine(ProtocolVersion version, int statusCode, String reasonPhrase) {
        this.protoVersion = (ProtocolVersion) Args.notNull(version, "Version");
        this.statusCode = Args.notNegative(statusCode, "Status code");
        this.reasonPhrase = reasonPhrase;
    }

    @Override // org.apache.http.StatusLine
    public int getStatusCode() {
        return this.statusCode;
    }

    @Override // org.apache.http.StatusLine
    public ProtocolVersion getProtocolVersion() {
        return this.protoVersion;
    }

    @Override // org.apache.http.StatusLine
    public String getReasonPhrase() {
        return this.reasonPhrase;
    }

    public String toString() {
        return BasicLineFormatter.INSTANCE.formatStatusLine((CharArrayBuffer) null, this).toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
