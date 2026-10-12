package com.iflytek.cloud;

import android.content.Context;
import com.iflytek.cloud.util.FileDownloadListener;
import com.iflytek.cloud.util.ResourceUtil;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.aI;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class VoiceWakeuper extends AbstractC0062z {
    private static VoiceWakeuper a = null;
    private aI c;

    private VoiceWakeuper(Context context, InitListener initListener) {
        this.c = null;
        this.c = new aI(context);
    }

    public static synchronized VoiceWakeuper createWakeuper(Context context, InitListener initListener) {
        if (a == null) {
            a = new VoiceWakeuper(context, initListener);
        }
        return a;
    }

    public static VoiceWakeuper getWakeuper() {
        return a;
    }

    public void cancel() {
        this.c.cancel(false);
    }

    public boolean destroy() {
        boolean zDestroy = this.c != null ? this.c.destroy() : true;
        if (zDestroy) {
            a = null;
        }
        SpeechUtility utility = SpeechUtility.getUtility();
        if (utility != null) {
            C0020ai.a("Destory ivw engine.");
            utility.setParameter(ResourceUtil.ENGINE_DESTROY, "ivw");
        }
        return zDestroy;
    }

    public int downloadResource(String str, String str2, String str3, FileDownloadListener fileDownloadListener) {
        return this.c.a(str, str2, str3, true, fileDownloadListener);
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    public boolean isListening() {
        return this.c.f();
    }

    public int queryResource(String str, RequestListener requestListener) {
        return this.c.a(str, true, requestListener);
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startListening(WakeuperListener wakeuperListener) {
        this.c.setParameter(SpeechConstant.PARAMS, null);
        this.c.setParameter(this.b);
        return this.c.a(wakeuperListener);
    }

    public void stopListening() {
        this.c.e();
    }

    public int writeAudio(byte[] bArr, int i, int i2) {
        if (this.c != null && this.c.f()) {
            return this.c.a(bArr, i, i2);
        }
        C0020ai.b("VoiceWakeup writeAudio failed, is not running");
        return ErrorCode.ERROR_ENGINE_CALL_FAIL;
    }
}
