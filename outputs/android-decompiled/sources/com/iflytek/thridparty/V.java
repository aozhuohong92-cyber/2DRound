package com.iflytek.thridparty;

import android.content.Context;
import android.media.AudioManager;
import android.os.Build;
import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class V {
    public static int a = 9;
    public static int b = 14;

    public static void a(View view) {
        if (Build.VERSION.SDK_INT >= b) {
            W.a(view);
        }
    }

    public static boolean a(Context context, Boolean bool, AudioManager.OnAudioFocusChangeListener onAudioFocusChangeListener) {
        if (!bool.booleanValue() || Build.VERSION.SDK_INT < a) {
            return false;
        }
        W.a(context, onAudioFocusChangeListener);
        return false;
    }

    public static boolean b(Context context, Boolean bool, AudioManager.OnAudioFocusChangeListener onAudioFocusChangeListener) {
        if (!bool.booleanValue() || Build.VERSION.SDK_INT < a) {
            return false;
        }
        return W.b(context, onAudioFocusChangeListener);
    }
}
