package com.iflytek.cloud.util;

import android.content.Context;
import android.text.TextUtils;
import java.io.File;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ResourceUtil {
    public static final String ASR_RES_PATH = "asr_res_path";
    public static final String ENGINE_DESTROY = "engine_destroy";
    public static final String ENGINE_START = "engine_start";
    public static final String GRM_BUILD_PATH = "grm_build_path";
    public static final String IVW_RES_PATH = "ivw_res_path";
    public static final String TTS_RES_PATH = "tts_res_path";

    public enum RESOURCE_TYPE {
        assets,
        res,
        path
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x007e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v10, types: [android.content.res.AssetFileDescriptor] */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v14 */
    /* JADX WARN: Type inference failed for: r2v5, types: [com.iflytek.cloud.util.ResourceUtil$RESOURCE_TYPE] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String a(android.content.Context r9, com.iflytek.cloud.util.ResourceUtil.RESOURCE_TYPE r10, java.lang.String r11) throws java.lang.Throwable {
        /*
            r0 = 0
            boolean r1 = android.text.TextUtils.isEmpty(r11)
            if (r1 != 0) goto L9
            if (r9 != 0) goto La
        L9:
            return r0
        La:
            java.lang.String r1 = r9.getPackageResourcePath()
            com.iflytek.cloud.util.ResourceUtil$RESOURCE_TYPE r2 = com.iflytek.cloud.util.ResourceUtil.RESOURCE_TYPE.assets     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            if (r10 != r2) goto L54
            android.content.res.AssetManager r2 = r9.getAssets()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            android.content.res.AssetFileDescriptor r2 = r2.openFd(r11)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            long r6 = r2.getStartOffset()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            long r4 = r2.getLength()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
        L22:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            r3.<init>()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.String r8 = "fo|"
            java.lang.StringBuilder r3 = r3.append(r8)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.StringBuilder r1 = r3.append(r1)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.String r3 = "|"
            java.lang.StringBuilder r1 = r1.append(r3)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.StringBuilder r1 = r1.append(r6)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.String r3 = "|"
            java.lang.StringBuilder r1 = r1.append(r3)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.StringBuilder r1 = r1.append(r4)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            java.lang.String r0 = r1.toString()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            if (r2 == 0) goto L9
            r2.close()     // Catch: java.lang.Exception -> L4f
            goto L9
        L4f:
            r1 = move-exception
        L50:
            r1.printStackTrace()
            goto L9
        L54:
            java.lang.Integer r2 = java.lang.Integer.valueOf(r11)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            int r2 = r2.intValue()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            android.content.res.Resources r3 = r9.getResources()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            android.content.res.AssetFileDescriptor r2 = r3.openRawResourceFd(r2)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L7a
            long r6 = r2.getStartOffset()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            long r4 = r2.getLength()     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> L8a
            goto L22
        L6d:
            r1 = move-exception
            r2 = r0
        L6f:
            com.iflytek.thridparty.C0020ai.a(r1)     // Catch: java.lang.Throwable -> L87
            if (r2 == 0) goto L9
            r2.close()     // Catch: java.lang.Exception -> L78
            goto L9
        L78:
            r1 = move-exception
            goto L50
        L7a:
            r1 = move-exception
            r2 = r0
        L7c:
            if (r2 == 0) goto L81
            r2.close()     // Catch: java.lang.Exception -> L82
        L81:
            throw r1
        L82:
            r0 = move-exception
            r0.printStackTrace()
            goto L81
        L87:
            r0 = move-exception
            r1 = r0
            goto L7c
        L8a:
            r1 = move-exception
            goto L6f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.cloud.util.ResourceUtil.a(android.content.Context, com.iflytek.cloud.util.ResourceUtil$RESOURCE_TYPE, java.lang.String):java.lang.String");
    }

    private static String a(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.exists() || !file.isFile()) {
            return null;
        }
        return "fo|" + str + "|0|" + file.length();
    }

    public static String generateResourcePath(Context context, RESOURCE_TYPE resource_type, String str) {
        return resource_type == RESOURCE_TYPE.path ? a(str) : a(context, resource_type, str);
    }
}
