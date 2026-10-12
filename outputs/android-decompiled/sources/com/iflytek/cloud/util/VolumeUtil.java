package com.iflytek.cloud.util;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class VolumeUtil {
    public static int computeVolume(byte[] bArr, int i) {
        long j = 0;
        if (bArr == null || i <= 2) {
            return 0;
        }
        int i2 = i / 2;
        long j2 = 0;
        for (int i3 = 0; i3 < (i2 * 2) - 1; i3 += 2) {
            j2 += bArr[i3] + (bArr[i3 + 1] * 256);
        }
        long j3 = j2 / i2;
        for (int i4 = 0; i4 < (i2 * 2) - 1; i4 += 2) {
            int i5 = (int) ((bArr[i4] + (bArr[i4 + 1] * 256)) - j3);
            j += (i5 * i5) >> 9;
        }
        long j4 = j / i2;
        if (j4 < 329) {
            return 0;
        }
        if (j4 < 421) {
            return 1;
        }
        if (j4 < 543) {
            return 2;
        }
        if (j4 < 694) {
            return 3;
        }
        if (j4 < 895) {
            return 4;
        }
        if (j4 < 1146) {
            return 5;
        }
        if (j4 < 1476) {
            return 6;
        }
        if (j4 < 1890) {
            return 7;
        }
        if (j4 < 2433) {
            return 8;
        }
        if (j4 < 3118) {
            return 9;
        }
        if (j4 < 4011) {
            return 10;
        }
        if (j4 < 5142) {
            return 11;
        }
        if (j4 < 6612) {
            return 12;
        }
        if (j4 < 8478) {
            return 13;
        }
        if (j4 < 10900) {
            return 14;
        }
        if (j4 < 13982) {
            return 15;
        }
        if (j4 < 17968) {
            return 16;
        }
        if (j4 < 23054) {
            return 17;
        }
        if (j4 < 29620) {
            return 18;
        }
        if (j4 < 38014) {
            return 19;
        }
        if (j4 < 48828) {
            return 20;
        }
        if (j4 < 62654) {
            return 21;
        }
        if (j4 < 80491) {
            return 22;
        }
        if (j4 < 103294) {
            return 23;
        }
        if (j4 < 132686) {
            return 24;
        }
        if (j4 < 170366) {
            return 25;
        }
        if (j4 < 218728) {
            return 26;
        }
        return j4 < 280830 ? 27 : 30;
    }
}
