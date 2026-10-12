package android.support.v4.widget;

import android.widget.PopupWindow;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class PopupWindowCompatApi23 {
    PopupWindowCompatApi23() {
    }

    static void setOverlapAnchor(PopupWindow popupWindow, boolean overlapAnchor) {
        popupWindow.setOverlapAnchor(overlapAnchor);
    }

    static boolean getOverlapAnchor(PopupWindow popupWindow) {
        return popupWindow.getOverlapAnchor();
    }

    static void setWindowLayoutType(PopupWindow popupWindow, int layoutType) {
        popupWindow.setWindowLayoutType(layoutType);
    }

    static int getWindowLayoutType(PopupWindow popupWindow) {
        return popupWindow.getWindowLayoutType();
    }
}
