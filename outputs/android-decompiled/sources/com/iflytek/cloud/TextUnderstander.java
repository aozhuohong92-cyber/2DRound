package com.iflytek.cloud;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.msc.MSC;
import com.iflytek.speech.TextUnderstanderAidl;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.aH;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class TextUnderstander extends AbstractC0062z {
    private static TextUnderstander d = null;
    private aH a;
    private TextUnderstanderAidl c;
    private InitListener f;
    private a e = null;
    private Handler g = new q(this, Looper.getMainLooper());

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements TextUnderstanderListener {
        private TextUnderstanderListener b;
        private com.iflytek.speech.TextUnderstanderListener c;
        private Handler d = new s(this, Looper.getMainLooper());

        public a(TextUnderstanderListener textUnderstanderListener) {
            this.b = null;
            this.c = null;
            this.b = textUnderstanderListener;
            this.c = new r(this, TextUnderstander.this);
        }

        @Override // com.iflytek.cloud.TextUnderstanderListener
        public void onError(SpeechError speechError) {
            this.d.sendMessage(this.d.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.TextUnderstanderListener
        public void onResult(UnderstanderResult understanderResult) {
            this.d.sendMessage(this.d.obtainMessage(4, understanderResult));
        }
    }

    protected TextUnderstander(Context context, InitListener initListener) {
        this.a = null;
        this.c = null;
        this.f = null;
        this.f = initListener;
        if (MSC.isLoaded()) {
            this.a = new aH(context);
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null && utility.a() && utility.getEngineMode() != AbstractC0062z.a.MSC) {
            this.c = new TextUnderstanderAidl(context.getApplicationContext(), initListener);
        } else if (initListener != null) {
            Message.obtain(this.g, 0, 0, 0, null).sendToTarget();
        }
    }

    public static synchronized TextUnderstander createTextUnderstander(Context context, InitListener initListener) {
        if (d == null) {
            d = new TextUnderstander(context, initListener);
        }
        return d;
    }

    public static TextUnderstander getTextUnderstander() {
        return d;
    }

    protected void a(Context context) {
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility == null || !utility.a() || utility.getEngineMode() == AbstractC0062z.a.MSC) {
            if (this.f == null || this.c == null) {
                return;
            }
            this.c.destory();
            this.c = null;
            return;
        }
        if (this.c != null && !this.c.isAvailable()) {
            this.c.destory();
            this.c = null;
        }
        this.c = new TextUnderstanderAidl(context.getApplicationContext(), this.f);
    }

    public void cancel() {
        if (this.a != null && this.a.e()) {
            this.a.cancel(false);
        } else if (this.c == null || !this.c.isUnderstanding()) {
            C0020ai.b("SpeechUnderstander cancel failed, is not running");
        } else {
            this.c.cancel(this.e.c);
        }
    }

    public boolean destroy() {
        if (this.c != null) {
            this.c.destory();
            this.c = null;
        }
        boolean zDestroy = this.a != null ? this.a.destroy() : true;
        if (zDestroy) {
            d = null;
        }
        return zDestroy;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isUnderstanding() {
        if (this.a == null || !this.a.e()) {
            return this.c != null && this.c.isUnderstanding();
        }
        return true;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int understandText(String str, TextUnderstanderListener textUnderstanderListener) {
        AbstractC0062z.a aVarA = a(SpeechConstant.ENG_NLU, this.c);
        C0020ai.a("start engine mode = " + aVarA.toString());
        if (aVarA != AbstractC0062z.a.PLUS) {
            if (this.a == null) {
                return 21001;
            }
            this.a.setParameter(this.b);
            return this.a.a(str, textUnderstanderListener);
        }
        if (this.c == null) {
            return 21001;
        }
        this.c.setParameter(SpeechConstant.PARAMS, null);
        this.c.setParameter(SpeechConstant.PARAMS, this.b.toString());
        this.e = new a(textUnderstanderListener);
        return this.c.understandText(str, this.e.c);
    }
}
