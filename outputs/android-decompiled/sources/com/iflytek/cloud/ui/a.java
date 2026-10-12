package com.iflytek.cloud.ui;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.text.Html;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.method.LinkMovementMethod;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.URLSpan;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.iflytek.cloud.InitListener;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechRecognizer;
import com.iflytek.cloud.resource.Resource;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.V;
import com.iflytek.thridparty.aM;
import com.iflytek.thridparty.aQ;
import com.iflytek.thridparty.aR;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class a extends aQ implements View.OnClickListener {
    public static int a = 9;
    private LinearLayout d;
    private aR e;
    private RotateAnimation f;
    private SpeechRecognizer g;
    private RecognizerDialogListener h;
    private long i;
    private RecognizerListener j;
    private volatile int k;

    /* renamed from: com.iflytek.cloud.ui.a$a, reason: collision with other inner class name */
    public class C0001a extends ClickableSpan {
        private String b;

        public C0001a(String str) {
            this.b = str;
        }

        @Override // android.text.style.ClickableSpan
        public void onClick(View view) {
            try {
                Context context = view.getContext();
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(this.b));
                intent.addFlags(268435456);
                intent.putExtra("com.android.browser.application_id", context.getPackageName());
                context.startActivity(intent);
            } catch (Exception e) {
                C0020ai.a(e);
            }
        }

        @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint textPaint) {
            super.updateDrawState(textPaint);
        }
    }

    public a(Context context, InitListener initListener) {
        super(context.getApplicationContext());
        this.e = null;
        this.f = null;
        this.i = 0L;
        this.j = new b(this);
        this.g = SpeechRecognizer.createRecognizer(context.getApplicationContext(), initListener);
        a();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SpeechError speechError) {
        try {
            LinearLayout linearLayout = (LinearLayout) this.d.findViewWithTag("error");
            a((TextView) linearLayout.findViewWithTag("errtxt"), speechError);
            linearLayout.findViewWithTag("errview").setBackgroundDrawable(aM.a(getContext(), "warning"));
            setTag(speechError);
            this.k = 3;
            k();
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    private void g() {
        C0020ai.a("startRecognizing");
        long j = this.i;
        this.i = SystemClock.elapsedRealtime();
        if (this.i - j < 300) {
            return;
        }
        this.g.setParameter("msc.skin", "default");
        int iStartListening = this.g.startListening(this.j);
        if (iStartListening != 0) {
            a(new SpeechError(iStartListening));
        } else {
            i();
        }
    }

    private void h() {
        if (this.d != null) {
            this.d.destroyDrawingCache();
            this.d = null;
        }
        this.e = null;
        System.gc();
    }

    private void i() {
        if (this.e == null) {
            this.e = new aR(getContext().getApplicationContext());
        }
        this.k = 1;
        k();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void j() {
        try {
            ((FrameLayout) this.d.findViewWithTag("waiting")).findViewWithTag("control").startAnimation(this.f);
            this.k = 2;
            k();
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    private void k() {
        FrameLayout frameLayout = (FrameLayout) this.d.findViewWithTag("waiting");
        TextView textView = (TextView) this.d.findViewWithTag("title");
        LinearLayout linearLayout = (LinearLayout) this.d.findViewWithTag("error");
        TextView textView2 = (TextView) frameLayout.findViewWithTag("tips");
        if (this.k == 1) {
            linearLayout.setVisibility(8);
            textView.setVisibility(0);
            frameLayout.setVisibility(8);
            textView.setText(Resource.getTitle(2));
            this.e.a(0);
            this.e.invalidate();
            this.e.setVisibility(0);
            return;
        }
        if (this.k == 2) {
            textView.setVisibility(8);
            this.e.setVisibility(8);
            frameLayout.setVisibility(0);
            textView2.setVisibility(0);
            textView2.setText(Resource.getTitle(3));
            return;
        }
        if (this.k == 3) {
            textView.setVisibility(8);
            this.e.setVisibility(8);
            frameLayout.setVisibility(8);
            linearLayout.setVisibility(0);
        }
    }

    public void a() {
        try {
            Context applicationContext = getContext().getApplicationContext();
            View viewA = aM.a(applicationContext, "recognize", this);
            viewA.setBackgroundDrawable(aM.a(applicationContext.getApplicationContext(), "voice_bg.9"));
            this.d = (LinearLayout) viewA.findViewWithTag("container");
            V.a(this);
            this.e = new aR(applicationContext.getApplicationContext());
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, 0, 1.0f);
            layoutParams.bottomMargin = 20;
            this.d.addView(this.e, 1, layoutParams);
            ((FrameLayout) this.d.findViewWithTag("waiting")).findViewWithTag("control").setBackgroundDrawable(aM.a(getContext(), "waiting"));
            this.f = new RotateAnimation(0.0f, 360.0f, 1, 0.5f, 1, 0.5f);
            this.f.setRepeatCount(-1);
            this.f.setInterpolator(new LinearInterpolator());
            this.f.setDuration(700L);
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }

    public void a(TextView textView, SpeechError speechError) {
        String parameter = this.g.getParameter("view_tips_plain");
        boolean z = parameter != null && (parameter.equalsIgnoreCase("true") || parameter.equalsIgnoreCase("1"));
        textView.setText(Html.fromHtml(speechError.getHtmlDescription(!z)));
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        textView.bringToFront();
        CharSequence text = textView.getText();
        if (text instanceof Spannable) {
            int length = text.length();
            Spannable spannable = (Spannable) textView.getText();
            URLSpan[] uRLSpanArr = (URLSpan[]) spannable.getSpans(0, length, URLSpan.class);
            SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(text);
            spannableStringBuilder.clearSpans();
            for (URLSpan uRLSpan : uRLSpanArr) {
                spannableStringBuilder.setSpan(new C0001a(uRLSpan.getURL()), spannable.getSpanStart(uRLSpan), spannable.getSpanEnd(uRLSpan), 34);
            }
            int length2 = speechError.getHtmlDescription(false).length();
            int length3 = speechError.getHtmlDescription(true).length() - "<br>".length();
            spannableStringBuilder.setSpan(new ForegroundColorSpan(aM.a()[0]), 0, length2, 34);
            spannableStringBuilder.setSpan(new AbsoluteSizeSpan(aM.b()[0], true), 0, length2, 33);
            if (!z) {
                spannableStringBuilder.setSpan(new ForegroundColorSpan(aM.a()[1]), length2 + 1, length3 + 1, 34);
                spannableStringBuilder.setSpan(new AbsoluteSizeSpan(aM.b()[1], true), length2 + 1, length, 34);
            }
            textView.setText(spannableStringBuilder);
        }
    }

    public void a(RecognizerDialogListener recognizerDialogListener) {
        this.h = recognizerDialogListener;
        setOnClickListener(this);
    }

    public void a(String str, String str2) {
        this.g.setParameter(str, str2);
    }

    @Override // com.iflytek.thridparty.aQ
    public void b() {
        super.b();
        g();
    }

    @Override // com.iflytek.thridparty.aQ
    public void c() {
        if (this.g.isListening()) {
            this.g.cancel();
        }
        super.c();
    }

    @Override // com.iflytek.thridparty.aQ
    protected boolean d() {
        if (!super.d()) {
            return false;
        }
        h();
        return this.g.destroy();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        switch (this.k) {
            case 1:
                this.g.stopListening();
                j();
                break;
            case 3:
                if (view.getTag() != null && ((SpeechError) view.getTag()).getErrorCode() == 20001) {
                    e();
                    break;
                } else {
                    g();
                    break;
                }
                break;
        }
    }
}
