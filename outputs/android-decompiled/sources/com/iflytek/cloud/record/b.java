package com.iflytek.cloud.record;

import android.content.Context;
import android.media.AudioTrack;
import android.os.MemoryFile;
import android.text.TextUtils;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.U;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class b {
    private ArrayList<a> b;
    private Context c;
    private int d;
    private volatile long e;
    private volatile long g;
    private String k;
    private int a = 3145728;
    private MemoryFile f = null;
    private volatile int h = 0;
    private a i = null;
    private String j = "";
    private byte[] l = null;
    private int m = 0;
    private int n = 0;

    public class a {
        long a;
        long b;
        int c;
        int d;

        public a(long j, long j2, int i, int i2) {
            this.a = j;
            this.b = j2;
            this.c = i;
            this.d = i2;
        }
    }

    public b(Context context, int i, String str) {
        this.b = null;
        this.c = null;
        this.d = 16000;
        this.e = 0L;
        this.g = 0L;
        this.k = null;
        this.c = context;
        this.e = 0L;
        this.b = new ArrayList<>();
        this.g = 0L;
        this.d = i;
        this.k = str;
    }

    private void a(byte[] bArr) throws IOException {
        if (bArr == null || bArr.length == 0) {
            return;
        }
        if (this.f == null) {
            this.j = i();
            this.f = new MemoryFile(this.j, this.a);
            this.f.allowPurging(false);
        }
        this.f.writeBytes(bArr, 0, (int) this.g, bArr.length);
        this.g += bArr.length;
    }

    private void b(int i) throws IOException {
        int i2;
        int i3;
        if (this.l == null) {
            this.l = new byte[i * 10];
        }
        int length = this.l.length;
        int i4 = (int) (this.g - this.h);
        if (i4 < length) {
            i2 = i4;
            i3 = i4;
        } else {
            i2 = length;
            i3 = length;
        }
        this.f.readBytes(this.l, this.h, 0, i2);
        this.h = i2 + this.h;
        this.m = 0;
        this.n = i3;
        C0020ai.a("readAudio leave, dataSize=" + i3 + ", bufLen=" + i4);
    }

    private String i() {
        return U.a(this.c) + System.currentTimeMillis() + "tts.pcm";
    }

    public int a() {
        return this.d;
    }

    public void a(AudioTrack audioTrack, int i) throws IOException {
        if (this.m >= this.n) {
            b(i);
        }
        int i2 = i * 2 > this.n - this.m ? this.n - this.m : i;
        audioTrack.write(this.l, this.m, i2);
        this.m = i2 + this.m;
        if (f()) {
            b(audioTrack, i);
        }
    }

    public void a(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.a = (str.length() / 5) * 4 * 32 * 1024;
        this.a = this.a > 614400 ? this.a : 614400;
    }

    public void a(ArrayList<byte[]> arrayList, int i, int i2, int i3) throws IOException {
        C0020ai.a("buffer percent = " + i + " beg=" + i2 + " end=" + i3);
        a aVar = new a(this.g, this.g, i2, i3);
        int i4 = 0;
        while (true) {
            int i5 = i4;
            if (i5 >= arrayList.size()) {
                aVar.b = this.g;
                this.e = i;
                synchronized (this.b) {
                    this.b.add(aVar);
                }
                C0020ai.a("allSize = " + this.g + " maxSize=" + this.a);
                return;
            }
            a(arrayList.get(i5));
            i4 = i5 + 1;
        }
    }

    public boolean a(int i) {
        if (this.e > 95) {
            return true;
        }
        return this.g / 32 >= ((long) i) && 0 < this.g;
    }

    public int b() {
        if (this.f != null) {
            return this.f.length();
        }
        return 0;
    }

    public void b(AudioTrack audioTrack, int i) {
        C0020ai.a("mBuffer.writeTrack writeTrackBlankBlock:" + i);
        int i2 = i + 4096;
        audioTrack.write(new byte[i2], 0, i2);
    }

    public boolean b(String str) {
        C0020ai.a("save to local: format = " + str + " totalSize = " + this.g + " maxSize=" + this.a);
        if (U.a(this.f, this.g, this.k)) {
            return U.a(str, this.k, a());
        }
        return false;
    }

    public void c() throws IOException {
        this.h = 0;
        this.i = null;
        if (this.b.size() > 0) {
            this.i = this.b.get(0);
        }
    }

    public int d() {
        if (this.g <= 0) {
            return 0;
        }
        return (int) (((this.h - (this.n - this.m)) * this.e) / this.g);
    }

    public a e() {
        if (this.i != null) {
            long j = this.h - (this.n - this.m);
            if (j >= this.i.a && j <= this.i.b) {
                return this.i;
            }
            synchronized (this.b) {
                Iterator<a> it2 = this.b.iterator();
                while (it2.hasNext()) {
                    this.i = it2.next();
                    if (j >= this.i.a && j <= this.i.b) {
                        return this.i;
                    }
                }
            }
        }
        return null;
    }

    public boolean f() {
        return 100 == this.e && ((long) this.h) >= this.g && this.m >= this.n;
    }

    protected void finalize() throws Throwable {
        h();
        super.finalize();
    }

    public boolean g() {
        return ((long) this.h) < this.g || this.m < this.n;
    }

    public void h() {
        C0020ai.a("deleteFile");
        try {
            if (this.f != null) {
                this.f.close();
                this.f = null;
            }
        } catch (Exception e) {
            C0020ai.a(e);
        }
    }
}
