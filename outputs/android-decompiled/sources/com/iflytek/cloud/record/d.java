package com.iflytek.cloud.record;

import android.media.AudioManager;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class d implements AudioManager.OnAudioFocusChangeListener {
    final /* synthetic */ c a;

    d(c cVar) {
        this.a = cVar;
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public void onAudioFocusChange(int i) {
        if (i == -2 || i == -3 || i == -1) {
            C0020ai.a("PcmPlayer", "pause start");
            if (this.a.c()) {
                C0020ai.a("PcmPlayer", "pause success");
                this.a.l = true;
                if (this.a.f != null) {
                    this.a.f.a();
                    return;
                }
                return;
            }
            return;
        }
        if (i == 1) {
            C0020ai.a("PcmPlayer", "resume start");
            if (this.a.l) {
                this.a.l = false;
                if (this.a.d()) {
                    C0020ai.a("PcmPlayer", "resume success");
                    if (this.a.f != null) {
                        this.a.f.b();
                    }
                }
            }
        }
    }
}
