package com.iflytek.cloud;

import android.content.Context;
import android.graphics.Bitmap;
import com.iflytek.thridparty.C0030as;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FaceDetector {
    private static FaceDetector a;
    private C0030as b;

    private FaceDetector(Context context) {
        this.b = new C0030as(context, null);
    }

    public static synchronized FaceDetector createDetector(Context context, String str) {
        if (a == null) {
            a = new FaceDetector(context);
        }
        return a;
    }

    public static synchronized FaceDetector getDetector() {
        return a;
    }

    public synchronized void destroy() {
        a = null;
        this.b.a();
    }

    public synchronized String detectARGB(Bitmap bitmap) {
        return this.b.a(bitmap);
    }

    public synchronized String detectGray(Bitmap bitmap) {
        return this.b.b(bitmap);
    }

    public synchronized String trackNV21(byte[] bArr, int i, int i2, int i3, int i4) {
        return this.b.a(bArr, i, i2, i3, i4);
    }
}
