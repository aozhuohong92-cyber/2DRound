package org.apache.http.protocol;

import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import org.apache.http.annotation.Contract;
import org.apache.http.annotation.ThreadingBehavior;
import org.apache.http.util.Args;

@Contract(threading = ThreadingBehavior.SAFE)
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class UriPatternMatcher<T> {
    private final Map<String, T> map = new LinkedHashMap();

    public synchronized Set<Map.Entry<String, T>> entrySet() {
        return new HashSet(this.map.entrySet());
    }

    public synchronized void register(String pattern, T obj) {
        Args.notNull(pattern, "URI request pattern");
        this.map.put(pattern, obj);
    }

    public synchronized void unregister(String pattern) {
        if (pattern != null) {
            this.map.remove(pattern);
        }
    }

    @Deprecated
    public synchronized void setHandlers(Map<String, T> map) {
        Args.notNull(map, "Map of handlers");
        this.map.clear();
        this.map.putAll(map);
    }

    @Deprecated
    public synchronized void setObjects(Map<String, T> map) {
        Args.notNull(map, "Map of handlers");
        this.map.clear();
        this.map.putAll(map);
    }

    @Deprecated
    public synchronized Map<String, T> getObjects() {
        return this.map;
    }

    public synchronized T lookup(String path) {
        T obj;
        Args.notNull(path, "Request path");
        obj = this.map.get(path);
        if (obj == null) {
            String bestMatch = null;
            for (String pattern : this.map.keySet()) {
                if (matchUriRequestPattern(pattern, path) && (bestMatch == null || bestMatch.length() < pattern.length() || (bestMatch.length() == pattern.length() && pattern.endsWith("*")))) {
                    obj = this.map.get(pattern);
                    bestMatch = pattern;
                }
            }
        }
        return obj;
    }

    protected boolean matchUriRequestPattern(String pattern, String path) {
        boolean z = false;
        if (pattern.equals("*")) {
            return true;
        }
        if ((pattern.endsWith("*") && path.startsWith(pattern.substring(0, pattern.length() - 1))) || (pattern.startsWith("*") && path.endsWith(pattern.substring(1, pattern.length())))) {
            z = true;
        }
        return z;
    }

    public String toString() {
        return this.map.toString();
    }
}
