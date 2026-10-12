package android.support.v4.view;

import android.view.ViewGroup;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ViewGroupCompatLollipop {
    ViewGroupCompatLollipop() {
    }

    public static void setTransitionGroup(ViewGroup group, boolean isTransitionGroup) {
        group.setTransitionGroup(isTransitionGroup);
    }

    public static boolean isTransitionGroup(ViewGroup group) {
        return group.isTransitionGroup();
    }

    public static int getNestedScrollAxes(ViewGroup group) {
        return group.getNestedScrollAxes();
    }
}
