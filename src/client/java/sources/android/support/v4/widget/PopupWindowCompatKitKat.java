package android.support.v4.widget;

import android.view.View;
import android.widget.PopupWindow;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class PopupWindowCompatKitKat {
    PopupWindowCompatKitKat() {
    }

    public static void showAsDropDown(PopupWindow popup, View anchor, int xoff, int yoff, int gravity) {
        popup.showAsDropDown(anchor, xoff, yoff, gravity);
    }
}
