package com.iflytek.thridparty;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.iflytek.thridparty.aO;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aQ extends LinearLayout {
    private aO.a a;
    protected boolean b;
    protected boolean c;

    public aQ(Context context) {
        super(context);
        this.a = null;
        this.b = true;
        this.c = true;
    }

    protected static boolean a(ViewGroup viewGroup) {
        try {
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = viewGroup.getChildAt(i);
                childAt.setOnClickListener(null);
                childAt.setBackgroundDrawable(null);
            }
            viewGroup.removeAllViews();
            viewGroup.setOnClickListener(null);
            viewGroup.setBackgroundDrawable(null);
            return true;
        } catch (Exception e) {
            C0020ai.a(e);
            return false;
        }
    }

    public void a(aO.a aVar) {
        this.a = aVar;
    }

    protected void b() {
    }

    protected void c() {
    }

    protected boolean d() {
        try {
            a(this);
            return true;
        } catch (Exception e) {
            C0020ai.a(e);
            return false;
        }
    }

    protected void e() {
        Intent intent = new Intent();
        if (Build.VERSION.SDK_INT > 10) {
            intent.setAction("android.settings.SETTINGS");
        } else {
            intent.setAction("android.settings.WIRELESS_SETTINGS");
        }
        intent.addFlags(268435456);
        getContext().startActivity(intent);
    }

    public void f() {
        if (this.a != null) {
            this.a.a();
        }
    }
}
