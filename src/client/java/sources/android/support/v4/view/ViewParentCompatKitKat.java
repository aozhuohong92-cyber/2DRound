package android.support.v4.view;

import android.view.View;
import android.view.ViewParent;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ViewParentCompatKitKat {
    ViewParentCompatKitKat() {
    }

    public static void notifySubtreeAccessibilityStateChanged(ViewParent parent, View child, View source, int changeType) {
        parent.notifySubtreeAccessibilityStateChanged(child, source, changeType);
    }
}
