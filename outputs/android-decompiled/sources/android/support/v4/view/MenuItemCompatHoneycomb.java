package android.support.v4.view;

import android.view.MenuItem;
import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class MenuItemCompatHoneycomb {
    MenuItemCompatHoneycomb() {
    }

    public static void setShowAsAction(MenuItem item, int actionEnum) {
        item.setShowAsAction(actionEnum);
    }

    public static MenuItem setActionView(MenuItem item, View view) {
        return item.setActionView(view);
    }

    public static MenuItem setActionView(MenuItem item, int resId) {
        return item.setActionView(resId);
    }

    public static View getActionView(MenuItem item) {
        return item.getActionView();
    }
}
