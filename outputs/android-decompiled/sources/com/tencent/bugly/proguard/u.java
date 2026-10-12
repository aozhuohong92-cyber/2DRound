package com.tencent.bugly.proguard;

import android.content.Context;
import android.os.Process;
import android.support.v4.media.session.PlaybackStateCompat;
import com.iflytek.cloud.SpeechConstant;
import com.tencent.bugly.BuglyStrategy;
import com.tencent.bugly.crashreport.common.strategy.StrategyBean;
import java.util.HashMap;
import java.util.Map;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class u implements Runnable {
    private int a;
    private int b;
    private final Context c;
    private final int d;
    private final byte[] e;
    private final com.tencent.bugly.crashreport.common.info.a f;
    private final com.tencent.bugly.crashreport.common.strategy.a g;
    private final r h;
    private final t i;
    private final int j;
    private final s k;
    private final s l;
    private String m;
    private int n;
    private long o;
    private long p;
    private boolean q;
    private boolean r;

    public u(Context context, int i, as asVar, String str, s sVar, boolean z, boolean z2) {
        this(context, i, asVar.g, a.a(asVar), str, sVar, z, z2);
    }

    public u(Context context, int i, int i2, byte[] bArr, String str, s sVar, boolean z) {
        this(context, i, i2, bArr, str, sVar, z, 1, BuglyStrategy.a.MAX_USERDATA_VALUE_LENGTH, false);
    }

    private u(Context context, int i, int i2, byte[] bArr, String str, s sVar, boolean z, boolean z2) {
        this(context, i, i2, bArr, str, sVar, z, 1, BuglyStrategy.a.MAX_USERDATA_VALUE_LENGTH, z2);
    }

    private u(Context context, int i, int i2, byte[] bArr, String str, s sVar, boolean z, int i3, int i4, boolean z2) {
        this.a = 1;
        this.b = BuglyStrategy.a.MAX_USERDATA_VALUE_LENGTH;
        this.m = "";
        this.n = 0;
        this.o = 0L;
        this.p = 0L;
        this.q = true;
        this.r = false;
        this.c = context;
        this.f = com.tencent.bugly.crashreport.common.info.a.a(context);
        this.e = bArr;
        this.g = com.tencent.bugly.crashreport.common.strategy.a.a();
        this.h = r.a(context);
        this.i = t.a();
        this.j = i;
        this.m = str;
        this.k = sVar;
        t tVar = this.i;
        this.l = null;
        this.q = z;
        if (z) {
            switch (i2) {
                case 510:
                case 640:
                    i2 = 840;
                    break;
                case 630:
                    i2 = 830;
                    break;
            }
        }
        this.d = i2;
        this.a = 1;
        this.b = BuglyStrategy.a.MAX_USERDATA_VALUE_LENGTH;
        this.r = z2;
    }

    private void a(at atVar, boolean z, int i, String str, int i2) {
        String strValueOf;
        switch (this.d) {
            case 630:
            case 830:
                strValueOf = "crash";
                break;
            case 640:
            case 840:
                strValueOf = "userinfo";
                break;
            default:
                strValueOf = String.valueOf(this.d);
                break;
        }
        if (z) {
            w.a("[upload] success: %s", strValueOf);
        } else {
            w.e("[upload] fail! %s %d %s", strValueOf, Integer.valueOf(i), str);
            if (this.q) {
                this.i.a(i2, (at) null);
            }
        }
        if (this.o + this.p > 0) {
            this.i.a(this.i.a(this.r) + this.o + this.p, this.r);
        }
        if (this.k != null) {
            s sVar = this.k;
            int i3 = this.d;
            long j = this.o;
            long j2 = this.p;
            sVar.a(z);
        }
        if (this.l != null) {
            s sVar2 = this.l;
            int i4 = this.d;
            long j3 = this.o;
            long j4 = this.p;
            sVar2.a(z);
        }
    }

    private static boolean a(at atVar, com.tencent.bugly.crashreport.common.info.a aVar, com.tencent.bugly.crashreport.common.strategy.a aVar2) throws NumberFormatException {
        if (atVar == null) {
            w.d("resp == null!", new Object[0]);
            return false;
        }
        if (atVar.a != 0) {
            w.e("resp result error %d", Byte.valueOf(atVar.a));
            return false;
        }
        try {
            String str = atVar.d;
            if (!(str == null || str.trim().length() <= 0) && com.tencent.bugly.crashreport.common.info.a.a().h() != atVar.d) {
                o.a().a(com.tencent.bugly.crashreport.common.strategy.a.a, "key_ip", atVar.d.getBytes("UTF-8"), (n) null, true);
                aVar.d(atVar.d);
            }
            String str2 = atVar.g;
            if (!(str2 == null || str2.trim().length() <= 0) && com.tencent.bugly.crashreport.common.info.a.a().i() != atVar.g) {
                o.a().a(com.tencent.bugly.crashreport.common.strategy.a.a, "key_imei", atVar.g.getBytes("UTF-8"), (n) null, true);
                aVar.e(atVar.g);
            }
        } catch (Throwable th) {
        }
        aVar.h = atVar.e;
        if (atVar.b == 510) {
            if (atVar.c == null) {
                w.e("remote data is miss! %d", Integer.valueOf(atVar.b));
                return false;
            }
            av avVar = (av) a.a(atVar.c, av.class);
            if (avVar == null) {
                w.e("remote data is error! %d", Integer.valueOf(atVar.b));
                return false;
            }
            Object[] objArr = new Object[4];
            objArr[0] = Boolean.valueOf(avVar.a);
            objArr[1] = Boolean.valueOf(avVar.c);
            objArr[2] = Boolean.valueOf(avVar.b);
            objArr[3] = Integer.valueOf(avVar.g == null ? -1 : avVar.g.size());
            w.c("en:%b qu:%b uin:%b vm:%d", objArr);
            aVar2.a(avVar);
        }
        return true;
    }

    @Override // java.lang.Runnable
    public final void run() {
        byte[] bArrB;
        try {
            byte[] bArrA = this.e;
            this.n = 0;
            this.o = 0L;
            this.p = 0L;
            this.i.a(this.j, System.currentTimeMillis());
            if (this.k != null) {
                s sVar = this.k;
                int i = this.d;
            }
            if (this.l != null) {
                s sVar2 = this.l;
                int i2 = this.d;
            }
            if (com.tencent.bugly.crashreport.common.info.b.e(this.c) == null) {
                a(null, false, 0, "network is not availiable!", 0);
                return;
            }
            if (bArrA == null || bArrA.length == 0) {
                a(null, false, 0, "[upload] fail, request package is empty!", 0);
                return;
            }
            long jA = this.i.a(this.r);
            if (bArrA.length + jA >= 2097152) {
                w.e("up too much wait to next time ! %d %d ", Long.valueOf(jA), 2097152L);
                a(null, false, 0, "[upload] fail, over net consume: " + PlaybackStateCompat.ACTION_PLAY_FROM_SEARCH + "K", 0);
                return;
            }
            w.c("do upload task %d", Integer.valueOf(this.d));
            if (this.c == null || bArrA == null || this.f == null || this.g == null || this.h == null) {
                a(null, false, 0, "[upload] fail, illegal access error!", 0);
                return;
            }
            StrategyBean strategyBeanC = this.g.c();
            if (strategyBeanC == null) {
                a(null, false, 0, "[upload] fail, illegal local strategy!", 0);
                return;
            }
            int i3 = 0;
            HashMap map = new HashMap();
            map.put("prodId", this.f.e());
            map.put("bundleId", this.f.c);
            map.put("appVer", this.f.i);
            if (this.q) {
                map.put(SpeechConstant.ISV_CMD, Integer.toString(this.d));
                map.put("platformId", Byte.toString((byte) 1));
                this.f.getClass();
                map.put("sdkVer", "2.2.2");
                map.put("strategylastUpdateTime", Long.toString(strategyBeanC.m));
                if (!this.i.a(map)) {
                    a(null, false, 0, "[upload] fail, failed to add security info to HTTP headers", 0);
                    return;
                }
                byte[] bArrA2 = a.a(bArrA, 2);
                if (bArrA2 == null) {
                    a(null, false, 0, "[upload] fail, failed to zip request body", 0);
                    return;
                }
                bArrA = this.i.a(bArrA2);
                if (bArrA == null) {
                    a(null, false, 0, "[upload] fail, failed to encrypt request body", 0);
                    return;
                }
            }
            byte[] bArr = bArrA;
            int i4 = -1;
            int i5 = 0;
            while (i5 < this.a) {
                int i6 = i5 + 1;
                if (i5 != 0) {
                    w.d("failed to upload last time, wait and try(%d) again", Integer.valueOf(i6));
                    try {
                        Thread.sleep(this.b);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                w.c("send %d", Integer.valueOf(bArr.length));
                String str = this.m;
                if (str == null || str.trim().length() <= 0) {
                    if (this.q) {
                        if (this.d == 830) {
                            this.m = strategyBeanC.p;
                        } else {
                            this.m = strategyBeanC.o;
                        }
                    } else {
                        this.m = strategyBeanC.q;
                    }
                }
                w.c("do upload to %s with cmd %d (pid=%d | tid=%d)", this.m, Integer.valueOf(this.d), Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
                byte[] bArrA3 = this.h.a(this.m, bArr, this, map);
                if (bArrA3 == null) {
                    w.e("try upload fail! %d %s", Integer.valueOf(this.d), "upload fail, no response!");
                    i3 = 1;
                    i5 = i6;
                } else {
                    Map<String, String> map2 = this.h.a;
                    if (this.q) {
                        if (map2 == null || map2.size() == 0 || !map2.containsKey("status")) {
                            w.c("no headers from server, just try again (pid=%d | tid=%d)", Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
                            w.e("try upload fail! %d %s", Integer.valueOf(this.d), "upload fail, no status header");
                            i3 = 1;
                            i5 = i6;
                        } else {
                            try {
                                i4 = Integer.parseInt(map2.get("status"));
                                w.c("status from server is %d (pid=%d | tid=%d)", Integer.valueOf(i4), Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
                                if (i4 != 0) {
                                    if (i4 == 2) {
                                        if (this.o + this.p > 0) {
                                            this.i.a(this.i.a(this.r) + this.o + this.p, this.r);
                                        }
                                        this.i.a(i4, (at) null);
                                        w.a("Session ID is invalid, will try again immediately (pid=%d | tid=%d)", Integer.valueOf(Process.myPid()), Integer.valueOf(Process.myTid()));
                                        this.i.a(this.j, this.d, this.e, (String) null, this.l);
                                        return;
                                    }
                                    a(null, false, 1, "upload fail, status: " + Integer.toString(i4), i4);
                                    return;
                                }
                            } catch (Throwable th) {
                                w.e("try upload fail! %d %s", Integer.valueOf(this.d), "upload fail, format of status header is invalid: " + Integer.toString(i4));
                                i3 = 1;
                                i5 = i6;
                            }
                        }
                    }
                    w.c("recv %d", Integer.valueOf(bArrA3.length));
                    if (!this.q) {
                        bArrB = bArrA3;
                    } else {
                        if (bArrA3.length == 0) {
                            for (Map.Entry<String, String> entry : map2.entrySet()) {
                                w.c("[HTTP headers from server] key = %s, value = %s", entry.getKey(), entry.getValue());
                            }
                            a(null, false, 1, "upload fail, response data from server is empty", 0);
                            return;
                        }
                        byte[] bArrB2 = this.i.b(bArrA3);
                        if (bArrB2 == null) {
                            a(null, false, 1, "upload fail, failed to decrypt response from server", 0);
                            return;
                        }
                        bArrB = a.b(bArrB2, 2);
                        if (bArrB == null) {
                            a(null, false, 1, "upload fail, failed to unzip(gzip) response from server", 0);
                            return;
                        }
                    }
                    at atVarA = a.a(bArrB, this.q);
                    if (atVarA == null) {
                        a(null, false, 1, "upload fail, resp null!", 0);
                        return;
                    }
                    if (this.q) {
                        this.i.a(i4, atVarA);
                    }
                    Object[] objArr = new Object[2];
                    objArr[0] = Integer.valueOf(atVarA.b);
                    objArr[1] = Integer.valueOf(atVarA.c == null ? 0 : atVarA.c.length);
                    w.c("response %d %d", objArr);
                    if (!a(atVarA, this.f, this.g)) {
                        a(atVarA, false, 2, atVarA.f, 0);
                        return;
                    } else {
                        a(atVarA, true, 2, null, 0);
                        return;
                    }
                }
            }
            a(null, false, i3, "try OT Fail!", 0);
        } catch (Throwable th2) {
            if (!w.a(th2)) {
                th2.printStackTrace();
            }
        }
    }

    public final void a(long j) {
        this.n++;
        this.o += j;
    }

    public final void b(long j) {
        this.p += j;
    }
}
