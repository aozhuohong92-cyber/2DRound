package android.support.v4.animation;

import android.os.Build;
import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class AnimatorCompatHelper {
    private static final AnimatorProvider IMPL;

    static {
        if (Build.VERSION.SDK_INT >= 12) {
            IMPL = new HoneycombMr1AnimatorCompatProvider();
        } else {
            IMPL = new DonutAnimatorCompatProvider();
        }
    }

    public static ValueAnimatorCompat emptyValueAnimator() {
        return IMPL.emptyValueAnimator();
    }

    private AnimatorCompatHelper() {
    }

    public static void clearInterpolator(View view) {
        IMPL.clearInterpolator(view);
    }
}
