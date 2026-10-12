package org.cocos2dx.lib;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import com.android.vending.expansion.zipfile.APKExpansionSupport;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.enhance.gameservice.IGameTuningService;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Cocos2dxHelper {
    private static final int BOOST_TIME = 7;
    private static final String PREFS_NAME = "Cocos2dxPrefsFile";
    private static final int RUNNABLES_PER_FRAME = 5;
    private static boolean sAccelerometerEnabled;
    private static boolean sActivityVisible;
    private static AssetManager sAssetManager;
    private static Cocos2dxMusic sCocos2dMusic;
    private static Cocos2dxSound sCocos2dSound;
    private static Cocos2dxAccelerometer sCocos2dxAccelerometer;
    private static Cocos2dxHelperListener sCocos2dxHelperListener;
    private static boolean sCompassEnabled;
    private static String sFileDirectory;
    private static String sPackageName;
    private static final String TAG = Cocos2dxHelper.class.getSimpleName();
    private static Activity sActivity = null;
    private static Set<PreferenceManager.OnActivityResultListener> onActivityResultListeners = new LinkedHashSet();
    private static Vibrator sVibrateService = null;
    private static IGameTuningService mGameServiceBinder = null;
    private static String sAssetsPath = "";
    private static ZipResourceFile sOBBFile = null;
    private static boolean sInited = false;
    private static ServiceConnection connection = new ServiceConnection() { // from class: org.cocos2dx.lib.Cocos2dxHelper.1
        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            IGameTuningService unused = Cocos2dxHelper.mGameServiceBinder = IGameTuningService.Stub.asInterface(service);
            Cocos2dxHelper.fastLoading(7);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            Cocos2dxHelper.sActivity.getApplicationContext().unbindService(Cocos2dxHelper.connection);
        }
    };

    public interface Cocos2dxHelperListener {
        void runOnGLThread(Runnable runnable);

        void showDialog(String str, String str2);
    }

    private static native void nativeSetApkPath(String str);

    private static native void nativeSetAudioDeviceInfo(boolean z, int i, int i2);

    private static native void nativeSetContext(Context context, AssetManager assetManager);

    /* JADX INFO: Access modifiers changed from: private */
    public static native void nativeSetEditTextDialogResult(byte[] bArr);

    public static void runOnGLThread(Runnable r) {
        ((Cocos2dxActivity) sActivity).runOnGLThread(r);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void init(Activity activity) {
        sActivity = activity;
        sCocos2dxHelperListener = (Cocos2dxHelperListener) activity;
        if (!sInited) {
            PackageManager pm = activity.getPackageManager();
            boolean isSupportLowLatency = pm.hasSystemFeature("android.hardware.audio.low_latency");
            Log.d(TAG, "isSupportLowLatency:" + isSupportLowLatency);
            int sampleRate = 44100;
            int bufferSizeInFrames = 192;
            if (Build.VERSION.SDK_INT >= 17) {
                AudioManager am = (AudioManager) activity.getSystemService("audio");
                Object[] parameters = {Cocos2dxReflectionHelper.getConstantValue(AudioManager.class, "PROPERTY_OUTPUT_SAMPLE_RATE")};
                String strSampleRate = (String) Cocos2dxReflectionHelper.invokeInstanceMethod(am, "getProperty", new Class[]{String.class}, parameters);
                Object[] parameters2 = {Cocos2dxReflectionHelper.getConstantValue(AudioManager.class, "PROPERTY_OUTPUT_FRAMES_PER_BUFFER")};
                String strBufferSizeInFrames = (String) Cocos2dxReflectionHelper.invokeInstanceMethod(am, "getProperty", new Class[]{String.class}, parameters2);
                sampleRate = Integer.parseInt(strSampleRate);
                bufferSizeInFrames = Integer.parseInt(strBufferSizeInFrames);
                Log.d(TAG, "sampleRate: " + sampleRate + ", framesPerBuffer: " + bufferSizeInFrames);
            } else {
                Log.d(TAG, "android version is lower than 17");
            }
            nativeSetAudioDeviceInfo(isSupportLowLatency, sampleRate, bufferSizeInFrames);
            ApplicationInfo applicationInfo = activity.getApplicationInfo();
            sPackageName = applicationInfo.packageName;
            sFileDirectory = activity.getFilesDir().getAbsolutePath();
            nativeSetApkPath(getAssetsPath());
            sCocos2dxAccelerometer = new Cocos2dxAccelerometer(activity);
            sCocos2dMusic = new Cocos2dxMusic(activity);
            sCocos2dSound = new Cocos2dxSound(activity);
            sAssetManager = activity.getAssets();
            nativeSetContext(activity, sAssetManager);
            Cocos2dxBitmap.setContext(activity);
            sVibrateService = (Vibrator) activity.getSystemService("vibrator");
            sInited = true;
            Intent serviceIntent = new Intent(IGameTuningService.class.getName());
            serviceIntent.setPackage("com.enhance.gameservice");
            activity.getApplicationContext().bindService(serviceIntent, connection, 1);
            int versionCode = 1;
            try {
                versionCode = Cocos2dxActivity.getContext().getPackageManager().getPackageInfo(getCocos2dxPackageName(), 0).versionCode;
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
            try {
                sOBBFile = APKExpansionSupport.getAPKExpansionZipFile(Cocos2dxActivity.getContext(), versionCode, 0);
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public static String getAssetsPath() {
        if (sAssetsPath == "") {
            int versionCode = 1;
            try {
                versionCode = sActivity.getPackageManager().getPackageInfo(sPackageName, 0).versionCode;
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
            String pathToOBB = Environment.getExternalStorageDirectory().getAbsolutePath() + "/Android/obb/" + sPackageName + "/main." + versionCode + "." + sPackageName + ".obb";
            File obbFile = new File(pathToOBB);
            if (obbFile.exists()) {
                sAssetsPath = pathToOBB;
            } else {
                sAssetsPath = sActivity.getApplicationInfo().sourceDir;
            }
        }
        return sAssetsPath;
    }

    public static ZipResourceFile getObbFile() {
        return sOBBFile;
    }

    public static Activity getActivity() {
        return sActivity;
    }

    public static void addOnActivityResultListener(PreferenceManager.OnActivityResultListener listener) {
        onActivityResultListeners.add(listener);
    }

    public static Set<PreferenceManager.OnActivityResultListener> getOnActivityResultListeners() {
        return onActivityResultListeners;
    }

    public static boolean isActivityVisible() {
        return sActivityVisible;
    }

    public static String getCocos2dxPackageName() {
        return sPackageName;
    }

    public static String getCocos2dxWritablePath() {
        return sFileDirectory;
    }

    public static String getCurrentLanguage() {
        return Locale.getDefault().getLanguage();
    }

    public static String getDeviceModel() {
        return Build.MODEL;
    }

    public static AssetManager getAssetManager() {
        return sAssetManager;
    }

    public static void enableAccelerometer() {
        sAccelerometerEnabled = true;
        sCocos2dxAccelerometer.enableAccel();
    }

    public static void enableCompass() {
        sCompassEnabled = true;
        sCocos2dxAccelerometer.enableCompass();
    }

    public static void setAccelerometerInterval(float interval) {
        sCocos2dxAccelerometer.setInterval(interval);
    }

    public static void disableAccelerometer() {
        sAccelerometerEnabled = false;
        sCocos2dxAccelerometer.disable();
    }

    public static void setKeepScreenOn(boolean value) {
        ((Cocos2dxActivity) sActivity).setKeepScreenOn(value);
    }

    public static void vibrate(float duration) {
        sVibrateService.vibrate((long) (1000.0f * duration));
    }

    public static void copyText(String str) {
        if (sActivity != null) {
            ((Cocos2dxActivity) sActivity).copyText(str);
        }
    }

    public static String getVersion() {
        try {
            return Cocos2dxActivity.getContext().getPackageManager().getPackageInfo(Cocos2dxActivity.getContext().getPackageName(), 0).versionName;
        } catch (Exception e) {
            return "";
        }
    }

    public static boolean openURL(String url) {
        try {
            Intent i = new Intent("android.intent.action.VIEW");
            i.setData(Uri.parse(url));
            sActivity.startActivity(i);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static long[] getObbAssetFileDescriptor(String path) throws NoSuchMethodException, SecurityException {
        AssetFileDescriptor descriptor;
        long[] array = new long[3];
        if (sOBBFile != null && (descriptor = sOBBFile.getAssetFileDescriptor(path)) != null) {
            try {
                ParcelFileDescriptor parcel = descriptor.getParcelFileDescriptor();
                Method method = parcel.getClass().getMethod("getFd", new Class[0]);
                array[0] = ((Integer) method.invoke(parcel, new Object[0])).intValue();
                array[1] = descriptor.getStartOffset();
                array[2] = descriptor.getLength();
            } catch (IllegalAccessException e) {
                Log.e(TAG, e.toString());
            } catch (NoSuchMethodException e2) {
                Log.e(TAG, "Accessing file descriptor directly from the OBB is only supported from Android 3.1 (API level 12) and above.");
            } catch (InvocationTargetException e3) {
                Log.e(TAG, e3.toString());
            }
        }
        return array;
    }

    public static void preloadBackgroundMusic(String pPath) {
        sCocos2dMusic.preloadBackgroundMusic(pPath);
    }

    public static void playBackgroundMusic(String pPath, boolean isLoop) {
        sCocos2dMusic.playBackgroundMusic(pPath, isLoop);
    }

    public static void resumeBackgroundMusic() {
        sCocos2dMusic.resumeBackgroundMusic();
    }

    public static void pauseBackgroundMusic() {
        sCocos2dMusic.pauseBackgroundMusic();
    }

    public static void stopBackgroundMusic() {
        sCocos2dMusic.stopBackgroundMusic();
    }

    public static void rewindBackgroundMusic() {
        sCocos2dMusic.rewindBackgroundMusic();
    }

    public static boolean willPlayBackgroundMusic() {
        return sCocos2dMusic.willPlayBackgroundMusic();
    }

    public static boolean isBackgroundMusicPlaying() {
        return sCocos2dMusic.isBackgroundMusicPlaying();
    }

    public static float getBackgroundMusicVolume() {
        return sCocos2dMusic.getBackgroundVolume();
    }

    public static void setBackgroundMusicVolume(float volume) {
        sCocos2dMusic.setBackgroundVolume(volume);
    }

    public static void preloadEffect(String path) {
        sCocos2dSound.preloadEffect(path);
    }

    public static int playEffect(String path, boolean isLoop, float pitch, float pan, float gain) {
        return sCocos2dSound.playEffect(path, isLoop, pitch, pan, gain);
    }

    public static void resumeEffect(int soundId) {
        sCocos2dSound.resumeEffect(soundId);
    }

    public static void pauseEffect(int soundId) {
        sCocos2dSound.pauseEffect(soundId);
    }

    public static void stopEffect(int soundId) {
        sCocos2dSound.stopEffect(soundId);
    }

    public static float getEffectsVolume() {
        return sCocos2dSound.getEffectsVolume();
    }

    public static void setEffectsVolume(float volume) {
        sCocos2dSound.setEffectsVolume(volume);
    }

    public static void unloadEffect(String path) {
        sCocos2dSound.unloadEffect(path);
    }

    public static void pauseAllEffects() {
        sCocos2dSound.pauseAllEffects();
    }

    public static void resumeAllEffects() {
        sCocos2dSound.resumeAllEffects();
    }

    public static void stopAllEffects() {
        sCocos2dSound.stopAllEffects();
    }

    public static void end() {
        sCocos2dMusic.end();
        sCocos2dSound.end();
    }

    public static void onResume() {
        sActivityVisible = true;
        if (sAccelerometerEnabled) {
            sCocos2dxAccelerometer.enableAccel();
        }
        if (sCompassEnabled) {
            sCocos2dxAccelerometer.enableCompass();
        }
    }

    public static void onPause() {
        sActivityVisible = false;
        if (sAccelerometerEnabled) {
            sCocos2dxAccelerometer.disable();
        }
    }

    public static void onEnterBackground() {
        sCocos2dSound.onEnterBackground();
        sCocos2dMusic.onEnterBackground();
    }

    public static void onEnterForeground() {
        sCocos2dSound.onEnterForeground();
        sCocos2dMusic.onEnterForeground();
    }

    public static void terminateProcess() {
        Process.killProcess(Process.myPid());
    }

    private static void showDialog(String pTitle, String pMessage) {
        sCocos2dxHelperListener.showDialog(pTitle, pMessage);
    }

    public static void setEditTextDialogResult(String pResult) throws UnsupportedEncodingException {
        try {
            final byte[] bytesUTF8 = pResult.getBytes("UTF8");
            sCocos2dxHelperListener.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxHelper.2
                @Override // java.lang.Runnable
                public void run() {
                    Cocos2dxHelper.nativeSetEditTextDialogResult(bytesUTF8);
                }
            });
        } catch (UnsupportedEncodingException e) {
        }
    }

    public static int getDPI() {
        Display d;
        if (sActivity != null) {
            DisplayMetrics metrics = new DisplayMetrics();
            WindowManager wm = sActivity.getWindowManager();
            if (wm != null && (d = wm.getDefaultDisplay()) != null) {
                d.getMetrics(metrics);
                return (int) (metrics.density * 160.0f);
            }
        }
        return -1;
    }

    public static boolean getBoolForKey(String key, boolean defaultValue) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        try {
            return settings.getBoolean(key, defaultValue);
        } catch (Exception ex) {
            ex.printStackTrace();
            Map allValues = settings.getAll();
            Object value = allValues.get(key);
            if (value instanceof String) {
                return Boolean.parseBoolean(value.toString());
            }
            if (value instanceof Integer) {
                int intValue = ((Integer) value).intValue();
                return intValue != 0;
            }
            if (!(value instanceof Float)) {
                return false;
            }
            float floatValue = ((Float) value).floatValue();
            return floatValue != 0.0f;
        }
    }

    public static int getIntegerForKey(String key, int defaultValue) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        try {
            return settings.getInt(key, defaultValue);
        } catch (Exception ex) {
            ex.printStackTrace();
            Map allValues = settings.getAll();
            Object value = allValues.get(key);
            if (value instanceof String) {
                return Integer.parseInt(value.toString());
            }
            if (value instanceof Float) {
                return ((Float) value).intValue();
            }
            if (!(value instanceof Boolean)) {
                return 0;
            }
            boolean booleanValue = ((Boolean) value).booleanValue();
            return booleanValue ? 1 : 0;
        }
    }

    public static float getFloatForKey(String key, float defaultValue) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        try {
            return settings.getFloat(key, defaultValue);
        } catch (Exception ex) {
            ex.printStackTrace();
            Map allValues = settings.getAll();
            Object value = allValues.get(key);
            if (value instanceof String) {
                return Float.parseFloat(value.toString());
            }
            if (value instanceof Integer) {
                return ((Integer) value).floatValue();
            }
            if (value instanceof Boolean) {
                boolean booleanValue = ((Boolean) value).booleanValue();
                if (booleanValue) {
                    return 1.0f;
                }
            }
            return 0.0f;
        }
    }

    public static double getDoubleForKey(String key, double defaultValue) {
        return getFloatForKey(key, (float) defaultValue);
    }

    public static String getStringForKey(String key, String defaultValue) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        try {
            return settings.getString(key, defaultValue);
        } catch (Exception ex) {
            ex.printStackTrace();
            return settings.getAll().get(key).toString();
        }
    }

    public static void setBoolForKey(String key, boolean value) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putBoolean(key, value);
        editor.commit();
    }

    public static void setIntegerForKey(String key, int value) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public static void setFloatForKey(String key, float value) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putFloat(key, value);
        editor.commit();
    }

    public static void setDoubleForKey(String key, double value) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putFloat(key, (float) value);
        editor.commit();
    }

    public static void setStringForKey(String key, String value) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static void deleteValueForKey(String key) {
        SharedPreferences settings = sActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.remove(key);
        editor.commit();
    }

    public static byte[] conversionEncoding(byte[] text, String fromCharset, String newCharset) {
        try {
            String str = new String(text, fromCharset);
            return str.getBytes(newCharset);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int setResolutionPercent(int per) {
        try {
            if (mGameServiceBinder != null) {
                return mGameServiceBinder.setPreferredResolution(per);
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int setFPS(int fps) {
        try {
            if (mGameServiceBinder != null) {
                return mGameServiceBinder.setFramePerSecond(fps);
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int fastLoading(int sec) {
        try {
            if (mGameServiceBinder != null) {
                return mGameServiceBinder.boostUp(sec);
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int getTemperature() {
        try {
            if (mGameServiceBinder != null) {
                return mGameServiceBinder.getAbstractTemperature();
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int setLowPowerMode(boolean enable) {
        try {
            if (mGameServiceBinder != null) {
                return mGameServiceBinder.setGamePowerSaving(enable);
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static float[] getAccelValue() {
        return sCocos2dxAccelerometer.accelerometerValues;
    }

    public static float[] getCompassValue() {
        return sCocos2dxAccelerometer.compassFieldValues;
    }

    public static int getSDKVersion() {
        return Build.VERSION.SDK_INT;
    }
}
