package android.support.v4.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface DrawableWrapper {
    Drawable getWrappedDrawable();

    void setCompatTint(int i);

    void setCompatTintList(ColorStateList colorStateList);

    void setCompatTintMode(PorterDuff.Mode mode);

    void setWrappedDrawable(Drawable drawable);
}
