package com.iflytek.thridparty;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.zip.GZIPOutputStream;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* renamed from: com.iflytek.thridparty.g, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class C0043g {
    private static C0043g a = new C0043g();
    private SecretKeySpec b;

    private C0043g() {
    }

    public static C0043g a() {
        return a;
    }

    private static byte[] b(String str) {
        if (str == null || str.length() == 0) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            gZIPOutputStream.write(str.getBytes("utf-8"));
            gZIPOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return byteArrayOutputStream.toByteArray();
    }

    public final byte[] a(String str) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        if (this.b == null) {
            byte[] bytes = "134e3265829ff82daf16e7b740a600b5".getBytes();
            byte[] bArr = new byte[16];
            for (int i = 0; i < bytes.length && i < bArr.length; i++) {
                bArr[i] = bytes[i];
            }
            this.b = new SecretKeySpec(bArr, "AES");
        }
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(1, this.b, new IvParameterSpec("0102030405060708".getBytes()));
        return b(new C0041e().a(cipher.doFinal(str.getBytes())));
    }
}
