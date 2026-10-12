package com.iflytek.cloud;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0031at;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class FaceRequest extends AbstractC0062z {
    private C0031at a;
    private Context c;

    protected class a implements RequestListener {
        private RequestListener b;
        private Handler c = new b(this, Looper.getMainLooper());

        public a(RequestListener requestListener) {
            this.b = null;
            this.b = requestListener;
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onBufferReceived(byte[] bArr) {
            this.c.sendMessage(this.c.obtainMessage(1, bArr));
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onCompleted(SpeechError speechError) {
            this.c.sendMessage(this.c.obtainMessage(2, speechError));
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onEvent(int i, Bundle bundle) {
            this.c.sendMessage(this.c.obtainMessage(0, i, 0, bundle));
        }
    }

    public FaceRequest(Context context) {
        this.c = context;
    }

    public void cancel() {
        synchronized (this) {
            if (this.a != null) {
                this.a.a();
                this.a = null;
            }
        }
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public int sendRequest(byte[] bArr, RequestListener requestListener) {
        int iA;
        synchronized (this) {
            if (this.a != null) {
                this.a.a();
                this.a = null;
            }
            this.a = new C0031at(this.c, this.b);
            iA = this.a.a(bArr, new a(requestListener));
        }
        return iA;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }
}
