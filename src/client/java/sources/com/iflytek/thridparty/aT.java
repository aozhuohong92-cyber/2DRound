package com.iflytek.thridparty;

import android.content.Context;
import android.database.ContentObserver;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import com.iflytek.cloud.util.ContactManager;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aT extends ContactManager {
    private static a f;
    private HandlerThread g;
    private Handler i;
    private long j = 0;
    private static aT a = null;
    private static Context b = null;
    private static int c = 4;
    private static bb d = null;
    private static aS e = null;
    private static ContactManager.ContactListener h = null;

    private class a extends ContentObserver {
        public a(Handler handler) {
            super(handler);
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean z) {
            C0020ai.a("iFly_ContactManager", "ContactObserver_Contact| onChange");
            if (System.currentTimeMillis() - aT.this.j < 5000) {
                C0020ai.a("iFly_ContactManager", "onChange too much");
                return;
            }
            aT.this.j = System.currentTimeMillis();
            aT.this.d();
        }
    }

    private aT() {
        this.g = null;
        if (Build.VERSION.SDK_INT > c) {
            d = new ba(b);
        } else {
            d = new aZ(b);
        }
        e = new aS(b, d);
        this.g = new HandlerThread("ContactManager_worker");
        this.g.start();
        this.i = new Handler(this.g.getLooper());
        this.g.setPriority(1);
        f = new a(this.i);
    }

    public static aT a() {
        return a;
    }

    public static aT a(Context context, ContactManager.ContactListener contactListener) {
        h = contactListener;
        b = context;
        if (a == null) {
            a = new aT();
            b.getContentResolver().registerContentObserver(d.a(), true, f);
        }
        return a;
    }

    public static void c() {
        if (a != null) {
            a.b();
            a = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() {
        try {
            if (h != null && e != null) {
                String strA = aW.a(e.a(), '\n');
                String str = b.getFilesDir().getParent() + "/name.txt";
                String strA2 = aV.a(str);
                if (strA == null || strA2 == null || !strA.equals(strA2)) {
                    aV.a(str, strA, true);
                    h.onContactQueryFinish(strA, true);
                } else {
                    C0020ai.a("iFly_ContactManager", "contact name is not change.");
                    h.onContactQueryFinish(strA, false);
                }
            }
        } catch (Exception e2) {
            C0020ai.a(e2);
        }
    }

    @Override // com.iflytek.cloud.util.ContactManager
    public void asyncQueryAllContactsName() {
        this.i.post(new aU(this));
    }

    public void b() {
        if (f != null) {
            b.getContentResolver().unregisterContentObserver(f);
            if (this.g != null) {
                this.g.quit();
            }
        }
    }

    @Override // com.iflytek.cloud.util.ContactManager
    public String queryAllContactsName() throws Throwable {
        if (e == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (String str : e.a()) {
            sb.append(str + '\n');
        }
        return sb.toString();
    }
}
