package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class DrawableCompatKitKat {
    DrawableCompatKitKat() {
    }

    public static void setAutoMirrored(Drawable drawable, boolean mirrored) {
        drawable.setAutoMirrored(mirrored);
    }

    public static boolean isAutoMirrored(Drawable drawable) {
        return drawable.isAutoMirrored();
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        if (!(drawable instanceof DrawableWrapperKitKat)) {
            return new DrawableWrapperKitKat(drawable);
        }
        return drawable;
    }

    public static int getAlpha(Drawable drawable) {
        return drawable.getAlpha();
    }
}
