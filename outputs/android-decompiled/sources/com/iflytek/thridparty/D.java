package com.iflytek.thridparty;

import android.content.Context;
import android.os.HandlerThread;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechListener;
import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class D extends AbstractHandlerC0059w {
    private SpeechListener a;
    private C b;
    private String c;

    private class a {
        private byte[] b;
        private String c;

        public a(byte[] bArr, String str) {
            this.b = null;
            this.c = "";
            this.b = bArr;
            this.c = str;
        }

        public byte[] a() {
            return this.b;
        }

        public String b() {
            return this.c;
        }
    }

    public D(Context context, C0027ap c0027ap) {
        super(context);
        this.a = null;
        this.b = new C();
        this.c = null;
        a(c0027ap);
    }

    public D(Context context, C0027ap c0027ap, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.a = null;
        this.b = new C();
        this.c = null;
        a(c0027ap);
    }

    public SpeechError a(String str, String str2) {
        this.c = "auth";
        SpeechError speechError = null;
        try {
            try {
                C.a(this.r, str, str2, this);
            } catch (SpeechError e) {
                C0020ai.a(e);
                if (e != null) {
                    C0020ai.a(w() + " occur Error = " + e.toString());
                }
                speechError = e;
            } catch (IOException e2) {
                C0020ai.a(e2);
                SpeechError speechError2 = new SpeechError(ErrorCode.ERROR_FILE_ACCESS);
                if (speechError2 != null) {
                    C0020ai.a(w() + " occur Error = " + speechError2.toString());
                }
                speechError = speechError2;
            } catch (Exception e3) {
                C0020ai.a(e3);
                SpeechError speechError3 = new SpeechError(21003);
                if (speechError3 != null) {
                    C0020ai.a(w() + " occur Error = " + speechError3.toString());
                }
                speechError = speechError3;
            }
            return speechError;
        } finally {
            if (speechError != null) {
                C0020ai.a(w() + " occur Error = " + speechError.toString());
            }
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        byte[] bArrA;
        super.a(message);
        switch (message.what) {
            case 10:
                a aVar = (a) message.obj;
                if (aVar.a() != null && aVar.a().length > 0) {
                    bArrA = this.b.a(this.r, aVar.b(), aVar.a(), this);
                    break;
                } else {
                    throw new SpeechError(ErrorCode.ERROR_EMPTY_UTTERANCE);
                }
                break;
            case 11:
                bArrA = this.b.a(this.r, this);
                break;
            case 12:
                String str = (String) message.obj;
                if (!TextUtils.isEmpty(str)) {
                    bArrA = this.b.a(this.r, this, str);
                    break;
                } else {
                    throw new SpeechError(ErrorCode.ERROR_EMPTY_UTTERANCE);
                }
            default:
                bArrA = null;
                break;
        }
        if (bArrA == null) {
            throw new SpeechError(ErrorCode.ERROR_INVALID_RESULT);
        }
        if (this.a != null) {
            this.a.onBufferReceived(bArrA);
        }
        b((SpeechError) null);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        super.a(speechError);
        if (this.a == null || this.s) {
            return;
        }
        this.a.onCompleted(speechError);
    }

    public void a(SpeechListener speechListener) {
        this.a = speechListener;
        a(11);
    }

    public void a(SpeechListener speechListener, String str) {
        this.c = "sch";
        this.a = speechListener;
        d(obtainMessage(12, str));
    }

    public void a(SpeechListener speechListener, String str, byte[] bArr) {
        this.c = "uup";
        this.a = speechListener;
        d(obtainMessage(10, new a(bArr, str)));
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return null;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return null;
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return this.c;
    }
}
