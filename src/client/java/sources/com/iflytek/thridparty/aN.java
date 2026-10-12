package com.iflytek.thridparty;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.NinePatch;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.util.TypedValue;
import java.io.InputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aN {
    private static int a = 0;

    public static Bitmap a(Resources resources, TypedValue typedValue, InputStream inputStream, Rect rect, BitmapFactory.Options options) {
        if (options == null) {
            options = new BitmapFactory.Options();
        }
        if (options.inDensity == 0 && typedValue != null) {
            int i = typedValue.density;
            if (i == 0) {
                options.inDensity = 160;
            } else if (i != 65535) {
                options.inDensity = i;
            }
        }
        if (options.inTargetDensity == 0 && resources != null) {
            options.inTargetDensity = resources.getDisplayMetrics().densityDpi;
        }
        return BitmapFactory.decodeStream(inputStream, rect, options);
    }

    private static Drawable a(Resources resources, Bitmap bitmap, byte[] bArr, Rect rect, String str) {
        return bArr != null ? new NinePatchDrawable(resources, bitmap, bArr, rect, str) : new BitmapDrawable(resources, bitmap);
    }

    public static Drawable a(Resources resources, TypedValue typedValue, InputStream inputStream, String str, BitmapFactory.Options options) {
        if (inputStream == null) {
            return null;
        }
        Rect rect = new Rect();
        if (options == null) {
            options = new BitmapFactory.Options();
        }
        Bitmap bitmapA = a(resources, typedValue, inputStream, rect, options);
        if (bitmapA == null) {
            return null;
        }
        byte[] ninePatchChunk = bitmapA.getNinePatchChunk();
        if (ninePatchChunk == null || !NinePatch.isNinePatchChunk(ninePatchChunk)) {
            ninePatchChunk = null;
            rect = null;
        }
        return a(resources, bitmapA, ninePatchChunk, rect, str);
    }
}
