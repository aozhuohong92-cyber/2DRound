package com.iflytek.cloud;

import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import com.iflytek.speech.SpeechComponent;
import com.iflytek.speech.UtilityConfig;
import com.iflytek.thridparty.AbstractC0062z;
import com.iflytek.thridparty.C;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.C0022ak;
import com.iflytek.thridparty.C0027ap;
import com.iflytek.thridparty.D;
import com.iflytek.thridparty.bq;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class SpeechUtility extends AbstractC0062z {
    public static final String TAG_RESOURCE_CONTENT = "tag_rescontent";
    public static final String TAG_RESOURCE_RESULT = "result";
    public static final String TAG_RESOURCE_RET = "ret";
    protected AbstractC0062z.a a;
    private Context f;
    private static SpeechUtility c = null;
    public static final AbstractC0062z.a DEF_ENGINE_MODE = AbstractC0062z.a.AUTO;
    private ArrayList<SpeechComponent> d = new ArrayList<>();
    private int e = -1;
    private boolean g = false;
    private a h = null;

    private class a extends BroadcastReceiver {
        private a() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            String dataString = intent.getDataString();
            String strConcat = String.valueOf("package:").concat(UtilityConfig.COMPONENT_PKG);
            if (("android.intent.action.PACKAGE_ADDED".equals(action) || "android.intent.action.PACKAGE_REMOVED".equals(action) || "android.intent.action.PACKAGE_REPLACED".equals(action)) && strConcat.equals(dataString) && SpeechUtility.getUtility() != null) {
                SpeechUtility.getUtility().checkServiceInstalled();
            }
        }
    }

    private SpeechUtility(Context context, String str) throws UnsupportedEncodingException {
        this.f = null;
        this.a = DEF_ENGINE_MODE;
        this.f = context.getApplicationContext();
        super.setParameter(SpeechConstant.PARAMS, str);
        MSC.loadLibrary(this.b.b(SpeechConstant.LIB_NAME, SpeechConstant.MODE_MSC));
        C0020ai.a();
        setParameter(SpeechConstant.PARAMS, str);
        if (!MSC.isIflyVersion()) {
            this.a = AbstractC0062z.a.MSC;
        }
        String parameter = getParameter(SpeechConstant.ENGINE_MODE);
        if (SpeechConstant.MODE_MSC.equals(parameter)) {
            this.a = AbstractC0062z.a.MSC;
        } else if (SpeechConstant.MODE_PLUS.equals(parameter)) {
            this.a = AbstractC0062z.a.PLUS;
        }
        b();
        d();
        e();
        C0022ak c0022akA = C0022ak.a(context);
        c0022akA.a();
        c0022akA.b();
        try {
            com.iflytek.common.a.a(context, SpeechConstant.APPID, this.b.e(SpeechConstant.APPID));
            com.iflytek.common.a.a(context);
            com.iflytek.common.a.a(false);
        } catch (Exception e) {
            C0020ai.a(e);
        }
        String parameter2 = getParameter("lxy_tp_dc");
        boolean z = TextUtils.isEmpty(parameter2) || !"false".equals(parameter2);
        C0020ai.a("DC init enable=" + parameter2);
        bq.a(context, getParameter(SpeechConstant.APPID), z);
    }

    private void a(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        PackageManager packageManager = this.f.getPackageManager();
        Intent intent = new Intent(str);
        intent.setPackage(UtilityConfig.COMPONENT_PKG);
        List<ResolveInfo> listQueryIntentServices = packageManager.queryIntentServices(intent, 224);
        if (listQueryIntentServices == null || listQueryIntentServices.size() <= 0) {
            return;
        }
        for (ResolveInfo resolveInfo : listQueryIntentServices) {
            SpeechComponent speechComponentB = b(resolveInfo.serviceInfo.packageName);
            if (speechComponentB != null) {
                try {
                    String[] strArrSplit = resolveInfo.serviceInfo.metaData.getString(UtilityConfig.METADATA_KEY_ENGINE_TYPE).split(",");
                    for (String str2 : strArrSplit) {
                        speechComponentB.addEngine(str2);
                    }
                } catch (Exception e) {
                    C0020ai.a(e);
                }
            }
        }
    }

    private static boolean a(Context context) {
        try {
            int iMyPid = Process.myPid();
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            if (activityManager != null) {
                for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : activityManager.getRunningAppProcesses()) {
                    if (runningAppProcessInfo.pid == iMyPid) {
                        C0020ai.a("process name:" + runningAppProcessInfo.processName);
                        if (context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).packageName.equals(runningAppProcessInfo.processName)) {
                            C0020ai.a("process name:" + runningAppProcessInfo.processName + "is own process");
                            return true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            C0020ai.a(e);
        }
        return false;
    }

    private int b() {
        if (!MSC.isLoaded()) {
            return 21002;
        }
        C0020ai.a("SpeechUtility start login");
        SpeechError speechErrorA = new D(this.f, this.b).a(this.b.e("usr"), this.b.e("pwd"));
        if (speechErrorA == null) {
            return 0;
        }
        return speechErrorA.getErrorCode();
    }

    private SpeechComponent b(String str) {
        boolean z;
        SpeechComponent speechComponent;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        Iterator<SpeechComponent> it2 = this.d.iterator();
        while (true) {
            if (!it2.hasNext()) {
                z = false;
                break;
            }
            if (str.equals(it2.next().getPackageName())) {
                z = true;
                break;
            }
        }
        if (z) {
            speechComponent = null;
        } else {
            speechComponent = new SpeechComponent(str);
            this.d.add(speechComponent);
        }
        return speechComponent;
    }

    private boolean c() {
        if (!MSC.isLoaded()) {
            return false;
        }
        if (MSC.isLoaded()) {
            return C.a();
        }
        return true;
    }

    private boolean c(String str) {
        PackageManager packageManager = this.f.getPackageManager();
        Intent intent = new Intent(str);
        intent.setPackage(UtilityConfig.COMPONENT_PKG);
        return packageManager.queryIntentActivities(intent, 1).size() > 0;
    }

    public static synchronized SpeechUtility createUtility(Context context, String str) {
        if (c == null) {
            C0027ap c0027ap = new C0027ap();
            c0027ap.b(str);
            if (c0027ap.a(SpeechConstant.FORCE_LOGIN, false) || a(context.getApplicationContext())) {
                c = new SpeechUtility(context, str);
            } else {
                C0020ai.b("init failed, please call this method in your main process!");
                c = null;
            }
        }
        return c;
    }

    private void d() {
        if (checkServiceInstalled()) {
            a(UtilityConfig.ACTION_SPEECH_RECOGNIZER);
            a(UtilityConfig.ACTION_SPEECH_SYNTHESIZER);
            a(UtilityConfig.ACTION_SPEECH_UNDERSTANDER);
            a(UtilityConfig.ACTION_TEXT_UNDERSTANDER);
            a(UtilityConfig.ACTION_SPEECH_WAKEUP);
        }
    }

    private void e() {
        this.h = new a();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter.addAction("android.intent.action.PACKAGE_REPLACED");
        intentFilter.addDataScheme("package");
        this.f.registerReceiver(this.h, intentFilter);
    }

    public static synchronized SpeechUtility getUtility() {
        return c;
    }

    protected boolean a() {
        try {
            return this.f.getPackageManager().getPackageInfo(UtilityConfig.COMPONENT_PKG, 0) != null;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public boolean checkServiceInstalled() {
        boolean z = false;
        int i = -1;
        try {
            PackageInfo packageInfo = this.f.getPackageManager().getPackageInfo(UtilityConfig.COMPONENT_PKG, 0);
            if (packageInfo != null) {
                z = true;
                i = packageInfo.versionCode;
            }
        } catch (PackageManager.NameNotFoundException e) {
        } catch (Throwable th) {
        }
        if (z != this.g || this.e != i) {
            this.g = z;
            this.e = i;
            if (SpeechRecognizer.getRecognizer() != null) {
                SpeechRecognizer.getRecognizer().a(this.f);
            }
            if (SpeechSynthesizer.getSynthesizer() != null) {
                SpeechSynthesizer.getSynthesizer().a(this.f);
            }
            if (SpeechUnderstander.getUnderstander() != null) {
                SpeechUnderstander.getUnderstander().a(this.f);
            }
            if (TextUnderstander.getTextUnderstander() != null) {
                TextUnderstander.getTextUnderstander().a(this.f);
            }
        }
        return z;
    }

    public boolean destroy() {
        boolean zC = c != null ? c() : true;
        if (this.h != null) {
            this.f.unregisterReceiver(this.h);
            this.h = null;
        }
        if (zC) {
            c = null;
            C0020ai.a(" SpeechUtility destory success,mInstance=null");
        }
        bq.a();
        return zC;
    }

    public String getComponentUrl() {
        StringBuffer stringBuffer = new StringBuffer(UtilityConfig.COMPONENT_URL);
        UtilityConfig.appendHttpParam(stringBuffer, "key", URLEncoder.encode(Base64.encodeToString(UtilityConfig.getComponentUrlParam(this.f).getBytes(), 0)));
        UtilityConfig.appendHttpParam(stringBuffer, "version", "1.0");
        return stringBuffer.toString();
    }

    public AbstractC0062z.a getEngineMode() {
        return this.a;
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public String getParameter(String str) throws UnsupportedEncodingException {
        String str2 = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (this.b.g(str)) {
            return super.getParameter(str);
        }
        if (str.equals("tts") || str.equals("asr") || str.equals(SpeechConstant.PLUS_LOCAL_ALL) || str.equals("ivw")) {
            try {
                return getPlusLocalInfo(str);
            } catch (Exception e) {
                return "{ret:20004}";
            }
        }
        if (!MSC.isLoaded()) {
            return null;
        }
        try {
            if (str.equals("ver_msc") || str.equals("ver_asr") || str.equals("ver_tts") || str.equals("ver_ivw")) {
                byte[] bytes = str.getBytes("utf-8");
                MSCSessionInfo mSCSessionInfo = new MSCSessionInfo();
                String str3 = new String(MSC.QMSPGetVersion(bytes, mSCSessionInfo), "utf-8");
                if (mSCSessionInfo.errorcode == 0) {
                    str2 = str3;
                }
            } else {
                byte[] bytes2 = str.getBytes("utf-8");
                MSCSessionInfo mSCSessionInfo2 = new MSCSessionInfo();
                if (MSC.QMSPGetParam(bytes2, mSCSessionInfo2) == 0) {
                    str2 = new String(mSCSessionInfo2.buffer, "utf-8");
                }
            }
            return str2;
        } catch (Exception e2) {
            C0020ai.a(e2);
            return str2;
        } catch (UnsatisfiedLinkError e3) {
            C0020ai.a(e3);
            return str2;
        }
    }

    public String getPlusLocalInfo(String str) throws JSONException {
        String string;
        JSONObject jSONObject = new JSONObject();
        if (!checkServiceInstalled()) {
            jSONObject.put(TAG_RESOURCE_RET, 21001);
            return jSONObject.toString();
        }
        if (getServiceVersion() < 97) {
            jSONObject.put(TAG_RESOURCE_RET, ErrorCode.ERROR_VERSION_LOWER);
            return jSONObject.toString();
        }
        if (10000 <= getServiceVersion() && getServiceVersion() <= 11000) {
            jSONObject.put(TAG_RESOURCE_RET, ErrorCode.ERROR_SYSTEM_PREINSTALL);
            return jSONObject.toString();
        }
        Cursor cursorQuery = this.f.getContentResolver().query(Uri.parse("content://com.iflytek.vflynote.providers.LocalResourceProvider"), null, str, null, null);
        int columnIndex = cursorQuery.getColumnIndex(TAG_RESOURCE_CONTENT);
        if (cursorQuery == null || !cursorQuery.moveToFirst()) {
            string = "";
        } else {
            string = cursorQuery.getString(columnIndex);
            Log.v("SpeechUtility", string);
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        if (TextUtils.isEmpty(string)) {
            jSONObject.put(TAG_RESOURCE_RET, ErrorCode.ERROR_INVALID_RESULT);
            return jSONObject.toString();
        }
        jSONObject.put(TAG_RESOURCE_RET, 0);
        jSONObject.put(TAG_RESOURCE_RESULT, new JSONObject(string));
        return jSONObject.toString();
    }

    public int getServiceVersion() throws PackageManager.NameNotFoundException {
        if (this.e < 0) {
            try {
                PackageInfo packageInfo = this.f.getPackageManager().getPackageInfo(UtilityConfig.COMPONENT_PKG, 0);
                if (packageInfo != null) {
                    this.e = packageInfo.versionCode;
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
        return this.e;
    }

    public int openEngineSettings(String str) {
        try {
            Intent intent = new Intent();
            intent.setPackage(UtilityConfig.COMPONENT_PKG);
            String str2 = UtilityConfig.COMPONENT_PKG;
            if ("tts".equals(str) && c(UtilityConfig.SETTINGS_ACTION_TTS)) {
                str2 = UtilityConfig.SETTINGS_ACTION_TTS;
            } else if ("asr".equals(str) && c(UtilityConfig.SETTINGS_ACTION_ASR)) {
                str2 = UtilityConfig.SETTINGS_ACTION_ASR;
            } else if (c(UtilityConfig.SETTINGS_ACTION_MAIN)) {
                str2 = UtilityConfig.SETTINGS_ACTION_MAIN;
            }
            intent.setAction(str2);
            intent.addFlags(268435456);
            this.f.startActivity(intent);
            return 0;
        } catch (Exception e) {
            C0020ai.a(e);
            return 21002;
        }
    }

    public String[] queryAvailableEngines() {
        this.d.clear();
        d();
        ArrayList arrayList = new ArrayList();
        Iterator<SpeechComponent> it2 = this.d.iterator();
        while (it2.hasNext()) {
            arrayList.addAll(it2.next().getEngines());
        }
        String[] strArr = new String[arrayList.size()];
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                return strArr;
            }
            strArr[i2] = (String) arrayList.get(i2);
            i = i2 + 1;
        }
    }

    @Override // com.iflytek.thridparty.AbstractC0062z
    public boolean setParameter(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return false;
        }
        super.setParameter(str, str2);
        if (!MSC.isLoaded() || SpeechConstant.PARAMS.equals(str)) {
            return true;
        }
        try {
            return MSC.QMSPSetParam(str.getBytes("utf-8"), str2.getBytes("utf-8")) == 0;
        } catch (Exception e) {
            C0020ai.a(e);
            return false;
        } catch (UnsatisfiedLinkError e2) {
            C0020ai.a(e2);
            return false;
        }
    }
}
