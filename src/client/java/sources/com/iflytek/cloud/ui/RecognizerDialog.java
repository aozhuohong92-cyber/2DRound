package com.iflytek.cloud.ui;

import android.content.Context;
import com.iflytek.cloud.InitListener;
import com.iflytek.cloud.resource.Resource;
import com.iflytek.thridparty.aO;
import java.util.Locale;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RecognizerDialog extends aO {
    public RecognizerDialog(Context context, InitListener initListener) {
        super(context);
        this.a = new a(context, initListener);
    }

    @Override // com.iflytek.thridparty.aO, android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        super.dismiss();
    }

    public void setListener(RecognizerDialogListener recognizerDialogListener) {
        ((a) this.a).a(recognizerDialogListener);
    }

    public void setParameter(String str, String str2) {
        ((a) this.a).a(str, str2);
    }

    public void setUILanguage(Locale locale) {
        Resource.setUILanguage(locale);
    }

    @Override // com.iflytek.thridparty.aO, android.app.Dialog
    public void show() {
        super.show();
    }
}
