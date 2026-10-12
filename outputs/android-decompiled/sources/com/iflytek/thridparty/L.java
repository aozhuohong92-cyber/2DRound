package com.iflytek.thridparty;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechEvent;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class L implements F {
    final /* synthetic */ Handler a;
    final /* synthetic */ String b;
    final /* synthetic */ G c;

    L(G g, Handler handler, String str) {
        this.c = g;
        this.a = handler;
        this.b = str;
    }

    @Override // com.iflytek.thridparty.F
    public void a(SpeechError speechError) {
        if (this.c.m == null || speechError == null) {
            return;
        }
        if (this.c.t) {
            Message.obtain(this.a, 6, speechError).sendToTarget();
        } else {
            this.c.m.onCompleted(speechError);
        }
    }

    @Override // com.iflytek.thridparty.F
    public void a(ArrayList<byte[]> arrayList, int i, int i2, int i3, String str) throws SpeechError, IOException {
        if (this.c.d != null && this.c.d.u().a(SpeechConstant.TTS_DATA_NOTIFY, false) && this.c.m != null && arrayList != null) {
            for (int i4 = 0; i4 < arrayList.size(); i4++) {
                byte[] bArr = arrayList.get(i4);
                Bundle bundle = new Bundle();
                bundle.putByteArray(SpeechEvent.KEY_EVENT_TTS_BUFFER, bArr);
                if (this.c.t) {
                    Message messageObtain = Message.obtain();
                    messageObtain.what = 21001;
                    messageObtain.arg1 = 0;
                    messageObtain.arg2 = 0;
                    messageObtain.obj = bundle;
                    Message.obtain(this.a, 7, 0, 0, messageObtain).sendToTarget();
                } else {
                    this.c.m.onEvent(21001, 0, 0, bundle);
                }
            }
        }
        try {
            this.c.k.a(arrayList, i, i2, i3);
            if (this.c.m != null) {
                Bundle bundle2 = new Bundle();
                bundle2.putInt("percent", i);
                bundle2.putInt("begpos", i2);
                bundle2.putInt("endpos", i3);
                bundle2.putString("spellinfo", str);
                if (this.c.t) {
                    Message.obtain(this.a, 2, bundle2).sendToTarget();
                } else {
                    this.c.m.onBufferProgress(i, i2, i3, str);
                }
            }
            if (i >= 100) {
                if (this.c.d == null || !this.c.d.u().a(SpeechConstant.TTS_DATA_NOTIFY, false)) {
                    String strB = this.c.d != null ? this.c.d.u().b(SpeechConstant.AUDIO_FORMAT, null) : null;
                    if (this.c.k.b() == 0) {
                        throw new SpeechError(ErrorCode.MSP_ERROR_NO_DATA);
                    }
                    if (!this.c.k.b(strB)) {
                        throw new IOException();
                    }
                } else {
                    String strB2 = this.c.d.u().b(SpeechConstant.AUDIO_FORMAT, null);
                    if (!TextUtils.isEmpty(this.b) && !this.c.k.b(strB2)) {
                        throw new IOException();
                    }
                }
                if (this.c.m != null) {
                    if (this.c.t) {
                        Message.obtain(this.a, 6, null).sendToTarget();
                    } else {
                        this.c.m.onCompleted(null);
                    }
                }
            }
        } catch (IOException e) {
            C0020ai.a(e);
            if (this.c.m != null) {
                if (this.c.t) {
                    Message.obtain(this.a, 6, new SpeechError(ErrorCode.ERROR_FILE_ACCESS)).sendToTarget();
                } else {
                    try {
                        this.c.m.onCompleted(new SpeechError(ErrorCode.ERROR_FILE_ACCESS));
                    } catch (Exception e2) {
                    }
                }
            }
            if (this.c.d != null) {
                this.c.d.b(false);
            }
        }
    }
}
