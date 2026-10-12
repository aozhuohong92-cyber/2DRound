package com.iflytek.speech;

import android.content.Context;
import android.content.Intent;
import android.os.RemoteException;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.InitListener;
import com.iflytek.speech.aidl.ITextUnderstander;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class TextUnderstanderAidl extends SpeechModuleAidl<ITextUnderstander> {
    public static final String SCENE = "scene";
    private static final String TEXT = "text";

    public TextUnderstanderAidl(Context context, InitListener initListener) {
        super(context, initListener, UtilityConfig.ACTION_TEXT_UNDERSTANDER);
    }

    public int cancel(TextUnderstanderListener textUnderstanderListener) {
        if (this.mService == 0) {
            return 21003;
        }
        if (textUnderstanderListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        try {
            ((ITextUnderstander) this.mService).cancel(textUnderstanderListener);
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
            return this.mService != 0 ? ((ITextUnderstander) this.mService).isUnderstanding() : false;
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

    public int understandText(String str, TextUnderstanderListener textUnderstanderListener) {
        if (this.mService == 0) {
            return 21003;
        }
        if (textUnderstanderListener == null) {
            return ErrorCode.ERROR_INVALID_PARAM;
        }
        try {
            Intent intent = getIntent();
            intent.putExtra(TEXT, str);
            ((ITextUnderstander) this.mService).understandText(intent, textUnderstanderListener);
            return 0;
        } catch (RemoteException e) {
            C0020ai.a(e);
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        } catch (Exception e2) {
            e2.printStackTrace();
            return ErrorCode.ERROR_ENGINE_CALL_FAIL;
        }
    }
}
