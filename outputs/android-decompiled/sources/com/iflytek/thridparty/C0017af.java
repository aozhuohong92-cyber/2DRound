package com.iflytek.thridparty;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import android.webkit.MimeTypeMap;
import com.iflytek.cloud.ErrorCode;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.httpclient.cookie.CookieSpec;

/* renamed from: com.iflytek.thridparty.af, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C0017af implements InterfaceC0019ah {
    private static final Pattern a = Pattern.compile("attachment;\\s*filename\\s*=\\s*\"([^\"]*)\"");
    private static Random b = new Random(SystemClock.uptimeMillis());
    private long c;
    private int d;
    private InterfaceC0018ag e;
    private boolean f;
    private C0016ae g;
    private long h;
    private long i;
    private String j;
    private String k;
    private boolean l;
    private String m;
    private String n;
    private FileOutputStream o;
    private long p;
    private long q;
    private long r;
    private Context s;

    public C0017af() {
        this(System.currentTimeMillis(), 0, null);
    }

    public C0017af(long j, int i, Context context) {
        this.c = j;
        this.d = i;
        this.s = context;
        this.g = new C0016ae(this);
    }

    private static String a(String str) {
        try {
            Matcher matcher = a.matcher(str);
            if (matcher.find()) {
                return matcher.group(1);
            }
        } catch (IllegalStateException e) {
        }
        return null;
    }

    private static String a(String str, String str2, int i) {
        String strA = null;
        if (str != null) {
            String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(str2.substring(str2.lastIndexOf(46) + 1));
            if (mimeTypeFromExtension == null || !mimeTypeFromExtension.equalsIgnoreCase(str)) {
                strA = a(str, false);
            }
        }
        return strA == null ? str2.substring(i) : strA;
    }

    private static String a(String str, String str2, String str3) {
        String strSubstring;
        String strDecode;
        int iLastIndexOf;
        int iLastIndexOf2;
        String strA = null;
        if (0 == 0 && str2 != null && (strA = a(str2)) != null && (iLastIndexOf2 = strA.lastIndexOf(47) + 1) > 0) {
            strA = strA.substring(iLastIndexOf2);
        }
        if (strA != null || str3 == null || (strSubstring = Uri.decode(str3)) == null || strSubstring.endsWith(CookieSpec.PATH_DELIM) || strSubstring.indexOf(63) >= 0) {
            strSubstring = strA;
        } else {
            int iLastIndexOf3 = strSubstring.lastIndexOf(47) + 1;
            if (iLastIndexOf3 > 0) {
                strSubstring = strSubstring.substring(iLastIndexOf3);
            }
        }
        if (strSubstring == null && (strDecode = Uri.decode(str)) != null && !strDecode.endsWith(CookieSpec.PATH_DELIM) && strDecode.indexOf(63) < 0 && (iLastIndexOf = strDecode.lastIndexOf(47) + 1) > 0) {
            strSubstring = strDecode.substring(iLastIndexOf);
        }
        if (strSubstring == null) {
            strSubstring = "downloadfile";
        }
        return strSubstring.replaceAll("[^a-zA-Z0-9\\.\\-_]+", "_");
    }

    private static String a(String str, boolean z) {
        String extensionFromMimeType = null;
        if (str != null && (extensionFromMimeType = MimeTypeMap.getSingleton().getExtensionFromMimeType(str)) != null) {
            extensionFromMimeType = "." + extensionFromMimeType;
        }
        return extensionFromMimeType == null ? (str == null || !str.toLowerCase().startsWith("text/")) ? z ? ".bin" : extensionFromMimeType : str.equalsIgnoreCase("text/html") ? ".html" : z ? ".txt" : extensionFromMimeType : extensionFromMimeType;
    }

    private static String[] a(String str, String str2, String str3, String str4, String str5, String str6) {
        String strA;
        String strA2 = a(str2, str3, str4);
        int iLastIndexOf = strA2.lastIndexOf(46);
        if (iLastIndexOf < 0) {
            strA = a(str5, true);
        } else {
            strA = a(str5, strA2, iLastIndexOf);
            strA2 = strA2.substring(0, iLastIndexOf);
        }
        if (!str.endsWith(File.separator)) {
            str = str + File.separator;
        }
        return new String[]{b(str + strA2, strA, str6), strA};
    }

    private static String b(String str, String str2, String str3) {
        String str4 = str + str3;
        if (!new File(str + str2).exists() && !new File(str4).exists()) {
            return str;
        }
        String str5 = str + "-";
        int iNextInt = 1;
        for (int i = 1; i < 1000000000; i *= 10) {
            for (int i2 = 0; i2 < 9; i2++) {
                String str6 = str5 + iNextInt;
                String str7 = str6 + str3;
                if (!new File(str6 + str2).exists() && !new File(str7).exists()) {
                    return str6;
                }
                iNextInt += b.nextInt(i) + 1;
            }
        }
        return null;
    }

    private void e() throws IOException {
        if (this.o != null) {
            try {
                this.o.close();
            } catch (IOException e) {
            }
            this.o = null;
        }
        this.k = null;
    }

    @Override // com.iflytek.thridparty.InterfaceC0019ah
    public int a(long j, String str, String str2, String str3, String str4, String str5) {
        C0020ai.c("onStart, url = " + str2);
        if (this.f) {
            return -2;
        }
        String[] strArrA = a(this.n, str2, str4, str5, str, ".tmp");
        if (this.k == null) {
            this.k = strArrA[0];
            if (this.k == null) {
                return ErrorCode.ERROR_FILE_ACCESS;
            }
            this.k = this.k.concat(".tmp");
        }
        this.m = strArrA[1];
        C0020ai.c("onStart, bytesRead : " + this.h + ", length : " + j);
        C0020ai.c("onStart, filename : " + this.k + ", extension : " + this.m);
        if ((Z.a() ? Z.a(Z.b()) : Z.a(this.s)) < j - this.h) {
            return ErrorCode.ERROR_FILE_ACCESS;
        }
        File file = new File(this.n);
        if (!file.exists()) {
            file.mkdirs();
        }
        if (this.f) {
            return -2;
        }
        C0020ai.c("create file success");
        try {
            this.i = j;
            this.q = this.i / 100;
            this.p = SystemClock.elapsedRealtime();
            this.r = 0L;
            this.o = new FileOutputStream(this.k, true);
            if (this.f) {
                return -2;
            }
            if (this.e != null) {
                this.e.a(j, str, this.k, str3, this);
            }
            return 0;
        } catch (FileNotFoundException e) {
            C0020ai.b("onStart, create file error", e.toString());
            return ErrorCode.ERROR_FILE_ACCESS;
        }
    }

    @Override // com.iflytek.thridparty.InterfaceC0019ah
    public int a(byte[] bArr, int i) throws IOException {
        if (this.f) {
            return -2;
        }
        try {
            this.o.write(bArr, 0, i);
            if (this.f) {
                return -2;
            }
            this.o.flush();
            if (this.f) {
                return -2;
            }
            this.h += i;
            if (this.e != null && this.h - this.r >= this.q) {
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                if (jElapsedRealtime - this.p >= 40) {
                    this.e.a(this.h, (int) ((this.h * 100) / this.i), this);
                    this.r = this.h;
                    this.p = jElapsedRealtime;
                }
            }
            return 0;
        } catch (IOException e) {
            return ErrorCode.ERROR_FILE_ACCESS;
        }
    }

    public synchronized void a() {
        this.f = true;
        this.g.a();
        if (!TextUtils.isEmpty(this.k)) {
            File file = new File(this.k);
            if (file.exists()) {
                file.delete();
            }
        }
        e();
    }

    @Override // com.iflytek.thridparty.InterfaceC0019ah
    public void a(int i) throws IOException {
        C0020ai.b("onError errorCode = " + i);
        if (!this.f && this.e != null) {
            this.e.a(i, this);
        }
        e();
    }

    public void a(InterfaceC0018ag interfaceC0018ag) {
        this.e = interfaceC0018ag;
    }

    public void a(String str, String str2, String str3, boolean z, String str4) {
        C0020ai.c("currentPath : " + str2 + ", specifiedPath : " + str3 + ", url : " + str);
        long length = 0;
        this.k = null;
        String str5 = str2 != null ? str2 : str3;
        this.j = str3;
        this.l = z;
        File file = new File(str5);
        if (file.exists()) {
            if (file.isDirectory()) {
                this.n = str5;
                this.l = false;
            } else {
                this.n = file.getParentFile().getAbsolutePath();
                if (str2 != null) {
                    length = file.length();
                    this.k = str5;
                }
            }
        } else if (str5.endsWith(File.separator)) {
            this.n = str5;
            this.l = false;
        } else {
            this.n = str5.substring(0, str5.lastIndexOf(File.separator));
        }
        this.h = length;
        C0020ai.c("mFileDir : " + this.n + ", mBytesRead : " + this.h + ", mSpecifiedPath : " + this.j);
        this.g.a(str, length, str4, 4096);
    }

    public long b() {
        return this.c;
    }

    @Override // com.iflytek.thridparty.InterfaceC0019ah
    public void c() throws IOException {
        C0020ai.c("onFinish | cover = " + this.l + " mFilename = " + this.k + " mSpecifiedPath = " + this.j);
        try {
            String strConcat = this.l ? this.j : this.k.substring(0, this.k.lastIndexOf(46)).concat(this.m);
            File file = new File(strConcat);
            if (file.exists()) {
                file.delete();
            }
            new File(this.k).renameTo(file);
            if (!this.f && this.e != null) {
                this.e.a(strConcat, this);
            }
            e();
        } catch (Exception e) {
            e.printStackTrace();
            a(ErrorCode.ERROR_INVALID_DATA);
        }
    }

    @Override // com.iflytek.thridparty.InterfaceC0019ah
    public void d() throws IOException {
        C0020ai.a("onCancel");
        e();
    }
}
