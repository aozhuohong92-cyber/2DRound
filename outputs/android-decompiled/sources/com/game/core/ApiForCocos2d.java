package com.game.core;

import android.os.Environment;
import android.os.StatFs;
import android.support.v4.media.session.PlaybackStateCompat;
import java.io.File;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ApiForCocos2d {
    private static ApiForCocos2d instance;

    public static ApiForCocos2d getInstance() {
        if (instance == null) {
            instance = new ApiForCocos2d();
        }
        return instance;
    }

    public static long freeSpace() {
        try {
            File path = Environment.getDataDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = stat.getBlockSize();
            long availableBlocks = stat.getAvailableBlocks();
            return (availableBlocks * blockSize) / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
        } catch (Exception e) {
            return 0L;
        }
    }

    public static long totalSpace() {
        try {
            File path = Environment.getDataDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = stat.getBlockSize();
            long totalBlocks = stat.getBlockCount();
            return (totalBlocks * blockSize) / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
        } catch (Exception e) {
            return 0L;
        }
    }
}
