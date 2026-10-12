package com.iflytek.thridparty;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.iflytek.msc.MSC;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aM {
    public static int a;
    public static int b;
    public static int c;
    public static int d;
    private static final String e;
    private static final String f;
    private static HashMap<String, Drawable> g;
    private static HashMap<String, Drawable> h;

    static {
        e = MSC.isIflyVersion() ? "iflytek/" : "cmcc/";
        f = "assets/" + e;
        g = new HashMap<>();
        h = new HashMap<>();
        a = 3;
        b = 4;
        c = 7;
        d = 8;
    }

    public static synchronized Drawable a(Context context, String str) throws Exception {
        Drawable drawableC;
        drawableC = g.get(str);
        if (drawableC == null) {
            drawableC = c(context, str);
            g.put(str, drawableC);
        }
        return drawableC;
    }

    public static View a(Context context, String str, ViewGroup viewGroup) throws Exception {
        return ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(context.getAssets().openXmlResourceParser(f + str + ".xml"), viewGroup);
    }

    public static int[] a() {
        return new int[]{-1579033, -9933198};
    }

    private static InputStream b(Context context, String str) throws IOException {
        return context.getAssets().open(str);
    }

    public static int[] b() {
        return new int[]{20, 16};
    }

    private static Drawable c(Context context, String str) throws Exception {
        InputStream inputStreamB = b(context, e + str + ".png");
        TypedValue typedValue = new TypedValue();
        typedValue.density = 240;
        Drawable drawableA = Build.VERSION.SDK_INT > a ? aN.a(context.getResources(), typedValue, inputStreamB, str, (BitmapFactory.Options) null) : Drawable.createFromResourceStream(context.getResources(), typedValue, inputStreamB, str);
        if (inputStreamB != null) {
            inputStreamB.close();
        }
        return drawableA;
    }
}
