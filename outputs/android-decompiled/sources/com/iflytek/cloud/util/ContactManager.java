package com.iflytek.cloud.util;

import android.content.Context;
import com.iflytek.thridparty.aT;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class ContactManager {

    public interface ContactListener {
        void onContactQueryFinish(String str, boolean z);
    }

    protected ContactManager() {
    }

    public static ContactManager createManager(Context context, ContactListener contactListener) {
        return aT.a(context, contactListener);
    }

    public static void destroy() {
        aT.c();
    }

    public static ContactManager getManager() {
        return aT.a();
    }

    public abstract void asyncQueryAllContactsName();

    public abstract String queryAllContactsName();
}
