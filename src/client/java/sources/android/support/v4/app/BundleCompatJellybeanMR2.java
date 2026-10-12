package android.support.v4.app;

import android.os.Bundle;
import android.os.IBinder;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class BundleCompatJellybeanMR2 {
    BundleCompatJellybeanMR2() {
    }

    public static IBinder getBinder(Bundle bundle, String key) {
        return bundle.getBinder(key);
    }

    public static void putBinder(Bundle bundle, String key, IBinder binder) {
        bundle.putBinder(key, binder);
    }
}
