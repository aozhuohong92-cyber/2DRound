package com.iflytek.thridparty;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.RequestListener;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.WakeuperListener;
import com.iflytek.cloud.WakeuperResult;
import com.iflytek.cloud.util.FileDownloadListener;
import com.iflytek.cloud.util.ResourceUtil;
import java.io.File;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aI extends A {
    private static String l = "respath";
    private boolean f;
    private String g;
    private String h;
    private String i;
    private String j;
    private boolean k;
    private C0055s m;
    private O n;

    /* JADX INFO: Access modifiers changed from: private */
    final class a implements FileDownloadListener {
        private FileDownloadListener b;
        private boolean g;
        private final int c = 0;
        private final int d = 1;
        private final int e = 2;
        private final int f = 3;
        private Handler h = new aJ(this, Looper.getMainLooper());

        public a(boolean z, FileDownloadListener fileDownloadListener) {
            this.b = null;
            this.g = false;
            this.g = z;
            this.b = fileDownloadListener;
        }

        @Override // com.iflytek.cloud.util.FileDownloadListener
        public void onCompleted(String str, SpeechError speechError) {
            C0021aj.a("DownloadonFinish", null);
            if (speechError != null) {
                C0020ai.a("onCompleted:errorcode:" + speechError.getErrorCode());
                this.h.sendMessage(this.h.obtainMessage(3, speechError));
                return;
            }
            C0020ai.a("onCompleted:filePath:" + str);
            if (!this.g) {
                if (!TextUtils.isEmpty(str)) {
                    aI.this.n.a("ivw_config_path", str);
                    aI.this.n.a("cfg_threshold", aI.this.n.b("cfg_threstemp", (String) null));
                }
                aI.this.a(false);
            }
            this.h.sendMessage(this.h.obtainMessage(2, str));
        }

        @Override // com.iflytek.cloud.util.FileDownloadListener
        public void onProgress(int i) {
            this.h.sendMessage(this.h.obtainMessage(1, i, 0, null));
        }

        @Override // com.iflytek.cloud.util.FileDownloadListener
        public void onStart() {
            C0021aj.a("DownloadonStart", null);
            C0020ai.a("onStart");
            this.h.sendMessage(this.h.obtainMessage(0, null));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    final class b implements WakeuperListener {
        private WakeuperListener b;
        private Handler c = new aK(this, Looper.getMainLooper());

        public b(WakeuperListener wakeuperListener) {
            this.b = null;
            this.b = wakeuperListener;
        }

        protected void a() {
            V.b(aI.this.a, Boolean.valueOf(aI.this.f), null);
        }

        @Override // com.iflytek.cloud.WakeuperListener
        public void onBeginOfSpeech() {
            C0020ai.a("onBeginOfSpeech");
            this.c.sendMessage(this.c.obtainMessage(2, 0, 0, null));
        }

        @Override // com.iflytek.cloud.WakeuperListener
        public void onError(SpeechError speechError) {
            C0020ai.b("error:" + speechError.getErrorCode());
            if (!aI.this.g()) {
                aI.this.a(true);
                return;
            }
            a();
            this.c.sendMessage(this.c.obtainMessage(0, speechError));
        }

        @Override // com.iflytek.cloud.WakeuperListener
        public void onEvent(int i, int i2, int i3, Bundle bundle) {
            Message messageObtain = Message.obtain();
            messageObtain.what = i;
            messageObtain.arg1 = i2;
            messageObtain.arg2 = i3;
            messageObtain.obj = bundle;
            this.c.sendMessage(this.c.obtainMessage(6, 0, 0, messageObtain));
        }

        @Override // com.iflytek.cloud.WakeuperListener
        public void onResult(WakeuperResult wakeuperResult) {
            if (!aI.this.b.a(SpeechConstant.KEEP_ALIVE, true)) {
                a();
            }
            this.c.sendMessage(this.c.obtainMessage(4, 1, 0, wakeuperResult));
        }

        @Override // com.iflytek.cloud.WakeuperListener
        public void onVolumeChanged(int i) {
            C0020ai.a("onVolumeChanged");
            this.c.sendMessage(this.c.obtainMessage(5, i, 0, null));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    class c implements RequestListener {
        private RequestListener b;
        private boolean f;
        private final int c = 0;
        private final int d = 1;
        private final int e = 2;
        private Handler g = new aL(this, Looper.getMainLooper());

        public c(boolean z, RequestListener requestListener) {
            this.b = null;
            this.f = false;
            this.f = z;
            this.b = requestListener;
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onBufferReceived(byte[] bArr) throws JSONException {
            C0020ai.a("onCompleted");
            try {
                int iA = aI.this.b.a(SpeechConstant.IVW_NET_MODE, 0);
                if (!this.f && (2 == iA || (4 == iA && Y.a(aI.this.a)))) {
                    JSONObject jSONObject = new JSONObject(new String(bArr, "utf-8"));
                    String string = jSONObject.getString("dlurl");
                    String string2 = jSONObject.getString("md5");
                    String strSubstring = string.substring(string.lastIndexOf(File.separator) + 1, string.lastIndexOf("."));
                    C0020ai.a("resName:" + strSubstring);
                    String strA = U.a(aI.this.a, strSubstring);
                    C0020ai.a("auto download path:" + strA);
                    aI.this.a(string, strA, string2, this.f, null);
                    aI.this.n.a("cfg_threstemp", jSONObject.getString("thresholder"));
                }
            } catch (Exception e) {
                onCompleted(new SpeechError(ErrorCode.ERROR_INVALID_DATA));
            }
            this.g.sendMessage(this.g.obtainMessage(1, bArr));
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onCompleted(SpeechError speechError) {
            C0021aj.a("RequestResult", null);
            this.g.sendMessage(this.g.obtainMessage(2, speechError));
        }

        @Override // com.iflytek.cloud.RequestListener
        public void onEvent(int i, Bundle bundle) {
            C0021aj.a("RequestResult", null);
            this.g.sendMessage(this.g.obtainMessage(0, i, 0, bundle));
        }
    }

    public aI(Context context) {
        super(context);
        this.f = false;
        this.g = null;
        this.h = null;
        this.i = null;
        this.j = null;
        this.k = false;
        this.m = null;
        this.n = null;
        this.n = O.a(this.a);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z) {
        C0020ai.a("restart wake ,isError:" + z);
        synchronized (this.c) {
            if (z) {
                this.i = null;
                this.n.a("ivw_config_path");
                this.n.a("cfg_threshold");
                b(((HandlerC0054r) this.d).j());
            } else if (this.d.s()) {
                this.i = ResourceUtil.generateResourcePath(this.a, ResourceUtil.RESOURCE_TYPE.path, this.n.b("ivw_config_path", (String) null));
                this.j = this.n.b("cfg_threshold", (String) null);
                b(((HandlerC0054r) this.d).j());
            }
        }
    }

    private int b(WakeuperListener wakeuperListener) {
        synchronized (this.c) {
            if (TextUtils.isEmpty(this.i)) {
                this.b.a("ivw_res_path", this.g);
                this.b.a("ivw_threshold", this.h);
                b(true);
            } else {
                this.b.a("ivw_res_path", this.i);
                this.b.a("ivw_threshold", this.j);
                b(false);
            }
            this.f = this.b.a(SpeechConstant.KEY_REQUEST_FOCUS, false);
            if (this.d != null && this.d.s()) {
                ((HandlerC0054r) this.d).b(false);
            }
            this.d = new HandlerC0054r(this.a, this.b, a("wakeuper"));
            V.a(this.a, Boolean.valueOf(this.f), null);
            ((HandlerC0054r) this.d).a(new b(wakeuperListener));
        }
        return 0;
    }

    private synchronized void b(boolean z) {
        this.k = z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized boolean g() {
        return this.k;
    }

    public int a(WakeuperListener wakeuperListener) {
        int iB;
        synchronized (this.c) {
            this.g = this.b.d("ivw_res_path");
            this.h = this.b.d("ivw_threshold");
            if (TextUtils.isEmpty(this.g)) {
                iB = ErrorCode.ERROR_IVW_INVALID_RESOURCE;
            } else {
                int iA = this.b.a(SpeechConstant.IVW_NET_MODE, 0);
                if (2 == iA || (4 == iA && Y.a(this.a))) {
                    a(this.g, false, (RequestListener) null);
                }
                iB = b(wakeuperListener);
            }
        }
        return iB;
    }

    public int a(String str, String str2, String str3, boolean z, FileDownloadListener fileDownloadListener) {
        int iA;
        synchronized (this.c) {
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
                iA = ErrorCode.ERROR_INVALID_PARAM;
            } else {
                C0021aj.a("CreateDownload", null);
                if (this.m != null) {
                    this.m.a();
                    this.m = null;
                }
                this.m = new C0055s(this.a);
                iA = this.m.a(str, str2, str3, new a(z, fileDownloadListener));
            }
        }
        return iA;
    }

    public int a(String str, boolean z, RequestListener requestListener) {
        int iA = ErrorCode.ERROR_IVW_INVALID_RESOURCE;
        synchronized (this.c) {
            if (!TextUtils.isEmpty(str)) {
                String strGenerateResourcePath = z ? null : ResourceUtil.generateResourcePath(this.a, ResourceUtil.RESOURCE_TYPE.path, this.n.b("ivw_config_path", (String) null));
                if (this.m != null) {
                    this.m.a();
                    this.m = null;
                }
                this.m = new C0055s(this.a);
                JSONObject jSONObjectA = this.m.a(str, strGenerateResourcePath);
                if (jSONObjectA == null) {
                    C0020ai.b("ivw invalid resource");
                } else {
                    String str2 = (String) jSONObjectA.remove(l);
                    if (TextUtils.isEmpty(str2) || str2.equals(str)) {
                        this.i = null;
                        this.n.a("ivw_config_path");
                        this.n.a("cfg_threshold");
                    } else {
                        this.i = str2;
                        this.j = this.n.b("cfg_threshold", (String) null);
                    }
                    C0021aj.a("SendRequest", null);
                    iA = this.m.a(jSONObjectA, new c(z, requestListener));
                }
            }
        }
        return iA;
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
            } else if (((HandlerC0054r) this.d).a() != -1) {
                i3 = ErrorCode.MSP_ERROR_INVALID_PARA;
            } else {
                ((HandlerC0054r) this.d).onRecordBuffer(bArr, i, i2);
                i3 = 0;
            }
        }
        return i3;
    }

    @Override // com.iflytek.thridparty.A
    public void cancel(boolean z) {
        synchronized (this.c) {
            if (this.m != null) {
                this.m.a();
                this.m = null;
            }
            V.b(this.a, Boolean.valueOf(this.f), null);
            super.cancel(z);
        }
    }

    @Override // com.iflytek.thridparty.A
    public boolean destroy() {
        boolean zDestroy;
        synchronized (this.c) {
            if (this.m != null) {
                this.m.a();
                this.m = null;
            }
            zDestroy = super.destroy();
        }
        return zDestroy;
    }

    public void e() {
        synchronized (this.c) {
            if (this.d != null) {
                ((HandlerC0054r) this.d).a(true);
            }
        }
    }

    public boolean f() {
        boolean zD;
        synchronized (this.c) {
            zD = d();
        }
        return zD;
    }
}
