package com.game.core;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.format.Formatter;
import android.util.Log;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class GameHelper {
    private static GameHelper install = null;
    private static Activity sActivity = null;
    private static String TAG = "cocos2dx";

    private static native void nativeCallLuaFunc(String str, int i, String str2);

    public static GameHelper getInstance() {
        if (install == null) {
            install = new GameHelper();
        }
        return install;
    }

    public static void init(Activity act) {
        sActivity = act;
    }

    public static void callLuaFunction(String f, int s, String m) {
        nativeCallLuaFunc(f, s, m);
    }

    public static int sdkCallFunc(String funname, String arg1, int arg2, float arg3, String arg4) {
        Log.d(TAG, "== sdkCallFunc ==" + funname + ",arg1:" + arg1 + ",arg2:" + String.valueOf(arg2) + ",arg3:" + String.valueOf(arg3) + ",arg4:" + arg4);
        try {
            if (funname.equals("login")) {
                ((GameActivity) sActivity).login();
            } else if (funname.equals("sdkInit")) {
                ((GameActivity) sActivity).sdkInit();
            } else if (funname.equals("switchAccount")) {
                ((GameActivity) sActivity).switchAccount();
            } else {
                if (funname.equals("isSwitchAccount")) {
                    return ((GameActivity) sActivity).isSwitchAccount() ? 1 : 0;
                }
                if (funname.equals("isShowAccountCenter")) {
                    return !((GameActivity) sActivity).isShowAccountCenter() ? 0 : 1;
                }
                if (funname.equals("showAccountCenter")) {
                    ((GameActivity) sActivity).showAccountCenter();
                } else if (funname.equals("exit")) {
                    ((GameActivity) sActivity).exit();
                } else if (funname.equals("sdkexit")) {
                    ((GameActivity) sActivity).sdkexit();
                } else if (funname.equals("submitExtraData")) {
                    ((GameActivity) sActivity).submitExtraData(arg1);
                } else if (funname.equals("pay")) {
                    ((GameActivity) sActivity).pay(arg1);
                } else if (funname.equals("TrackingIO_event")) {
                    ((GameActivity) sActivity).trackingIOEvent(arg1, arg4);
                } else {
                    if (funname.equals("freeSpace")) {
                        ApiForCocos2d.getInstance();
                        return (int) ApiForCocos2d.freeSpace();
                    }
                    if (funname.equals("totalSpace")) {
                        ApiForCocos2d.getInstance();
                        return (int) ApiForCocos2d.totalSpace();
                    }
                    if (funname.equals("wifiState")) {
                        return ((GameActivity) sActivity).getWifiManager().getWifiState();
                    }
                    if (funname.equals("signalStrength")) {
                        return GameActivity.getSignalStrength();
                    }
                    if (funname.equals("batteryLevel")) {
                        return GameActivity.getBatteryLevel();
                    }
                    if (funname.equals("speechInit")) {
                        Speech.getInstance().init(sActivity);
                    } else if (funname.equals("speechRecognize")) {
                        Speech.getInstance().speechRecognizeFile(arg4, arg1);
                    } else {
                        if (funname.equals("audioInit")) {
                            return !AudioRecorder.getInstance().init(arg2, arg1) ? 0 : 1;
                        }
                        if (funname.equals("audioStart")) {
                            return !AudioRecorder.getInstance().start() ? 0 : 1;
                        }
                        if (funname.equals("audioStop")) {
                            AudioRecorder.getInstance().stop();
                        } else if (funname.equals("audioSetVolume")) {
                            AudioRecorder.getInstance().setVolume(arg2);
                        } else {
                            if (funname.equals("audioGetVolume")) {
                                return AudioRecorder.getInstance().getVolume();
                            }
                            if (funname.equals("audioIsRecording")) {
                                return !AudioRecorder.getInstance().isRecording() ? 0 : 1;
                            }
                            if (arg2 == 1 && funname.equals("webcam")) {
                                WebcamActivity.startService(sActivity, "TakePhoto", arg1, arg4, "png");
                            } else if (arg2 == 2 && funname.equals("webcam")) {
                                WebcamActivity.startService(sActivity, "OpenPhotoGallery", arg1, arg4, "png");
                            } else if (arg2 == 3 && funname.equals("webcam")) {
                                WebcamActivity.startService(sActivity, "TakePhoto", arg1, arg4, "jpg");
                            } else if (arg2 == 4 && funname.equals("webcam")) {
                                WebcamActivity.startService(sActivity, "OpenPhotoGallery", arg1, arg4, "jpg");
                            } else if (funname.equals("openUrl")) {
                                Intent i = new Intent("android.intent.action.VIEW");
                                i.setData(Uri.parse(arg1));
                                sActivity.startActivity(i);
                            } else {
                                Log.i(TAG, "sdkCallFunc_todo==" + funname);
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            Log.i(TAG, "Exception===" + funname);
        }
        return -1;
    }

    public static String callFunc(String funname, String arg1, int arg2, float arg3, String arg4) {
        String idfa;
        Log.d("gamecore", "== callFunc ==" + funname + ",arg1:" + arg1 + ",arg2:" + String.valueOf(arg2) + ",arg3:" + String.valueOf(arg3) + ",arg4:" + arg4);
        try {
            if (funname.equals("idfa")) {
                TelephonyManager tm = (TelephonyManager) sActivity.getSystemService("phone");
                idfa = tm.getDeviceId();
                if (idfa == null || idfa.equals("")) {
                    idfa = Settings.Secure.getString(sActivity.getContentResolver(), "android_id");
                }
            } else if (funname.equals("getuiId")) {
                idfa = "";
            } else if (funname.equals("getDeviceName")) {
                idfa = Build.BRAND + "_" + Build.DEVICE + "(" + Build.MODEL + ")";
            } else if (funname.equals("ip")) {
                idfa = Formatter.formatIpAddress(((GameActivity) sActivity).getWifiManager().getConnectionInfo().getIpAddress());
            } else if (funname.equals("app_name")) {
                idfa = ((GameActivity) sActivity).getApplicationName();
            } else if (funname.equals("package_name")) {
                idfa = sActivity.getPackageName();
            } else if (funname.equals("package_version")) {
                idfa = sActivity.getPackageManager().getPackageInfo(sActivity.getPackageName(), 0).versionName;
            } else if (funname.equals("system_version")) {
                idfa = "android_" + Build.VERSION.RELEASE;
            } else if (funname.equals("carrier_name")) {
                TelephonyManager tm2 = (TelephonyManager) sActivity.getSystemService("phone");
                String imsi = tm2.getSubscriberId();
                if (imsi == null || imsi.equals("")) {
                    idfa = "无卡";
                } else if (imsi.startsWith("46000") || imsi.startsWith("46002")) {
                    idfa = "中国移动";
                } else if (imsi.startsWith("46001")) {
                    idfa = "中国联通";
                } else if (imsi.startsWith("46003")) {
                    idfa = "中国电信";
                } else {
                    idfa = "其它";
                }
            } else if (funname.equals("channel")) {
                idfa = ((GameActivity) sActivity).getChannel();
            } else if (funname.equals("bindPhone")) {
                ((GameActivity) sActivity).bindPhone(arg1, arg4);
                idfa = "";
            } else if (funname.equals("getBindPhone")) {
                idfa = ((GameActivity) sActivity).getBindPhone();
            } else {
                idfa = ((GameActivity) sActivity).callFunc(funname, arg1, arg2, arg3, arg4);
            }
            return idfa;
        } catch (Exception e) {
            Log.i(TAG, "Exception===" + funname);
            return "error";
        }
    }

    public static void speechRecognize(String key, byte[] data, int len) {
        Log.v(TAG, key + "==" + data.length + "===" + len);
        Speech.getInstance().speechRecognize(key, data);
    }
}
