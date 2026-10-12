package com.iflytek.speech;

import android.content.Context;
import android.content.Intent;
import android.os.RemoteException;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.InitListener;
import com.iflytek.cloud.SpeechUtility;
import com.iflytek.speech.aidl.ISpeechUnderstander;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeechUnderstanderAidl extends SpeechModuleAidl<ISpeechUnderstander> {
    public SpeechUnderstanderAidl(Context context, InitListener initListener) {
        super(context, initListener, UtilityConfig.ACTION_SPEECH_UNDERSTANDER);
    }

    public int cancel(SpeechUnderstanderListener speechUnderstanderListener) {
        if (this.mService == 0) {
            return 21003;
        }
        if (speechUnderstanderListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        try {
            ((ISpeechUnderstander) this.mService).cancel(speechUnderstanderListener);
            return 0;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        } catch (Exception e2) {
            e2.printStackTrace();
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        }
    }

    @Override // com.iflytek.speech.SpeechModuleAidl, com.iflytek.speech.ISpeechModule
    public /* bridge */ /* synthetic */ boolean destory() {
        return super.destory();
    }

    @Override // com.iflytek.speech.SpeechModuleAidl, com.iflytek.speech.ISpeechModule
    public /* bridge */ /* synthetic */ Intent getIntent() {
        return super.getIntent();
    }

    @Override // com.iflytek.speech.SpeechModuleAidl, com.iflytek.speech.ISpeechModule
    public String getParameter(String str) {
        return super.getParameter(str);
    }

    @Override // com.iflytek.speech.SpeechModuleAidl
    public /* bridge */ /* synthetic */ boolean isActionInstalled(Context context, String str) {
        return super.isActionInstalled(context, str);
    }

    @Override // com.iflytek.speech.SpeechModuleAidl, com.iflytek.speech.ISpeechModule
    public /* bridge */ /* synthetic */ boolean isAvailable() {
        return super.isAvailable();
    }

    public boolean isUnderstanding() {
        try {
            return this.mService != 0 ? ((ISpeechUnderstander) this.mService).isUnderstanding() : false;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return false;
        } catch (Exception e2) {
            e2.printStackTrace();
            return false;
        }
    }

    @Override // com.iflytek.speech.SpeechModuleAidl, com.iflytek.speech.ISpeechModule
    public int setParameter(String str, String str2) {
        return super.setParameter(str, str2);
    }

    public int startUnderstanding(SpeechUnderstanderListener speechUnderstanderListener) {
        if (this.mService == 0) {
            return 21003;
        }
        if (speechUnderstanderListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        try {
            ((ISpeechUnderstander) this.mService).startUnderstanding(getIntent(), speechUnderstanderListener);
            return 0;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        } catch (Exception e2) {
            e2.printStackTrace();
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        }
    }

    public int stopUnderstanding(SpeechUnderstanderListener speechUnderstanderListener) {
        if (this.mService == 0) {
            return 21003;
        }
        if (speechUnderstanderListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        try {
            ((ISpeechUnderstander) this.mService).stopUnderstanding(speechUnderstanderListener);
            return 0;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        } catch (Exception e2) {
            e2.printStackTrace();
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        }
    }

    public int writeAudio(byte[] bArr, int i, int i2) {
        if (SpeechUtility.getUtility().getServiceVersion() < 44) {
            return ErrorCode.ERROR_VERSION_LOWER;
        }
        if (this.mService == 0) {
            return 21003;
        }
        try {
            ((ISpeechUnderstander) this.mService).writeAudio(getIntent(), bArr, i, i2);
            return 0;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return 0;
        } catch (Exception e2) {
            e2.printStackTrace();
            return 0;
        }
    }
}
