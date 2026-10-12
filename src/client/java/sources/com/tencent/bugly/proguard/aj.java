package com.tencent.bugly.proguard;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/* compiled from: BUGLY */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class aj implements ah {
    @Override // com.tencent.bugly.proguard.ah
    public final byte[] a(byte[] bArr) throws Exception {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream);
        ZipEntry zipEntry = new ZipEntry("zip");
        zipEntry.setSize(bArr.length);
        zipOutputStream.putNextEntry(zipEntry);
        zipOutputStream.write(bArr);
        zipOutputStream.closeEntry();
        zipOutputStream.close();
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.close();
        return byteArray;
    }

    @Override // com.tencent.bugly.proguard.ah
    public final byte[] b(byte[] bArr) throws Exception {
        byte[] byteArray = null;
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ZipInputStream zipInputStream = new ZipInputStream(byteArrayInputStream);
        while (zipInputStream.getNextEntry() != null) {
            byte[] bArr2 = new byte[1024];
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            while (true) {
                int i = zipInputStream.read(bArr2, 0, bArr2.length);
                if (i != -1) {
                    byteArrayOutputStream.write(bArr2, 0, i);
                }
            }
            byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
        }
        zipInputStream.close();
        byteArrayInputStream.close();
        return byteArray;
    }
}
