package android.support.v4.view;

import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ViewPropertyAnimatorCompatLollipop {
    ViewPropertyAnimatorCompatLollipop() {
    }

    public static void translationZ(View view, float value) {
        view.animate().translationZ(value);
    }

    public static void translationZBy(View view, float value) {
        view.animate().translationZBy(value);
    }

    public static void z(View view, float value) {
        view.animate().z(value);
    }

    public static void zBy(View view, float value) {
        view.animate().zBy(value);
    }
}
