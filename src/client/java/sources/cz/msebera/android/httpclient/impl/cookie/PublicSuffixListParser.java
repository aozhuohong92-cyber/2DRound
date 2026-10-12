package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.util.PublicSuffixList;
import java.io.IOException;
import java.io.Reader;

@Immutable
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class PublicSuffixListParser {
    private final PublicSuffixFilter filter;
    private final cz.msebera.android.httpclient.conn.util.PublicSuffixListParser parser = new cz.msebera.android.httpclient.conn.util.PublicSuffixListParser();

    PublicSuffixListParser(PublicSuffixFilter filter) {
        this.filter = filter;
    }

    public void parse(Reader reader) throws IOException {
        PublicSuffixList suffixList = this.parser.parse(reader);
        this.filter.setPublicSuffixes(suffixList.getRules());
        this.filter.setExceptions(suffixList.getExceptions());
    }
}
