package com.iflytek.thridparty;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;

/* renamed from: com.iflytek.thridparty.e, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class C0041e {
    private static final char[] b = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};
    private PrintStream a;

    private static int a(InputStream inputStream, byte[] bArr) throws IOException {
        for (int i = 0; i < bArr.length; i++) {
            int i2 = inputStream.read();
            if (i2 == -1) {
                return i;
            }
            bArr[i] = (byte) i2;
        }
        return bArr.length;
    }

    private void a(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[57];
        this.a = new PrintStream(outputStream);
        while (true) {
            int iA = a(inputStream, bArr);
            if (iA == 0) {
                return;
            }
            for (int i = 0; i < iA; i += 3) {
                if (i + 3 <= iA) {
                    a(outputStream, bArr, i, 3);
                } else {
                    a(outputStream, bArr, i, iA - i);
                }
            }
            if (iA < 57) {
                return;
            } else {
                this.a.println();
            }
        }
    }

    private static void a(OutputStream outputStream, byte[] bArr, int i, int i2) throws IOException {
        if (i2 == 1) {
            byte b2 = bArr[i];
            outputStream.write(b[(b2 >>> 2) & 63]);
            outputStream.write(b[(b2 << 4) & 48]);
            outputStream.write(61);
            outputStream.write(61);
            return;
        }
        if (i2 == 2) {
            byte b3 = bArr[i];
            byte b4 = bArr[i + 1];
            outputStream.write(b[(b3 >>> 2) & 63]);
            outputStream.write(b[((b3 << 4) & 48) + ((b4 >>> 4) & 15)]);
            outputStream.write(b[(b4 << 2) & 60]);
            outputStream.write(61);
            return;
        }
        byte b5 = bArr[i];
        byte b6 = bArr[i + 1];
        byte b7 = bArr[i + 2];
        outputStream.write(b[(b5 >>> 2) & 63]);
        outputStream.write(b[((b5 << 4) & 48) + ((b6 >>> 4) & 15)]);
        outputStream.write(b[((b6 << 2) & 60) + ((b7 >>> 6) & 3)]);
        outputStream.write(b[b7 & 63]);
    }

    public final String a(byte[] bArr) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            a(new ByteArrayInputStream(bArr), byteArrayOutputStream);
            return byteArrayOutputStream.toString("8859_1");
        } catch (Exception e) {
            throw new Error("CharacterEncoder.encode internal error");
        }
    }
}
