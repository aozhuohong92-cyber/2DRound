package com.iflytek.thridparty;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class bc extends Thread {
    boolean a = true;
    private String b;
    private bd c;

    public bc(String str, bd bdVar) {
        this.b = str;
        this.c = bdVar;
    }

    private String a(byte[] bArr) throws IOException {
        String str;
        ByteArrayInputStream byteArrayInputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        try {
            byteArrayInputStream = new ByteArrayInputStream(bArr);
            byteArrayOutputStream = new ByteArrayOutputStream();
            bm.a("HttpGetThread", "unzip len " + bArr.length);
            a(byteArrayInputStream, byteArrayOutputStream);
            byteArrayOutputStream.flush();
            str = new String(byteArrayOutputStream.toByteArray());
        } catch (Exception e) {
            e = e;
            str = null;
        }
        try {
            bm.a("HttpGetThread", "unzip str " + str);
            byteArrayOutputStream.close();
            byteArrayInputStream.close();
        } catch (Exception e2) {
            e = e2;
            bm.a("HttpGetThread", "unzip error ", e);
            return str;
        }
        return str;
    }

    private static void a(InputStream inputStream, OutputStream outputStream) throws IOException {
        GZIPInputStream gZIPInputStream = new GZIPInputStream(inputStream);
        byte[] bArr = new byte[1024];
        while (true) {
            int i = gZIPInputStream.read(bArr, 0, 1024);
            if (i == -1) {
                gZIPInputStream.close();
                return;
            }
            outputStream.write(bArr, 0, i);
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws IOException {
        byte[] bArr;
        try {
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            HttpGet httpGet = new HttpGet(this.b);
            httpGet.setHeader("Accept-Encoding", "gzip, deflate");
            HttpResponse httpResponseExecute = defaultHttpClient.execute(httpGet);
            if (httpResponseExecute.getStatusLine().getStatusCode() == 200) {
                Header firstHeader = httpResponseExecute.getFirstHeader("Content-Length");
                int i = firstHeader != null ? Integer.parseInt(firstHeader.getValue()) : 0;
                if (i <= 0 || i >= 1048576) {
                    byte[] bArr2 = new byte[1048576];
                    int i2 = httpResponseExecute.getEntity().getContent().read(bArr2);
                    byte[] bArr3 = new byte[i2];
                    System.arraycopy(bArr2, 0, bArr3, 0, i2);
                    bArr = bArr3;
                } else {
                    byte[] bArr4 = new byte[i];
                    httpResponseExecute.getEntity().getContent().read(bArr4);
                    bArr = bArr4;
                }
                String strA = this.a ? a(bArr) : null;
                if (strA == null) {
                    strA = new String(bArr);
                }
                if (this.c != null) {
                    this.c.a(strA, 0);
                    return;
                }
                return;
            }
        } catch (Exception e) {
            bm.a("HttpGetThread", "Other Exception", e);
        }
        if (this.c != null) {
            this.c.a(null, -1);
        }
    }
}
