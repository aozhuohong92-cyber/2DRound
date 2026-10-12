package com.tencent.bugly.crashreport.biz;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.os.Parcel;
import com.android.vending.expansion.zipfile.APEZProvider;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import com.tencent.bugly.proguard.as;
import com.tencent.bugly.proguard.ax;
import com.tencent.bugly.proguard.n;
import com.tencent.bugly.proguard.o;
import com.tencent.bugly.proguard.s;
import com.tencent.bugly.proguard.t;
import com.tencent.bugly.proguard.v;
import com.tencent.bugly.proguard.w;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.cocos2dx.lib.GameControllerDelegate;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class a {
    private Context a;
    private long b;
    private int c;

    static /* synthetic */ void a(a aVar, UserInfoBean userInfoBean) {
        if (userInfoBean != null) {
            long jA = o.a().a("t_ui", a(userInfoBean), (n) null, true);
            if (jA >= 0) {
                w.c("insert %s success! %d", "t_ui", Long.valueOf(jA));
                userInfoBean.a = jA;
            }
        }
    }

    static /* synthetic */ int b(a aVar) {
        int i = aVar.c;
        aVar.c = i + 1;
        return i;
    }

    public a(Context context) {
        this.a = context;
    }

    public final void a(int i, boolean z, long j) {
        StrategyBean strategyBeanC = com.tencent.bugly.crashreport.common.strategy.a.a().c();
        if (strategyBeanC != null && !strategyBeanC.e && i != 1 && i != 3) {
            w.e("UserInfo is disable", new Object[0]);
            return;
        }
        if (i == 1) {
            this.c++;
        }
        Context context = this.a;
        int i2 = i != 1 ? 0 : 1;
        com.tencent.bugly.crashreport.common.info.a aVarA = com.tencent.bugly.crashreport.common.info.a.a(context);
        UserInfoBean userInfoBean = new UserInfoBean();
        userInfoBean.b = i;
        userInfoBean.c = aVarA.d;
        userInfoBean.d = aVarA.f();
        userInfoBean.e = System.currentTimeMillis();
        userInfoBean.f = -1L;
        userInfoBean.n = aVarA.i;
        userInfoBean.o = i2;
        userInfoBean.l = aVarA.n;
        userInfoBean.m = aVarA.o;
        userInfoBean.g = aVarA.p;
        userInfoBean.h = aVarA.q;
        userInfoBean.i = aVarA.r;
        userInfoBean.k = aVarA.s;
        userInfoBean.r = aVarA.y();
        userInfoBean.s = aVarA.C();
        userInfoBean.p = aVarA.D();
        userInfoBean.q = aVarA.E();
        v.a().a(new RunnableC0006a(userInfoBean, z), 0L);
    }

    public final void a() {
        this.b = com.tencent.bugly.proguard.a.c() + 86400000;
        v.a().a(new b(), (this.b - System.currentTimeMillis()) + 5000);
    }

    /* compiled from: BUGLY */
    /* renamed from: com.tencent.bugly.crashreport.biz.a$a, reason: collision with other inner class name */
    class RunnableC0006a implements Runnable {
        private boolean a;
        private UserInfoBean b;

        public RunnableC0006a(UserInfoBean userInfoBean, boolean z) {
            this.b = userInfoBean;
            this.a = z;
        }

        @Override // java.lang.Runnable
        public final void run() {
            com.tencent.bugly.crashreport.common.info.a aVarA;
            try {
                if (this.b != null) {
                    UserInfoBean userInfoBean = this.b;
                    if (userInfoBean != null && (aVarA = com.tencent.bugly.crashreport.common.info.a.a()) != null) {
                        userInfoBean.j = aVarA.d();
                    }
                    w.c("record userinfo", new Object[0]);
                    a.a(a.this, this.b);
                }
                if (this.a) {
                    a.this.b();
                }
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
            }
        }
    }

    public final synchronized void b() {
        final List<UserInfoBean> arrayList;
        boolean z;
        boolean z2;
        synchronized (this) {
            String str = com.tencent.bugly.crashreport.common.info.a.a(this.a).d;
            ArrayList arrayList2 = new ArrayList();
            List<UserInfoBean> listA = a(str);
            if (listA != null) {
                int size = listA.size() - 10;
                if (size > 0) {
                    for (int i = 0; i < listA.size() - 1; i++) {
                        for (int i2 = i + 1; i2 < listA.size(); i2++) {
                            if (listA.get(i).e > listA.get(i2).e) {
                                UserInfoBean userInfoBean = listA.get(i);
                                listA.set(i, listA.get(i2));
                                listA.set(i2, userInfoBean);
                            }
                        }
                    }
                    for (int i3 = 0; i3 < size; i3++) {
                        arrayList2.add(listA.get(i3));
                    }
                }
                Iterator<UserInfoBean> it2 = listA.iterator();
                int i4 = 0;
                while (it2.hasNext()) {
                    UserInfoBean next = it2.next();
                    if (next.f != -1) {
                        it2.remove();
                        if (next.e < com.tencent.bugly.proguard.a.c()) {
                            arrayList2.add(next);
                        }
                    }
                    i4 = (next.e <= System.currentTimeMillis() - 600000 || !(next.b == 1 || next.b == 4)) ? i4 : i4 + 1;
                }
                if (i4 > 15) {
                    w.d("[userinfo] userinfo too many times in 10 min: %d", Integer.valueOf(i4));
                    z2 = false;
                } else {
                    z2 = true;
                }
                arrayList = listA;
                z = z2;
            } else {
                arrayList = new ArrayList();
                z = true;
            }
            if (arrayList2.size() > 0) {
                a(arrayList2);
            }
            if (z && arrayList != null && arrayList.size() != 0) {
                w.c("[userinfo] do userinfo, size: %d", Integer.valueOf(arrayList.size()));
                ax axVarA = com.tencent.bugly.proguard.a.a(arrayList, this.c != 1 ? 2 : 1);
                if (axVarA == null) {
                    w.d("[biz] create uPkg fail!", new Object[0]);
                } else {
                    byte[] bArrA = com.tencent.bugly.proguard.a.a(axVarA);
                    if (bArrA == null) {
                        w.d("[biz] send encode fail!", new Object[0]);
                    } else {
                        as asVarA = com.tencent.bugly.proguard.a.a(this.a, 640, bArrA);
                        if (asVarA == null) {
                            w.d("request package is null.", new Object[0]);
                        } else {
                            t.a().a(GameControllerDelegate.THUMBSTICK_LEFT_Y, asVarA, (String) null, new s() { // from class: com.tencent.bugly.crashreport.biz.a.1
                                @Override // com.tencent.bugly.proguard.s
                                public final void a(boolean z3) {
                                    if (z3) {
                                        w.c("up success do final", new Object[0]);
                                        long jCurrentTimeMillis = System.currentTimeMillis();
                                        for (UserInfoBean userInfoBean2 : arrayList) {
                                            userInfoBean2.f = jCurrentTimeMillis;
                                            a.a(a.this, userInfoBean2);
                                        }
                                    }
                                }
                            }, false);
                        }
                    }
                }
            }
        }
    }

    /* compiled from: BUGLY */
    class b implements Runnable {
        b() {
        }

        @Override // java.lang.Runnable
        public final void run() {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (jCurrentTimeMillis < a.this.b) {
                v.a().a(a.this.new b(), (a.this.b - jCurrentTimeMillis) + 5000);
                return;
            }
            a.b(a.this);
            a.this.a(3, false, 0L);
            a.this.a();
        }
    }

    /* compiled from: BUGLY */
    class c implements Runnable {
        private long a;

        public c(long j) {
            this.a = 21600000L;
            this.a = j;
        }

        @Override // java.lang.Runnable
        public final void run() {
            a.this.b();
            a aVar = a.this;
            long j = this.a;
            v.a().a(aVar.new c(j), j);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0069 A[Catch: all -> 0x00eb, TRY_LEAVE, TryCatch #4 {all -> 0x00eb, blocks: (B:28:0x0063, B:30:0x0069), top: B:65:0x0063 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<com.tencent.bugly.crashreport.biz.UserInfoBean> a(java.lang.String r10) {
        /*
            Method dump skipped, instructions count: 242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.crashreport.biz.a.a(java.lang.String):java.util.List");
    }

    private static void a(List<UserInfoBean> list) {
        if (list != null && list.size() != 0) {
            StringBuilder sb = new StringBuilder();
            Iterator<UserInfoBean> it2 = list.iterator();
            while (it2.hasNext()) {
                sb.append(" or _id").append(" = ").append(it2.next().a);
            }
            String string = sb.toString();
            if (string.length() > 0) {
                string = string.substring(4);
            }
            sb.setLength(0);
            try {
                w.c("deleted %s data %d", "t_ui", Integer.valueOf(o.a().a("t_ui", string, (String[]) null, (n) null, true)));
            } catch (Throwable th) {
                if (!w.a(th)) {
                    th.printStackTrace();
                }
            }
        }
    }

    private static ContentValues a(UserInfoBean userInfoBean) {
        if (userInfoBean == null) {
            return null;
        }
        try {
            ContentValues contentValues = new ContentValues();
            if (userInfoBean.a > 0) {
                contentValues.put(APEZProvider.FILEID, Long.valueOf(userInfoBean.a));
            }
            contentValues.put("_tm", Long.valueOf(userInfoBean.e));
            contentValues.put("_ut", Long.valueOf(userInfoBean.f));
            contentValues.put("_tp", Integer.valueOf(userInfoBean.b));
            contentValues.put("_pc", userInfoBean.c);
            Parcel parcelObtain = Parcel.obtain();
            userInfoBean.writeToParcel(parcelObtain, 0);
            byte[] bArrMarshall = parcelObtain.marshall();
            parcelObtain.recycle();
            contentValues.put("_dt", bArrMarshall);
            return contentValues;
        } catch (Throwable th) {
            if (w.a(th)) {
                return null;
            }
            th.printStackTrace();
            return null;
        }
    }

    private static UserInfoBean a(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        try {
            byte[] blob = cursor.getBlob(cursor.getColumnIndex("_dt"));
            if (blob == null) {
                return null;
            }
            long j = cursor.getLong(cursor.getColumnIndex(APEZProvider.FILEID));
            UserInfoBean userInfoBean = (UserInfoBean) com.tencent.bugly.proguard.a.a(blob, UserInfoBean.CREATOR);
            if (userInfoBean != null) {
                userInfoBean.a = j;
                return userInfoBean;
            }
            return userInfoBean;
        } catch (Throwable th) {
            if (!w.a(th)) {
                th.printStackTrace();
            }
            return null;
        }
    }
}
