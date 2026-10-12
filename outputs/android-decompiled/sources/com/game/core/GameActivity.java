package com.game.core;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.telephony.PhoneStateListener;
import android.telephony.SignalStrength;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.tencent.bugly.crashreport.CrashReport;
import org.cocos2dx.lib.Cocos2dxActivity;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class GameActivity extends Cocos2dxActivity {
    private static int m_battery_level;
    private static int m_signal_strength;
    private MyPhoneStateListener m_myListener;
    private TelephonyManager m_tel_mgr;
    private WifiManager m_wifiManager;

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) throws PackageManager.NameNotFoundException {
        Log.d(TAG, "===================onCreate()=======start====");
        CrashReport.initCrashReport(getApplicationContext(), "f042fa53ac", false);
        GameHelper.init(this);
        super.onCreate(savedInstanceState);
        AudioRecorder.getInstance().setCurrentActivity(this);
        registerReceiver(new BatteryBroadcastReceiver(), new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        this.m_myListener = new MyPhoneStateListener();
        this.m_tel_mgr = (TelephonyManager) getSystemService("phone");
        this.m_wifiManager = (WifiManager) getApplicationContext().getSystemService("wifi");
        Log.d(TAG, "===================onCreate()=======end====");
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity
    protected void onLoadNativeLibraries() throws PackageManager.NameNotFoundException {
        super.onLoadNativeLibraries();
    }

    public Bundle getBundle() {
        try {
            return getPackageManager().getApplicationInfo(getPackageName(), 128).metaData;
        } catch (Exception e) {
            return null;
        }
    }

    public static int getSignalStrength() {
        return m_signal_strength;
    }

    public WifiManager getWifiManager() {
        return this.m_wifiManager;
    }

    public static int getBatteryLevel() {
        return m_battery_level;
    }

    private class MyPhoneStateListener extends PhoneStateListener {
        private MyPhoneStateListener() {
        }

        @Override // android.telephony.PhoneStateListener
        public void onSignalStrengthsChanged(SignalStrength signalStrength) {
            super.onSignalStrengthsChanged(signalStrength);
            int unused = GameActivity.m_signal_strength = signalStrength.getGsmSignalStrength();
        }
    }

    class BatteryBroadcastReceiver extends BroadcastReceiver {
        BatteryBroadcastReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED")) {
                int unused = GameActivity.m_battery_level = intent.getIntExtra("level", 0);
                intent.getIntExtra("scale", 100);
            }
        }
    }

    public String getApplicationName() {
        try {
            PackageManager packageManager = getApplicationContext().getPackageManager();
            return (String) packageManager.getApplicationLabel(packageManager.getApplicationInfo(getPackageName(), 0));
        } catch (Exception e) {
            return "";
        }
    }

    public void sdkInit() {
    }

    public void login() {
    }

    public void switchAccount() {
    }

    public boolean isSwitchAccount() {
        return false;
    }

    public boolean isShowAccountCenter() {
        return false;
    }

    public String getChannel() {
        return "";
    }

    public void showAccountCenter() {
    }

    public void submitExtraData(String info) {
    }

    public void pay(String info) {
    }

    public void exit() {
    }

    public void sdkexit() {
    }

    public void trackingIOEvent(String eventName, String info) {
    }

    public void bindPhone(String number, String code) {
    }

    public String getBindPhone() {
        return "";
    }

    public String callFunc(String funname, String arg1, int arg2, float arg3, String arg4) {
        return "";
    }
}
