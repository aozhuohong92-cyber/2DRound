package com.iflytek.thridparty;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import com.iflytek.common.LaunchService;
import java.util.Iterator;
import java.util.List;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class be {
    private static bf a = null;
    private static int b = -1;

    public static synchronized void a(Context context) {
        bm.a(context, "============start=============");
        bf bfVarA = bf.a(context);
        a = bfVarA;
        bfVarA.a();
        if (a.b()) {
            a.a(System.currentTimeMillis());
            bo.a.execute(new bh(context));
        }
        d(context);
    }

    private static void a(Context context, ResolveInfo resolveInfo) {
        try {
            String str = resolveInfo.serviceInfo.packageName;
            if (!a.a(str)) {
                bm.a("LaunchImpl", "startService not need:" + str);
            } else if (!context.getPackageName().equals(str)) {
                Intent intent = new Intent("com.iflytek.common.ACTION_LAUNCH");
                intent.setPackage(str);
                bm.a(context, "start app:" + context.startService(intent));
            }
        } catch (Exception e) {
            bm.b("LaunchImpl", "", e);
        }
    }

    public static synchronized void a(Context context, String str, String str2) {
        if (a == null) {
            a = bf.a(context);
        }
        a.a(str, str2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void c(Context context) {
        List<ResolveInfo> listQueryIntentServices;
        try {
            listQueryIntentServices = context.getPackageManager().queryIntentServices(new Intent("com.iflytek.common.ACTION_LAUNCH"), 224);
        } catch (Exception e) {
            bm.b("LaunchImpl", "", e);
            listQueryIntentServices = null;
        }
        if (listQueryIntentServices == null) {
            bm.b("LaunchImpl", "query action null");
            return;
        }
        Iterator<ResolveInfo> it2 = listQueryIntentServices.iterator();
        while (it2.hasNext()) {
            a(context, it2.next());
        }
    }

    private static void d(Context context) {
        if (b == 0) {
            return;
        }
        try {
            Intent intent = new Intent();
            intent.setClass(context, LaunchService.class);
            if (context.startService(intent) != null) {
                b = 1;
            }
        } catch (Exception e) {
            b = 0;
            bm.b("LaunchImpl", "start self Service error");
        }
    }
}
