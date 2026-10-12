package com.tencent.bugly.proguard;

import java.io.Serializable;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class j implements Serializable {
    public abstract void a(h hVar);

    public abstract void a(i iVar);

    public abstract void a(StringBuilder sb, int i);

    public String toString() {
        StringBuilder sb = new StringBuilder();
        a(sb, 0);
        return sb.toString();
    }
}
