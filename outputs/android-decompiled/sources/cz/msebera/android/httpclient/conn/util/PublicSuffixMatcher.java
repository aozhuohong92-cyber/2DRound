package cz.msebera.android.httpclient.conn.util;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import java.net.IDN;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class PublicSuffixMatcher {
    private final Map<String, String> exceptions;
    private final Map<String, String> rules;

    public PublicSuffixMatcher(Collection<String> rules, Collection<String> exceptions) {
        Args.notNull(rules, "Domain suffix rules");
        this.rules = new ConcurrentHashMap(rules.size());
        for (String rule : rules) {
            this.rules.put(rule, rule);
        }
        if (exceptions != null) {
            this.exceptions = new ConcurrentHashMap(exceptions.size());
            for (String exception : exceptions) {
                this.exceptions.put(exception, exception);
            }
            return;
        }
        this.exceptions = null;
    }

    public String getDomainRoot(String domain) {
        if (domain != null && !domain.startsWith(".")) {
            String domainName = null;
            String segment = domain.toLowerCase(Locale.ROOT);
            while (segment != null) {
                if (this.exceptions == null || !this.exceptions.containsKey(IDN.toUnicode(segment))) {
                    if (!this.rules.containsKey(IDN.toUnicode(segment))) {
                        int nextdot = segment.indexOf(46);
                        String nextSegment = nextdot != -1 ? segment.substring(nextdot + 1) : null;
                        if (nextSegment != null && this.rules.containsKey("*." + IDN.toUnicode(nextSegment))) {
                            break;
                        }
                        if (nextdot != -1) {
                            domainName = segment;
                        }
                        segment = nextSegment;
                    } else {
                        break;
                    }
                } else {
                    return segment;
                }
            }
            String segment2 = domainName;
            return segment2;
        }
        return null;
    }

    public boolean matches(String domain) {
        if (domain == null) {
            return false;
        }
        if (domain.startsWith(".")) {
            domain = domain.substring(1);
        }
        String domainRoot = getDomainRoot(domain);
        return domainRoot == null;
    }
}
