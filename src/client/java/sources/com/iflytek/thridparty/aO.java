package com.iflytek.thridparty;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aO extends Dialog {
    protected aQ a;
    private a b;

    public interface a {
        void a();
    }

    public aO(Context context) {
        super(context);
        this.a = null;
        this.b = new aP(this);
    }

    public boolean destroy() {
        if (isShowing()) {
            return false;
        }
        boolean zD = this.a.d();
        this.a = null;
        return zD;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        this.a.c();
        super.dismiss();
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(this.a);
        getWindow().setBackgroundDrawable(new ColorDrawable(0));
    }

    @Override // android.app.Dialog
    public void show() {
        setCanceledOnTouchOutside(true);
        this.a.a(this.b);
        this.a.b();
        super.show();
    }
}
