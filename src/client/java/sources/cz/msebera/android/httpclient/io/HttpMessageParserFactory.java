package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.config.MessageConstraints;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface HttpMessageParserFactory<T extends HttpMessage> {
    HttpMessageParser<T> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints);
}
