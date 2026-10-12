package com.iflytek.common;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import android.os.Process;
import com.iflytek.thridparty.be;
import com.iflytek.thridparty.bf;
import com.iflytek.thridparty.bm;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class LaunchService extends Service {
    private bf a;
    private long b = 0;
    private BroadcastReceiver c = new b(this);

    private void a() {
        try {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction(getPackageName() + "_LAUNCH_ALARM_LAUNCH");
            registerReceiver(this.c, intentFilter);
        } catch (Exception e) {
            bm.b("LaunchService", "", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0087 -> B:23:0x002d). Please report as a decompilation issue!!! */
    public synchronized void b() {
        long jC = this.a.c();
        long jCurrentTimeMillis = jC + System.currentTimeMillis();
        long j = jCurrentTimeMillis - this.b;
        if (j <= 0 || j >= jC) {
            try {
                AlarmManager alarmManager = (AlarmManager) getSystemService("alarm");
                PendingIntent broadcast = PendingIntent.getBroadcast(getApplicationContext(), 0, new Intent(getPackageName() + "_LAUNCH_ALARM_LAUNCH"), 134217728);
                if (jC > 0) {
                    this.b = jCurrentTimeMillis;
                    alarmManager.cancel(broadcast);
                    alarmManager.set(0, this.b, broadcast);
                    bm.a(this, "reg next alarm: " + bm.a(this.b));
                } else {
                    bm.a(this, "not reg alarm,periodrun = 0.");
                }
            } catch (Exception e) {
                bm.b("LaunchService", "", e);
            }
        } else {
            bm.a(this, "reg next alarm too short:" + j);
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        bm.a(this, "LaunchService onCreate pid=" + Process.myTid());
        this.a = bf.a(getApplicationContext());
        a();
        be.a(this);
        b();
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        bm.a(this, "LaunchService onDestroy");
        try {
            unregisterReceiver(this.c);
        } catch (Exception e) {
            bm.b("LaunchService", "", e);
        }
    }

    @Override // android.app.Service
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        bm.a(this, "LaunchService onStart lastalarm=" + this.b + " periodrun=" + this.a.c());
        if (this.b != 0 || this.a.c() <= 0) {
            return;
        }
        b();
    }
}
