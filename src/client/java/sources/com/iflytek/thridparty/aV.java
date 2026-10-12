package com.iflytek.thridparty;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aV {
    public static int a(String str, String str2, boolean z) throws IOException {
        int length = 0;
        try {
            File file = new File(str);
            if (!file.exists()) {
                file.createNewFile();
            } else if (z) {
                file.delete();
                file.createNewFile();
            }
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            randomAccessFile.seek(randomAccessFile.length());
            randomAccessFile.write(str2.getBytes("utf-8"));
            length = (int) randomAccessFile.length();
            randomAccessFile.close();
            return length;
        } catch (IOException e) {
            C0020ai.a("iFly_ContactManager", "save file failed. " + str);
            return length;
        }
    }

    public static String a(String str) throws IOException {
        String str2;
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(str));
            byte[] bArr = new byte[fileInputStream.available()];
            fileInputStream.read(bArr);
            str2 = new String(bArr, "utf-8");
            try {
                fileInputStream.close();
            } catch (IOException e) {
                C0020ai.a("iFly_ContactManager", "load file failed. " + str);
                return str2;
            }
        } catch (IOException e2) {
            str2 = null;
        }
        return str2;
    }
}
