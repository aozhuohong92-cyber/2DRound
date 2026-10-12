package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechListener;
import com.iflytek.cloud.TextUnderstanderListener;
import com.iflytek.cloud.UnderstanderResult;
import com.iflytek.thridparty.A;
import java.io.UnsupportedEncodingException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aH extends A {

    private class a implements SpeechListener {
        private TextUnderstanderListener b;

        public a(TextUnderstanderListener textUnderstanderListener) {
            this.b = textUnderstanderListener;
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onBufferReceived(byte[] bArr) {
            if (bArr != null) {
                try {
                    this.b.onResult(new UnderstanderResult(new String(bArr, "utf-8")));
                } catch (UnsupportedEncodingException e) {
                    C0020ai.a(e);
                } catch (NullPointerException e2) {
                    C0020ai.a(e2);
                }
            }
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onCompleted(SpeechError speechError) {
            if (this.b == null || speechError == null) {
                return;
            }
            this.b.onError(speechError);
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onEvent(int i, Bundle bundle) {
        }
    }

    public aH(Context context) {
        super(context);
    }

    public int a(String str, TextUnderstanderListener textUnderstanderListener) {
        if (TextUtils.isEmpty(getParameter("asr_sch"))) {
            setParameter("asr_sch", "1");
        }
        if (TextUtils.isEmpty(getParameter(SpeechConstant.NLP_VERSION))) {
            setParameter(SpeechConstant.NLP_VERSION, "2.0");
        }
        if (TextUtils.isEmpty(getParameter(SpeechConstant.RESULT_TYPE))) {
            setParameter(SpeechConstant.RESULT_TYPE, "json");
        }
        this.d = new D(this.a, this.b, a("textunderstand"));
        ((D) this.d).a(new A.a(new a(textUnderstanderListener)), str);
        return 0;
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        super.cancel(z);
    }

    @Override // com.iflytek.thridparty.A
    public boolean destroy() {
        return super.destroy();
    }

    public boolean e() {
        return d();
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }
}
