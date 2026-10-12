package org.cocos2dx.lib;

import android.app.AlertDialog;
import android.content.ClipboardManager;
import android.content.DialogInterface;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import java.lang.ref.WeakReference;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Cocos2dxHandler extends Handler {
    public static final int HANDLER_COPY_TEXT = 4;
    public static final int HANDLER_SHOW_DIALOG = 1;
    private WeakReference<Cocos2dxActivity> mActivity;

    public Cocos2dxHandler(Cocos2dxActivity activity) {
        this.mActivity = new WeakReference<>(activity);
    }

    @Override // android.os.Handler
    public void handleMessage(Message msg) {
        switch (msg.what) {
            case 1:
                showDialog(msg);
                break;
            case 4:
                String str = (String) msg.obj;
                Log.d("sygame", "copyText = " + str);
                ClipboardManager cmb = (ClipboardManager) this.mActivity.get().getSystemService("clipboard");
                cmb.setText(str.trim());
                break;
        }
    }

    private void showDialog(Message msg) {
        Cocos2dxActivity theActivity = this.mActivity.get();
        DialogMessage dialogMessage = (DialogMessage) msg.obj;
        new AlertDialog.Builder(theActivity).setTitle(dialogMessage.title).setMessage(dialogMessage.message).setPositiveButton("Ok", new DialogInterface.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
            }
        }).create().show();
    }

    public static class DialogMessage {
        public String message;
        public String title;

        public DialogMessage(String title, String message) {
            this.title = title;
            this.message = message;
        }
    }
}
