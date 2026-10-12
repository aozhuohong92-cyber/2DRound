package com.iflytek.thridparty;

import android.content.Context;
import android.os.HandlerThread;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.AbstractHandlerC0059w;
import java.util.ArrayList;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class E extends AbstractHandlerC0059w {
    public static int a = 0;
    public static int b = 0;
    private String c;
    private M d;
    private F e;
    private ArrayList<byte[]> f;
    private int g;
    private int h;
    private StringBuilder i;
    private boolean j;
    private int k;
    private int l;

    public E(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.c = "";
        this.d = null;
        this.e = null;
        this.f = null;
        this.g = 0;
        this.h = 0;
        this.i = null;
        this.j = false;
        this.k = -1;
        this.l = 0;
        this.d = new M();
        this.f = new ArrayList<>();
        this.i = new StringBuilder();
        a(c0027ap);
    }

    private void i() throws SpeechError {
        this.e.a(this.f, Math.min(99, (this.g * 100) / this.c.length()), this.h, this.g, this.i.toString());
        this.i.delete(0, this.i.length());
        this.f = new ArrayList<>();
        this.h = Math.min(this.g + 1, this.c.length() - 1);
    }

    protected void a() throws Exception {
        C0020ai.a("tts msg start:" + System.currentTimeMillis());
        String strE = u().e(SpeechConstant.ENGINE_TYPE);
        boolean zA = u().a(SpeechConstant.NET_CHECK, true);
        if (SpeechConstant.TYPE_CLOUD.equals(strE) && zA) {
            Y.b(this.r);
        }
        a(1);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        switch (message.what) {
            case 0:
                a();
                break;
            case 1:
                b();
                break;
            case 5:
                h();
                break;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        a = this.d.b("upflow");
        b = this.d.b("downflow");
        f();
        C0021aj.a("SessionEndBegin", null);
        if (this.e == null) {
            this.d.a("user abort");
        } else if (speechError != null) {
            this.d.a("error" + speechError.getErrorCode());
            C0020ai.a("QTts Error Code = " + speechError.getErrorCode());
        } else {
            this.d.a("success");
        }
        C0021aj.a("SessionEndEnd", null);
        super.a(speechError);
        if (this.e != null) {
            if (this.s) {
                C0020ai.a("MscSynthesizer#onCancel");
            } else {
                C0020ai.a("MscSynthesizer#onEnd");
                this.e.a(speechError);
            }
        }
    }

    public void a(String str, F f) {
        this.c = str;
        this.e = f;
        if (str == null || TextUtils.isEmpty(str)) {
            this.e.a(new SpeechError(ErrorCode.ERROR_EMPTY_UTTERANCE));
        } else {
            this.j = u().a(SpeechConstant.TTS_SPELL_INFO, false);
            a_();
        }
    }

    protected void b() throws Exception {
        C0021aj.a("SDKSessionBegin", null);
        int iA = this.d.a(this.r, null, this);
        if (iA != 0) {
            this.l++;
            if (this.l > 40) {
                throw new SpeechError(iA);
            }
            if (s()) {
                a(1, AbstractHandlerC0059w.a.normal, false, 15);
                return;
            }
            return;
        }
        byte[] bytes = this.c.getBytes(p());
        if ("unicode".equals(p())) {
            byte[] bArr = new byte[bytes.length - 2];
            System.arraycopy(bytes, 2, bArr, 0, bytes.length - 2);
            this.d.a(bArr);
        } else {
            this.d.a(bytes);
        }
        a(AbstractHandlerC0059w.b.waitresult);
        a(5);
        n();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public void b(boolean z) {
        if (z && s() && this.e != null) {
            this.e.a(new SpeechError(ErrorCode.ERROR_INTERRUPT));
        }
        super.b(z);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void c() {
        this.k = u().a(SpeechConstant.TTS_BUFFER_TIME, this.k);
        super.c();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.d.g();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.d.e();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return "tts";
    }

    protected void h() throws Exception {
        C0021aj.a("GetNotifyResult", null);
        if (this.d.d()) {
            if (this.e != null) {
                this.e.a(this.f, 100, this.h, this.c.length() - 1, this.i.toString());
            }
            b((SpeechError) null);
            return;
        }
        byte[] bArrA = this.d.a();
        if (bArrA == null || this.e == null) {
            a(5, AbstractHandlerC0059w.a.normal, false, 10);
        } else {
            int iB = (this.d.b() / 2) - 1;
            if (this.j) {
                String strC = this.d.c();
                if (!TextUtils.isEmpty(strC)) {
                    this.i.append(strC);
                    this.i.append("#\n");
                }
            }
            if (this.k < 0 && this.g != 0 && iB != this.g && this.f.size() > 0) {
                i();
            }
            n();
            this.g = iB;
            this.f.add(bArrA);
            if (this.k >= 0) {
                i();
            }
            a(5, AbstractHandlerC0059w.a.normal, false, 0);
        }
        f();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String p() {
        return u().b(SpeechConstant.TEXT_ENCODING, "unicode");
    }
}
