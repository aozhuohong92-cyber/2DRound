package com.iflytek.thridparty;

import com.iflytek.cloud.ErrorCode;
import cz.msebera.android.httpclient.conn.params.ConnRoutePNames;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Locale;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpProtocolParams;

/* renamed from: com.iflytek.thridparty.ae, reason: case insensitive filesystem */
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class C0016ae extends Thread {
    private int a;
    private InterfaceC0019ah b;
    private boolean c;
    private String d;
    private int e;
    private int f;
    private int g = 0;
    private int h = 1000;
    private int i;
    private String j;
    private long k;
    private byte[] l;
    private File m;
    private HttpRequestBase n;
    private HttpClient o;
    private HttpHost p;
    private Credentials q;

    public C0016ae(InterfaceC0019ah interfaceC0019ah) {
        this.b = interfaceC0019ah;
        if (this.b == null) {
            throw new NullPointerException("the OnHttpTransListener object can not be null");
        }
    }

    private String a(String str) {
        try {
            String lowerCase = str.trim().toLowerCase(Locale.ENGLISH);
            int iIndexOf = lowerCase.indexOf(59);
            return iIndexOf != -1 ? lowerCase.substring(0, iIndexOf) : lowerCase;
        } catch (NullPointerException e) {
            return null;
        }
    }

    private void b() {
        if (isAlive()) {
            C0020ai.c("startRequest isAlive");
        } else {
            start();
        }
    }

    private int c() {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpConnectionParams.setStaleCheckingEnabled(basicHttpParams, false);
        HttpConnectionParams.setConnectionTimeout(basicHttpParams, 20000);
        HttpConnectionParams.setSoTimeout(basicHttpParams, 20000);
        HttpConnectionParams.setSocketBufferSize(basicHttpParams, 8192);
        HttpClientParams.setRedirecting(basicHttpParams, false);
        HttpProtocolParams.setUserAgent(basicHttpParams, "Android/SpeechService");
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(new ThreadSafeClientConnManager(basicHttpParams, schemeRegistry), basicHttpParams);
        if (this.p != null) {
            defaultHttpClient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, this.p);
        }
        if (this.q != null) {
            defaultHttpClient.getCredentialsProvider().setCredentials(AuthScope.ANY, this.q);
        }
        this.o = defaultHttpClient;
        return 0;
    }

    private int d() {
        if (this.e == 1) {
            HttpGet httpGet = new HttpGet(this.d);
            if (this.k > 0) {
                if (this.j != null) {
                    httpGet.addHeader("If-Match", this.j);
                }
                httpGet.addHeader("Range", "bytes=" + this.k + "-");
                C0020ai.c("HttpClient RANGEbytes=" + this.k);
            }
            this.n = httpGet;
            return 0;
        }
        HttpPost httpPost = new HttpPost(this.d);
        try {
            if (this.e == 2) {
                httpPost.setEntity(new ByteArrayEntity(this.l));
            } else {
                InputStreamEntity inputStreamEntity = new InputStreamEntity(new FileInputStream(this.m), this.m.length());
                inputStreamEntity.setContentType("application/x-gzip");
                inputStreamEntity.setChunked(false);
                httpPost.setEntity(inputStreamEntity);
            }
            this.n = httpPost;
            return 0;
        } catch (FileNotFoundException e) {
            return ErrorCode.ERROR_FILE_ACCESS;
        }
    }

    private boolean e() {
        this.i++;
        if (this.i >= this.g) {
            return false;
        }
        try {
            sleep(this.h);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return true;
    }

    public void a() {
        this.c = true;
        if (this.n == null || this.n.isAborted()) {
            return;
        }
        this.n.abort();
    }

    public void a(String str, long j, String str2, int i) {
        this.e = 1;
        this.d = str;
        this.f = i;
        this.k = j;
        this.i = 0;
        this.a = 0;
        this.j = str2;
        b();
    }

    /* JADX WARN: Code restructure failed: missing block: B:137:0x029e, code lost:
    
        if (r0 == 0) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x02a0, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x02b1, code lost:
    
        r15.n.abort();
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x02b6, code lost:
    
        if (r0 == 0) goto L266;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x02b8, code lost:
    
        r0.close();
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x02c2, code lost:
    
        if (r4 == r2) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x02c4, code lost:
    
        r2 = com.iflytek.cloud.ErrorCode.ERROR_INVALID_RESULT;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x02c6, code lost:
    
        r15.n.abort();
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x02cb, code lost:
    
        if (r0 == 0) goto L157;
     */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x02cd, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:0x02d3, code lost:
    
        r9 = 0;
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x02d4, code lost:
    
        if (r0 == 0) goto L266;
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x02d6, code lost:
    
        r0.close();
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:191:0x032b, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:193:0x032f, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x0330, code lost:
    
        r9 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x038e, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:257:0x03b0, code lost:
    
        r1 = th;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:197:0x0339  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x032b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:307:0x0104 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0185 A[Catch: Exception -> 0x0333, TRY_LEAVE, TryCatch #6 {Exception -> 0x0333, blocks: (B:75:0x0181, B:77:0x0185, B:198:0x033b, B:199:0x0342), top: B:276:0x0181 }] */
    /* JADX WARN: Type inference failed for: r0v100 */
    /* JADX WARN: Type inference failed for: r0v101 */
    /* JADX WARN: Type inference failed for: r0v102 */
    /* JADX WARN: Type inference failed for: r0v103 */
    /* JADX WARN: Type inference failed for: r0v104 */
    /* JADX WARN: Type inference failed for: r0v105 */
    /* JADX WARN: Type inference failed for: r0v59 */
    /* JADX WARN: Type inference failed for: r0v60 */
    /* JADX WARN: Type inference failed for: r0v61 */
    /* JADX WARN: Type inference failed for: r0v62, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v66, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v69, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r0v70 */
    /* JADX WARN: Type inference failed for: r0v71 */
    /* JADX WARN: Type inference failed for: r0v72, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r0v73 */
    /* JADX WARN: Type inference failed for: r0v74, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r0v75 */
    /* JADX WARN: Type inference failed for: r0v95 */
    /* JADX WARN: Type inference failed for: r0v96 */
    /* JADX WARN: Type inference failed for: r0v97 */
    /* JADX WARN: Type inference failed for: r0v98 */
    /* JADX WARN: Type inference failed for: r0v99 */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 958
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.thridparty.C0016ae.run():void");
    }
}
