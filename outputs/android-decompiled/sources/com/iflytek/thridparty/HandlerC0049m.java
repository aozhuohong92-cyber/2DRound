package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechListener;

/* renamed from: com.iflytek.thridparty.m, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HandlerC0049m extends AbstractHandlerC0059w {
    private C0052p a;
    private SpeechListener b;

    /* renamed from: com.iflytek.thridparty.m$a */
    public static final class a implements SpeechListener {
        private SpeechListener a;
        private Handler b = new HandlerC0050n(this, Looper.getMainLooper());

        public a(SpeechListener speechListener) {
            this.a = null;
            this.a = speechListener;
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onBufferReceived(byte[] bArr) {
            this.b.sendMessage(this.b.obtainMessage(1, bArr));
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onCompleted(SpeechError speechError) {
            this.b.sendMessage(this.b.obtainMessage(2, speechError));
        }

        @Override // com.iflytek.cloud.SpeechListener
        public void onEvent(int i, Bundle bundle) {
            this.b.sendMessage(this.b.obtainMessage(0, i, 0, bundle));
        }
    }

    public HandlerC0049m(Context context, HandlerThread handlerThread) {
        super(context, handlerThread);
        this.a = new C0052p();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(Message message) throws Exception {
        switch (message.what) {
            case 13:
                synchronized (HandlerC0049m.class) {
                    String str = String.format("{'ret':%d,'cmd':%s}", Integer.valueOf(this.a.a(this.r, this)), u().e(SpeechConstant.ISV_CMD));
                    if (this.b != null) {
                        this.b.onBufferReceived(str.getBytes(o()));
                    }
                    a(21);
                }
                return;
            default:
                return;
        }
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected void a(SpeechError speechError) {
        super.a(speechError);
        if (this.b != null) {
            this.b.onCompleted(speechError);
        }
    }

    public void a(C0027ap c0027ap, a aVar) {
        this.b = aVar;
        a(c0027ap);
        Message messageObtain = Message.obtain();
        messageObtain.what = 13;
        d(messageObtain);
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String e() {
        return this.a.g();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    public String f() {
        return this.a.f();
    }

    @Override // com.iflytek.thridparty.AbstractHandlerC0059w
    protected String g() {
        return SpeechConstant.ENG_IVP;
    }
}
