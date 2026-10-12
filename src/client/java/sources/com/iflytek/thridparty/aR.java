package com.iflytek.thridparty;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aR extends View {
    Path a;
    private Drawable b;
    private Drawable c;
    private PaintFlagsDrawFilter d;

    public aR(Context context) {
        super(context);
        this.d = new PaintFlagsDrawFilter(1, 2);
        try {
            this.b = aM.a(getContext(), "voice_empty");
            this.c = aM.a(getContext(), "voice_full");
            this.b.setBounds(new Rect((-this.b.getIntrinsicWidth()) / 2, (-this.b.getIntrinsicHeight()) / 2, this.b.getIntrinsicWidth() / 2, this.b.getIntrinsicHeight() / 2));
            this.c.setBounds(new Rect((-this.c.getIntrinsicWidth()) / 2, (-this.c.getIntrinsicHeight()) / 2, this.c.getIntrinsicWidth() / 2, this.c.getIntrinsicHeight() / 2));
            this.a = new Path();
            a(0);
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    public void a(int i) {
        this.a.reset();
        this.a.addCircle(0.0f, 0.0f, (this.b.getIntrinsicWidth() * i) / 12, Path.Direction.CCW);
    }

    public void finalize() throws Throwable {
        this.b = null;
        this.c = null;
        super.finalize();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        canvas.save();
        canvas.setDrawFilter(this.d);
        canvas.translate(getWidth() / 2, getHeight() / 2);
        this.b.draw(canvas);
        canvas.clipPath(this.a);
        this.c.draw(canvas);
        canvas.restore();
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        Drawable background = getBackground();
        if (background != null) {
            size = background.getMinimumWidth();
            size2 = background.getMinimumHeight();
        }
        setMeasuredDimension(resolveSize(size, i), resolveSize(size2, i2));
    }
}
