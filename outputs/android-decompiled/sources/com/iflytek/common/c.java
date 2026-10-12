package com.iflytek.common;

import android.util.Log;
import com.iflytek.thridparty.bj;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class c {
    static bj a;

    protected static bj a() {
        if (a != null) {
            return a;
        }
        try {
            bj bjVar = (bj) Class.forName("com.iflytek.common.push.impl.PushImpl").newInstance();
            a = bjVar;
            if (bjVar != null) {
                return a;
            }
        } catch (Exception e) {
            Log.e("PushFactory", "getPushInstance not found push instance.");
        }
        return null;
    }
}
