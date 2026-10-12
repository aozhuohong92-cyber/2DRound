package com.game.core;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import com.iflytek.cloud.SpeechEvent;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class WebcamActivity extends Activity {
    private static final String GALLERY_DIR = "image/*";
    private static final int REQ_CODE_CROP = 2;
    private static final int REQ_CODE_CROP_RESULT = 3;
    private static final int REQ_CODE_TAKE_PHOTO = 1;
    private String filepath = null;
    private String filename = null;
    private String fullpath = null;
    private String filetype = "png";

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.filepath = getIntent().getStringExtra("filepath");
        this.filename = getIntent().getStringExtra("filename");
        this.filetype = getIntent().getStringExtra("filetype");
        this.fullpath = this.filepath + this.filename;
        String type = getIntent().getStringExtra("type");
        if (type.equals("TakePhoto")) {
            takePhoto();
        } else if (type.equals("OpenPhotoGallery")) {
            openPhotoGallery();
        } else {
            sendMessage(1, "使用摄像机服务时，调用了未知功能: " + type);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (-1 == resultCode) {
            switch (requestCode) {
                case 1:
                    File picture = new File(Environment.getExternalStorageDirectory() + "/temp.jpg");
                    crop(Uri.fromFile(picture));
                    break;
                case 2:
                    if (data == null) {
                        sendMessage(2, "剪裁照片时收到空路径，可能是拍照失败或是选取了不存在的照片");
                        return;
                    } else {
                        crop(data.getData());
                        break;
                    }
                case 3:
                    Bundle extras = data.getExtras();
                    try {
                    } catch (Exception e) {
                        sendMessage(4, "保存照片失败，原因: 可能是设置了错误的保存路径或是没有写入权限");
                        e.printStackTrace();
                    } finally {
                        finish();
                    }
                    if (extras == null) {
                        sendMessage(3, "剪裁照片时收到空路径，可能是拍照失败或是选取了不存在的照片");
                        return;
                    }
                    Bitmap photo = (Bitmap) extras.getParcelable(SpeechEvent.KEY_EVENT_RECORD_DATA);
                    savePhoto(photo);
                    sendMessage(0, this.fullpath);
                    break;
                default:
                    return;
            }
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    public static void startService(Activity activity, String type, String filepath, String filename, String filetype) {
        Intent intent = new Intent(activity, (Class<?>) WebcamActivity.class);
        intent.putExtra("type", type);
        intent.putExtra("filepath", filepath);
        intent.putExtra("filename", filename);
        intent.putExtra("filetype", filetype);
        activity.startActivity(intent);
    }

    public void takePhoto() {
        Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
        intent.putExtra("output", Uri.fromFile(new File(Environment.getExternalStorageDirectory(), "temp.jpg")));
        startActivityForResult(intent, 1);
    }

    public void openPhotoGallery() {
        Intent intent = new Intent("android.intent.action.PICK", (Uri) null);
        intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, GALLERY_DIR);
        startActivityForResult(intent, 2);
    }

    private void sendMessage(int code, String msg) {
        GameHelper.callLuaFunction("callBackWebcam", code, msg);
    }

    private void crop(Uri uri) {
        Intent intent = new Intent("com.android.camera.action.CROP");
        intent.setDataAndType(uri, GALLERY_DIR);
        intent.putExtra("crop", "true");
        intent.putExtra("aspectX", 1);
        intent.putExtra("aspectY", 1);
        intent.putExtra("outputX", 300);
        intent.putExtra("outputY", 300);
        intent.putExtra("return-data", true);
        startActivityForResult(intent, 3);
    }

    private void savePhoto(Bitmap bitmap) throws Throwable {
        FileOutputStream out = null;
        try {
            File dir = new File(this.filepath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            if (this.filetype.equals("jpg")) {
                Bitmap img = Bitmap.createScaledBitmap(bitmap, 128, 128, false);
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(this.fullpath, false));
                img.compress(Bitmap.CompressFormat.JPEG, 100, bos);
                bos.flush();
                bos.close();
            } else {
                FileOutputStream out2 = new FileOutputStream(this.fullpath);
                try {
                    bitmap.compress(Bitmap.CompressFormat.PNG, 100, out2);
                    out2.flush();
                    out = out2;
                } catch (Throwable th) {
                    th = th;
                    out = out2;
                    if (out != null) {
                        out.close();
                    }
                    throw th;
                }
            }
            if (out != null) {
                out.close();
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
