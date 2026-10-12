package com.iflytek.cloud.record;

import android.content.Context;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.record.b;
import com.iflytek.thridparty.C0020ai;
import com.iflytek.thridparty.V;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class c {
    AudioManager.OnAudioFocusChangeListener a;
    private AudioTrack b;
    private com.iflytek.cloud.record.b c;
    private Context d;
    private b e;
    private a f;
    private volatile int g;
    private int h;
    private boolean i;
    private int j;
    private boolean k;
    private boolean l;
    private Object m;
    private Object n;
    private int o;
    private Handler p;

    public interface a {
        void a();

        void a(int i, int i2, int i3);

        void a(SpeechError speechError);

        void b();

        void c();
    }

    private class b extends Thread {
        private b() {
        }

        /* synthetic */ b(c cVar, d dVar) {
            this();
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            String str;
            String str2;
            try {
                try {
                    C0020ai.a("PcmPlayer", "start player");
                    C0020ai.a("PcmPlayer", "mAudioFocus= " + c.this.i);
                    if (c.this.i) {
                        V.a(c.this.d, Boolean.valueOf(c.this.k), c.this.a);
                    } else {
                        V.a(c.this.d, Boolean.valueOf(c.this.k), null);
                    }
                    c.this.c.c();
                    synchronized (c.this.n) {
                        if (c.this.g != 4 && c.this.g != 3) {
                            c.this.g = 2;
                        }
                    }
                    while (true) {
                        if (c.this.g == 4) {
                            break;
                        }
                        c.this.g();
                        if (c.this.g == 2 || c.this.g == 1) {
                            if (c.this.c.g()) {
                                if (c.this.a(1, 2)) {
                                    Message.obtain(c.this.p, 2).sendToTarget();
                                }
                                int iD = c.this.c.d();
                                b.a aVarE = c.this.c.e();
                                if (aVarE != null) {
                                    c.this.o = aVarE.d;
                                    Message.obtain(c.this.p, 3, iD, aVarE.c).sendToTarget();
                                }
                                if (c.this.b.getPlayState() != 3) {
                                    c.this.b.play();
                                }
                                c.this.c.a(c.this.b, c.this.j);
                            } else if (c.this.c.f()) {
                                C0020ai.a("play stoped");
                                c.this.g = 4;
                                Message.obtain(c.this.p, 4).sendToTarget();
                                break;
                            } else {
                                if (c.this.a(2, 1)) {
                                    C0020ai.a("play onpaused!");
                                    Message.obtain(c.this.p, 1).sendToTarget();
                                }
                                sleep(5L);
                            }
                        } else if (c.this.g == 3) {
                            if (2 != c.this.b.getPlayState()) {
                                c.this.b.pause();
                            }
                            sleep(5L);
                        }
                    }
                    if (c.this.b != null) {
                        c.this.b.stop();
                    }
                    synchronized (c.this.n) {
                        c.this.g = 4;
                    }
                    if (c.this.b != null) {
                        c.this.b.release();
                        c.this.b = null;
                    }
                    if (c.this.i) {
                        V.b(c.this.d, Boolean.valueOf(c.this.k), c.this.a);
                    } else {
                        V.b(c.this.d, Boolean.valueOf(c.this.k), null);
                    }
                    c.this.e = null;
                    str = "PcmPlayer";
                    str2 = "player stopped";
                } catch (Exception e) {
                    C0020ai.a(e);
                    Message.obtain(c.this.p, 0, new SpeechError(ErrorCode.ERROR_PLAY_MEDIA)).sendToTarget();
                    synchronized (c.this.n) {
                        c.this.g = 4;
                        if (c.this.b != null) {
                            c.this.b.release();
                            c.this.b = null;
                        }
                        if (c.this.i) {
                            V.b(c.this.d, Boolean.valueOf(c.this.k), c.this.a);
                        } else {
                            V.b(c.this.d, Boolean.valueOf(c.this.k), null);
                        }
                        c.this.e = null;
                        str = "PcmPlayer";
                        str2 = "player stopped";
                    }
                }
                C0020ai.a(str, str2);
            } catch (Throwable th) {
                synchronized (c.this.n) {
                    c.this.g = 4;
                    if (c.this.b != null) {
                        c.this.b.release();
                        c.this.b = null;
                    }
                    if (c.this.i) {
                        V.b(c.this.d, Boolean.valueOf(c.this.k), c.this.a);
                    } else {
                        V.b(c.this.d, Boolean.valueOf(c.this.k), null);
                    }
                    c.this.e = null;
                    C0020ai.a("PcmPlayer", "player stopped");
                    throw th;
                }
            }
        }
    }

    public c(Context context) {
        this.b = null;
        this.c = null;
        this.d = null;
        this.e = null;
        this.f = null;
        this.g = 0;
        this.h = 3;
        this.i = true;
        this.k = false;
        this.l = false;
        this.m = new Object();
        this.n = this;
        this.a = new d(this);
        this.o = 0;
        this.p = new e(this, Looper.getMainLooper());
        this.d = context;
    }

    public c(Context context, int i, boolean z) {
        this.b = null;
        this.c = null;
        this.d = null;
        this.e = null;
        this.f = null;
        this.g = 0;
        this.h = 3;
        this.i = true;
        this.k = false;
        this.l = false;
        this.m = new Object();
        this.n = this;
        this.a = new d(this);
        this.o = 0;
        this.p = new e(this, Looper.getMainLooper());
        this.d = context;
        this.h = i;
        this.k = z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(int i, int i2) {
        boolean z = false;
        synchronized (this.n) {
            if (i == this.g) {
                this.g = i2;
                z = true;
            }
        }
        return z;
    }

    private void f() throws Exception {
        C0020ai.a("PcmPlayer", "createAudio start");
        int iA = this.c.a();
        this.j = AudioTrack.getMinBufferSize(iA, 2, 2);
        if (this.b != null) {
            b();
        }
        C0020ai.a("PcmPlayer", "createAudio || mStreamType = " + this.h);
        this.b = new AudioTrack(this.h, iA, 2, 2, this.j * 2, 1);
        if (this.j == -2 || this.j == -1) {
            throw new Exception();
        }
        C0020ai.a("PcmPlayer", "createAudio end");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void g() throws Exception {
        if (this.b == null || this.b.getStreamType() != this.h) {
            C0020ai.a("PcmPlayer", "prepAudioPlayer || audiotrack stream type is change.");
            f();
        }
    }

    public int a() {
        return this.g;
    }

    public boolean a(com.iflytek.cloud.record.b bVar, a aVar) {
        C0020ai.a("PcmPlayer", "play mPlaytate= " + this.g + ",mAudioFocus= " + this.i);
        boolean z = true;
        synchronized (this.n) {
            if (this.g == 4 || this.g == 0 || this.g == 3 || this.e == null) {
                this.c = bVar;
                this.f = aVar;
                this.e = new b(this, null);
                this.e.start();
            } else {
                z = false;
            }
        }
        return z;
    }

    public void b() {
        synchronized (this.m) {
            if (this.b != null) {
                if (this.b.getPlayState() == 3) {
                    this.b.stop();
                }
                this.b.release();
                this.b = null;
            }
            C0020ai.a("PcmPlayer", "mAudioTrack released");
        }
    }

    public boolean c() {
        if (this.g == 4 || this.g == 3) {
            return false;
        }
        this.g = 3;
        return true;
    }

    public boolean d() {
        return a(3, 2);
    }

    public void e() {
        synchronized (this.n) {
            this.g = 4;
        }
    }
}
