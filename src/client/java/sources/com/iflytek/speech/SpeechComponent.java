package com.iflytek.speech;

import android.text.TextUtils;
import com.iflytek.thridparty.C0020ai;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class SpeechComponent {
    private ArrayList<String> mEngines = new ArrayList<>();
    private String mPackageName;

    public SpeechComponent(String str) {
        this.mPackageName = "";
        if (str != null) {
            this.mPackageName = str;
        }
    }

    public void addEngine(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mEngines.add(str);
    }

    public ArrayList<String> getEngines() {
        return this.mEngines;
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    public boolean isEngineAvaible(String str) {
        if (!TextUtils.isEmpty(str) && this.mEngines.size() != 0) {
            Iterator<String> it2 = this.mEngines.iterator();
            while (it2.hasNext()) {
                try {
                } catch (Exception e) {
                    C0020ai.a(e);
                }
                if (it2.next().contains(str)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }
}
