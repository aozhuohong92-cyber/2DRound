package android.support.v4.content;

import android.content.Context;
import android.graphics.drawable.Drawable;
import java.io.File;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ContextCompatApi21 {
    ContextCompatApi21() {
    }

    public static Drawable getDrawable(Context context, int id) {
        return context.getDrawable(id);
    }

    public static File getNoBackupFilesDir(Context context) {
        return context.getNoBackupFilesDir();
    }

    public static File getCodeCacheDir(Context context) {
        return context.getCodeCacheDir();
    }
}
