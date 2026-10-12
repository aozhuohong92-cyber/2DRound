package com.iflytek.thridparty;

import android.content.Context;
import com.iflytek.cloud.util.FileDownloadListener;
import java.util.HashMap;
import java.util.Map;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class S {
    private static S b;
    private Context g;
    private O h;
    private C0017af f = null;
    private final String i = "download_uri";
    private final String j = "file_path";
    private final String k = "file_md5";
    protected Object a = new Object();
    private InterfaceC0018ag l = new T(this);
    private HashMap<Long, C0027ap> c = new HashMap<>();
    private HashMap<Long, String> e = new HashMap<>();
    private HashMap<Long, FileDownloadListener> d = new HashMap<>();

    private S(Context context) {
        this.h = null;
        this.g = context;
        this.h = O.a(this.g);
    }

    private long a(String str, String str2, String str3) {
        synchronized (this.a) {
            for (Map.Entry<Long, C0027ap> entry : this.c.entrySet()) {
                long jLongValue = entry.getKey().longValue();
                C0027ap value = entry.getValue();
                if (value.e("download_uri").equals(str) && value.e("file_path").equals(str2) && value.e("file_md5").equals(str3)) {
                    return jLongValue;
                }
            }
            return 0L;
        }
    }

    public static S a(Context context) {
        if (b == null) {
            b = new S(context);
        }
        return b;
    }

    public int a(String str, String str2, String str3, FileDownloadListener fileDownloadListener) {
        long jA = a(str, str2, str3);
        if (this.c.size() > 0 && jA != 0) {
            this.d.put(Long.valueOf(jA), fileDownloadListener);
            return -1;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (fileDownloadListener != null) {
            this.d.put(Long.valueOf(jCurrentTimeMillis), fileDownloadListener);
        }
        C0027ap c0027ap = new C0027ap();
        c0027ap.a("download_uri", str);
        c0027ap.a("file_path", str2);
        c0027ap.a("file_md5", str3);
        this.c.put(Long.valueOf(jCurrentTimeMillis), c0027ap);
        String strB = this.h.b(str, (String) null);
        C0020ai.a("tempFile:" + strB);
        this.f = new C0017af(jCurrentTimeMillis, 0, this.g);
        this.f.a(this.l);
        this.f.a(str, strB, str2, true, null);
        return 0;
    }
}
