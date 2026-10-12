package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.DataDownloader;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechListener;
import com.iflytek.cloud.VerifierListener;
import com.iflytek.cloud.VerifierResult;
import com.iflytek.thridparty.HandlerC0049m;
import java.util.Random;

/* renamed from: com.iflytek.thridparty.ax, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0035ax extends A {
    private boolean f;

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: com.iflytek.thridparty.ax$a */
    final class a implements VerifierListener {
        private VerifierListener b;
        private Handler c = new HandlerC0036ay(this, Looper.getMainLooper());

        public a(VerifierListener verifierListener) {
            this.b = null;
            this.b = verifierListener;
        }

        protected void a() {
            String strE = C0035ax.this.d.u().e(SpeechConstant.ISV_AUDIO_PATH);
            if (!TextUtils.isEmpty(strE) && U.a(((HandlerC0051o) C0035ax.this.d).j(), strE)) {
                U.a(C0035ax.this.d.u().b(SpeechConstant.AUDIO_FORMAT, null), strE, C0035ax.this.d.u().a(SpeechConstant.SAMPLE_RATE, C0035ax.this.d.q));
            }
            V.b(C0035ax.this.a, Boolean.valueOf(C0035ax.this.f), null);
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onBeginOfSpeech() {
            this.c.sendMessage(this.c.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onEndOfSpeech() {
            this.c.sendMessage(this.c.obtainMessage(3, 0, 0, null));
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onError(SpeechError speechError) {
            a();
            this.c.sendMessage(this.c.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message messageObtain = Message.obtain();
            messageObtain.what = i;
            messageObtain.arg1 = i2;
            messageObtain.arg2 = i3;
            messageObtain.obj = bundle;
            Message.obtain(this.c, 5, messageObtain).sendToTarget();
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onResult(VerifierResult verifierResult) {
            a();
            this.c.sendMessage(this.c.obtainMessage(4, verifierResult));
        }

        @Override // com.iflytek.cloud.VerifierListener
        public void onVolumeChanged(int i, byte[] bArr) {
            this.c.sendMessage(this.c.obtainMessage(1, i, 0, bArr));
        }
    }

    public C0035ax(Context context) {
        super(context);
        this.f = false;
    }

    public int a(VerifierListener verifierListener) {
        synchronized (this.c) {
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, true);
            if (this.d != null && this.d.s()) {
                this.d.b(this.b.a(SpeechConstant.ISV_INTERRUPT_ERROR, false));
            }
            this.d = new HandlerC0051o(this.a, this.b, a("verify"));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0051o) this.d).a(new a(verifierListener));
        }
        return 0;
    }

    public int a(byte[] bArr, int i, int i2) {
        int i3 = ErrorCode.MSP_ERROR_INVALID_DATA;
        synchronized (this.c) {
            if (this.d == null) {
                C0020ai.a("writeAudio error, no active session.");
                i3 = ErrorCode.ERROR_ENGINE_CALL_FAIL;
            } else if (bArr == null || bArr.length <= 0) {
                C0020ai.a("writeAudio error,buffer is null.");
            } else if (bArr.length < i2 + i) {
                C0020ai.a("writeAudio error,buffer length < length.");
            } else if (((HandlerC0051o) this.d).k() != -1) {
                i3 = ErrorCode.MSP_ERROR_INVALID_PARA;
            } else {
                ((HandlerC0051o) this.d).onRecordBuffer(bArr, i, i2);
                i3 = 0;
            }
        }
        return i3;
    }

    public String a(int i) {
        StringBuffer stringBuffer = new StringBuffer();
        Random random = new Random();
        String str = "023456789".charAt(random.nextInt("023456789".length())) + "";
        stringBuffer.append(str);
        for (int i2 = 0; i2 < i - 1; i2++) {
            Boolean bool = false;
            while (!bool.booleanValue()) {
                str = "023456789".charAt(random.nextInt("023456789".length())) + "";
                bool = stringBuffer.indexOf(str) >= 0 ? false : Integer.parseInt(new StringBuilder().append(stringBuffer.charAt(stringBuffer.length() + (-1))).append("").toString()) * Integer.parseInt(str) != 10;
            }
            stringBuffer.append(str);
        }
        return stringBuffer.toString();
    }

    public void a(SpeechListener speechListener) {
        DataDownloader dataDownloader = new DataDownloader(this.a);
        dataDownloader.setParameter(this.b);
        dataDownloader.downloadData(speechListener);
    }

    public void a(String str, String str2, SpeechListener speechListener) {
        this.b.a(SpeechConstant.ISV_CMD, str);
        this.b.a(SpeechConstant.AUTH_ID, str2);
        new HandlerC0049m(this.a, a("manager")).a(this.b, new HandlerC0049m.a(speechListener));
    }

    public void e() {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0051o) this.d).a();
            }
        }
    }

    public boolean f() {
        return d();
    }
}
