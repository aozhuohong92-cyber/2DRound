package cz.msebera.android.httpclient.conn.util;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import java.util.Collections;
import java.util.List;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class PublicSuffixList {
    private final List<String> exceptions;
    private final List<String> rules;

    public PublicSuffixList(List<String> rules, List<String> exceptions) {
        this.rules = Collections.unmodifiableList((List) Args.notNull(rules, "Domain suffix rules"));
        this.exceptions = Collections.unmodifiableList((List) Args.notNull(exceptions, "Domain suffix exceptions"));
    }

    public List<String> getRules() {
        return this.rules;
    }

    public List<String> getExceptions() {
        return this.exceptions;
    }
}
