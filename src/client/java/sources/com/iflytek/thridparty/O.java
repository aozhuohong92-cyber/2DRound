package com.iflytek.thridparty;

import android.content.Context;
import android.content.SharedPreferences;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationManager;
import com.iflytek.cloud.Setting;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class O {
    public static O a = null;
    private SharedPreferences b;
    private Context c;
    private boolean d;
    private long e = 0;

    private O(Context context) {
        this.b = null;
        this.c = null;
        this.d = true;
        this.c = context;
        this.b = context.getSharedPreferences("com.iflytek.msc", 0);
        this.d = b(context);
    }

    public static O a(Context context) {
        if (a == null && context != null) {
            c(context);
        }
        return a;
    }

    public static boolean b(Context context) {
        try {
            if (!Setting.getLocationEnable() || context == null) {
                return false;
            }
            String[] strArr = context.getPackageManager().getPackageInfo(context.getPackageName(), 4096).requestedPermissions;
            for (int i = 0; i < strArr.length; i++) {
                if ("android.permission.ACCESS_FINE_LOCATION".equalsIgnoreCase(strArr[i]) || "android.permission.ACCESS_COARSE_LOCATION".equalsIgnoreCase(strArr[i])) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    private static synchronized O c(Context context) {
        if (a == null) {
            a = new O(context);
        }
        U.a(context);
        N.a(context);
        return a;
    }

    public void a(Location location) {
        if (location == null) {
            return;
        }
        SharedPreferences.Editor editorEdit = this.b.edit();
        editorEdit.putFloat("msc.lat", (float) location.getLatitude());
        editorEdit.putFloat("msc.lng", (float) location.getLongitude());
        editorEdit.commit();
    }

    public void a(String str) {
        try {
            this.b.edit().remove(str).commit();
        } catch (Exception e) {
            C0020ai.b("remove data from preference has exception:" + e.getMessage());
        }
    }

    public void a(String str, int i) {
        SharedPreferences.Editor editorEdit = this.b.edit();
        editorEdit.putInt(str, i);
        editorEdit.commit();
    }

    public void a(String str, long j) {
        SharedPreferences.Editor editorEdit = this.b.edit();
        editorEdit.putLong(str, j);
        editorEdit.commit();
    }

    public void a(String str, String str2) {
        SharedPreferences.Editor editorEdit = this.b.edit();
        editorEdit.putString(str, str2);
        editorEdit.commit();
    }

    public synchronized float b(String str) {
        try {
            if (this.d && System.currentTimeMillis() - this.e > 216000) {
                LocationManager locationManager = (LocationManager) this.c.getApplicationContext().getSystemService("location");
                this.e = System.currentTimeMillis();
                a("loction_last_update", this.e);
                C0020ai.c("getLocation begin:" + System.currentTimeMillis());
                Criteria criteria = new Criteria();
                criteria.setAccuracy(1);
                C0020ai.c("bestProvider:" + locationManager.getBestProvider(criteria, true));
                Location lastKnownLocation = locationManager.getLastKnownLocation("gps");
                if (lastKnownLocation != null) {
                    C0020ai.a(lastKnownLocation.toString());
                    a(lastKnownLocation);
                } else {
                    Location lastKnownLocation2 = locationManager.getLastKnownLocation("network");
                    if (lastKnownLocation2 != null) {
                        C0020ai.a(lastKnownLocation2.toString());
                        a(lastKnownLocation2);
                    }
                }
                C0020ai.c("getLocation end:" + System.currentTimeMillis());
            }
        } catch (Exception e) {
        }
        return this.b.getFloat(str, -0.1f);
    }

    public int b(String str, int i) {
        return this.b.getInt(str, i);
    }

    public String b(String str, String str2) {
        return this.b.getString(str, str2);
    }
}
