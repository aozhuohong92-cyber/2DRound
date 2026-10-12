package com.iflytek.thridparty;

import android.content.Context;
import android.media.AudioManager;
import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class W {
    private static int a = 0;

    public static void a(View view) {
        view.setLayerType(1, null);
    }

    public static boolean a(Context context, AudioManager.OnAudioFocusChangeListener onAudioFocusChangeListener) {
        try {
            ((AudioManager) context.getSystemService("audio")).requestAudioFocus(onAudioFocusChangeListener, 3, 2);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean b(Context context, AudioManager.OnAudioFocusChangeListener onAudioFocusChangeListener) {
        try {
            ((AudioManager) context.getSystemService("audio")).abandonAudioFocus(onAudioFocusChangeListener);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
