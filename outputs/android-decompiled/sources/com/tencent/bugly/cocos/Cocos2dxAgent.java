package com.tencent.bugly.cocos;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.text.TextUtils;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Cocos2dxAgent {
    private static final String TAG = "Cocos2dxAgent";
    private static final String VERSION = "1.2.0";
    public static String sdkPackageName = "com.tencent.bugly";
    private static boolean isDebug = true;
    private static Handler mHandler = null;
    private static String sAppVersion = null;
    private static String sAppChannel = null;
    private static long sDelayTime = 0;

    private Cocos2dxAgent() throws NoSuchMethodException, SecurityException {
        try {
            mHandler = new Handler(Looper.getMainLooper());
        } catch (Exception e) {
            printLog(2, "[cocos2d-x] Get the main looper handler Failed.");
            e.printStackTrace();
        }
    }

    public String getVersion() {
        return VERSION;
    }

    public static void setSDKPackagePrefixName(String str) {
        if (!TextUtils.isEmpty(str)) {
            sdkPackageName = str;
        }
    }

    public static void initCrashReport(Context context, String str, boolean z) throws IllegalAccessException, NoSuchMethodException, InstantiationException, SecurityException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
        initCrashReport(context, str, z, sAppChannel, sAppVersion, null, sDelayTime);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00cd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void initCrashReport(android.content.Context r8, java.lang.String r9, boolean r10, java.lang.String r11, java.lang.String r12, java.lang.String r13, long r14) throws java.lang.IllegalAccessException, java.lang.NoSuchMethodException, java.lang.InstantiationException, java.lang.SecurityException, java.lang.ClassNotFoundException, java.lang.IllegalArgumentException, java.lang.reflect.InvocationTargetException {
        /*
            Method dump skipped, instructions count: 207
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.cocos.Cocos2dxAgent.initCrashReport(android.content.Context, java.lang.String, boolean, java.lang.String, java.lang.String, java.lang.String, long):void");
    }

    public static void setAppVersion(String str) {
        if (!TextUtils.isEmpty(str)) {
            sAppVersion = str;
        }
    }

    public static void setAppChannel(String str) {
        if (!TextUtils.isEmpty(str)) {
            sAppChannel = str;
        }
    }

    public static void setDelayTime(long j) {
        if (j > 0) {
            sDelayTime = j;
        }
    }

    private static Object newStrategy(Context context, String str, String str2, long j) throws IllegalAccessException, InstantiationException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
        if (context == null || (TextUtils.isEmpty(str) && TextUtils.isEmpty(str2))) {
            return null;
        }
        Object objNewInstance = Reflection.newInstance(convertToCanonicalName("crashreport.CrashReport$UserStrategy"), new Object[]{context}, Context.class);
        if (objNewInstance != null) {
            Class<?> cls = objNewInstance.getClass();
            try {
                cls.getDeclaredMethod("setAppChannel", String.class).invoke(objNewInstance, str);
                cls.getDeclaredMethod("setAppVersion", String.class).invoke(objNewInstance, str2);
                cls.getDeclaredMethod("setAppReportDelay", Long.TYPE).invoke(objNewInstance, Long.valueOf(j));
                return objNewInstance;
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e2) {
                e2.printStackTrace();
            } catch (NoSuchMethodException e3) {
                e3.printStackTrace();
            } catch (InvocationTargetException e4) {
                e4.printStackTrace();
            } catch (Exception e5) {
                e5.printStackTrace();
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:38:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void postException(int r10, java.lang.String r11, java.lang.String r12, java.lang.String r13, boolean r14) throws java.lang.InterruptedException, java.lang.NoSuchMethodException, java.lang.SecurityException {
        /*
            r9 = 4
            r8 = 3
            r7 = 2
            r6 = 1
            r5 = 0
            java.lang.String r0 = "stack traceback"
            boolean r0 = r13.startsWith(r0)     // Catch: java.lang.Throwable -> L8d
            if (r0 == 0) goto L9d
            java.lang.String r0 = "\n"
            int r0 = r13.indexOf(r0)     // Catch: java.lang.Throwable -> L8d
            int r0 = r0 + 1
            int r1 = r13.length()     // Catch: java.lang.Throwable -> L8d
            java.lang.String r0 = r13.substring(r0, r1)     // Catch: java.lang.Throwable -> L8d
            java.lang.String r0 = r0.trim()     // Catch: java.lang.Throwable -> L8d
        L21:
            java.lang.String r1 = "\n"
            int r1 = r0.indexOf(r1)     // Catch: java.lang.Throwable -> L99
            if (r1 <= 0) goto L33
            int r1 = r1 + 1
            int r2 = r0.length()     // Catch: java.lang.Throwable -> L99
            java.lang.String r0 = r0.substring(r1, r2)     // Catch: java.lang.Throwable -> L99
        L33:
            java.lang.String r1 = "\n"
            int r1 = r0.indexOf(r1)     // Catch: java.lang.Throwable -> L99
            if (r1 <= 0) goto L9b
            r2 = 0
            java.lang.String r1 = r0.substring(r2, r1)     // Catch: java.lang.Throwable -> L99
        L40:
            java.lang.String r2 = "]:"
            int r2 = r1.indexOf(r2)     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto L4e
            int r3 = r11.length()     // Catch: java.lang.Throwable -> L99
            if (r3 != 0) goto L58
        L4e:
            r3 = -1
            if (r2 == r3) goto L8b
            r3 = 0
            int r2 = r2 + 1
            java.lang.String r11 = r1.substring(r3, r2)     // Catch: java.lang.Throwable -> L99
        L58:
            java.lang.String r1 = "crashreport.inner.InnerAPI"
            java.lang.String r1 = convertToCanonicalName(r1)
            java.lang.String r2 = "postCocos2dxCrashAsync"
            java.lang.Object[] r3 = new java.lang.Object[r9]
            java.lang.Integer r4 = java.lang.Integer.valueOf(r10)
            r3[r5] = r4
            r3[r6] = r11
            r3[r7] = r12
            r3[r8] = r0
            java.lang.Class[] r0 = new java.lang.Class[r9]
            java.lang.Class r4 = java.lang.Integer.TYPE
            r0[r5] = r4
            java.lang.Class<java.lang.String> r4 = java.lang.String.class
            r0[r6] = r4
            java.lang.Class<java.lang.String> r4 = java.lang.String.class
            r0[r7] = r4
            java.lang.Class<java.lang.String> r4 = java.lang.String.class
            r0[r8] = r4
            com.tencent.bugly.cocos.Cocos2dxAgent.Reflection.invokeStaticMethod(r1, r2, r3, r0)
            if (r14 == 0) goto L8a
            r0 = 3000(0xbb8, double:1.482E-320)
            delayExit(r0)
        L8a:
            return
        L8b:
            r11 = r12
            goto L58
        L8d:
            r0 = move-exception
            r0 = r13
        L8f:
            if (r11 == 0) goto L97
            int r1 = r11.length()
            if (r1 != 0) goto L58
        L97:
            r11 = r12
            goto L58
        L99:
            r1 = move-exception
            goto L8f
        L9b:
            r1 = r0
            goto L40
        L9d:
            r0 = r13
            goto L21
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.bugly.cocos.Cocos2dxAgent.postException(int, java.lang.String, java.lang.String, java.lang.String, boolean):void");
    }

    public static void printLog(String str) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str)) {
            printLog(2, str);
        }
    }

    public static void printLog(int i, String str) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str)) {
            if (isDebug && i == 0) {
                sdkLog("d", str);
            }
            if (i == 1) {
                sdkLog("i", str);
            }
            if (i == 2) {
                sdkLog("w", str);
            }
            if (i >= 3) {
                sdkLog("e", str);
            }
        }
    }

    private static void sdkLog(String str, String str2) throws NoSuchMethodException, SecurityException {
        Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.BuglyLog"), str, new Object[]{"", str2}, String.class, String.class);
    }

    public static void setUserId(String str) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str)) {
            Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.CrashReport"), "setUserId", new Object[]{str}, String.class);
        }
    }

    public static void setUserSceneTag(Context context, int i) throws NoSuchMethodException, SecurityException {
        if (context != null) {
            Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.CrashReport"), "setUserSceneTag", new Object[]{context, Integer.valueOf(i)}, Context.class, Integer.TYPE);
        }
    }

    public static void putUserData(Context context, String str, String str2) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && context != null) {
            Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.CrashReport"), "putUserData", new Object[]{context, str, str2}, Context.class, String.class, String.class);
        }
    }

    public static void removeUserData(Context context, String str) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str) && context != null) {
            Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.CrashReport"), "removeUserData", new Object[]{context, str}, Context.class, String.class);
        }
    }

    public static void setLog(int i, String str, String str2) throws NoSuchMethodException, SecurityException {
        if (!TextUtils.isEmpty(str)) {
            String str3 = null;
            switch (i) {
                case 0:
                    str3 = "v";
                    break;
                case 1:
                    str3 = "d";
                    break;
                case 2:
                    str3 = "i";
                    break;
                case 3:
                    str3 = "w";
                    break;
                case 4:
                    str3 = "e";
                    break;
            }
            if (str3 != null) {
                Reflection.invokeStaticMethod(convertToCanonicalName("crashreport.BuglyLog"), str3, new Object[]{str, str2}, String.class, String.class);
            }
        }
    }

    private static void delayExit(long j) throws InterruptedException, NoSuchMethodException, SecurityException {
        long jMax = Math.max(0L, j);
        if (mHandler != null) {
            mHandler.postDelayed(new Runnable() { // from class: com.tencent.bugly.cocos.Cocos2dxAgent.1
                @Override // java.lang.Runnable
                public void run() throws NoSuchMethodException, SecurityException {
                    Cocos2dxAgent.exitApplication();
                }
            }, jMax);
            return;
        }
        try {
            Thread.sleep(jMax);
            exitApplication();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void exitApplication() throws NoSuchMethodException, SecurityException {
        int iMyPid = Process.myPid();
        printLog(2, String.format("Exit application by kill process[%d]", Integer.valueOf(iMyPid)));
        Process.killProcess(iMyPid);
    }

    private static String convertToCanonicalName(String str) {
        StringBuilder sb = new StringBuilder();
        if (sdkPackageName == null) {
            sdkPackageName = "com.tencent.bugly";
        }
        sb.append(sdkPackageName);
        sb.append(".");
        sb.append(str);
        return sb.toString();
    }

    private static class Reflection {
        private Reflection() {
        }

        public static Object invokeStaticMethod(String str, String str2, Object[] objArr, Class<?>... clsArr) throws NoSuchMethodException, SecurityException {
            try {
                Method declaredMethod = Class.forName(str).getDeclaredMethod(str2, clsArr);
                declaredMethod.setAccessible(true);
                return declaredMethod.invoke(null, objArr);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                return null;
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
                return null;
            } catch (NoSuchMethodException e3) {
                e3.printStackTrace();
                return null;
            } catch (InvocationTargetException e4) {
                e4.printStackTrace();
                return null;
            } catch (Exception e5) {
                e5.printStackTrace();
                return null;
            }
        }

        public static Object newInstance(String str, Object[] objArr, Class<?>... clsArr) throws IllegalAccessException, InstantiationException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
            Object objNewInstance;
            try {
                Class<?> cls = Class.forName(str);
                if (objArr == null) {
                    objNewInstance = cls.newInstance();
                } else {
                    objNewInstance = cls.getConstructor(clsArr).newInstance(objArr);
                }
                return objNewInstance;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                return null;
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
                return null;
            } catch (InstantiationException e3) {
                e3.printStackTrace();
                return null;
            } catch (NoSuchMethodException e4) {
                e4.printStackTrace();
                return null;
            } catch (InvocationTargetException e5) {
                e5.printStackTrace();
                return null;
            } catch (Exception e6) {
                e6.printStackTrace();
                return null;
            }
        }
    }
}
