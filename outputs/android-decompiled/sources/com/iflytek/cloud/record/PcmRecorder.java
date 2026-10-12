package com.iflytek.cloud.record;

import android.media.AudioRecord;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.thridparty.C0020ai;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class PcmRecorder extends Thread {
    public static final int RATE16K = 16000;
    public static final int READ_INTERVAL40MS = 40;
    private final short a;
    private byte[] b;
    private AudioRecord c;
    private PcmRecordListener d;
    private PcmRecordListener e;
    private volatile boolean f;
    private int g;
    private int h;
    private int i;
    private int j;

    public interface PcmRecordListener {
        void onError(SpeechError speechError);

        void onRecordBuffer(byte[] bArr, int i, int i2);

        void onRecordReleased();

        void onRecordStarted(boolean z);
    }

    public PcmRecorder(int i, int i2) {
        this(i, i2, 1);
    }

    public PcmRecorder(int i, int i2, int i3) {
        this.a = (short) 16;
        this.b = null;
        this.c = null;
        this.d = null;
        this.e = null;
        this.f = false;
        this.g = 16000;
        this.h = 40;
        this.i = 40;
        this.j = i3;
        this.g = i;
        this.h = i2;
        if (this.h < 40 || this.h > 100) {
            this.h = 40;
        }
        this.i = 10;
    }

    private int a() throws SpeechError {
        if (this.c == null || this.d == null) {
            return 0;
        }
        int i = this.c.read(this.b, 0, this.b.length);
        if (i <= 0 || this.d == null) {
            return i;
        }
        this.d.onRecordBuffer(this.b, 0, i);
        return i;
    }

    private void b() {
        synchronized (this) {
            try {
            } catch (Exception e) {
                C0020ai.b(e.toString());
            }
            if (this.c != null) {
                C0020ai.a("release record begin");
                this.c.release();
                this.c = null;
                if (this.e != null) {
                    this.e.onRecordReleased();
                    this.e = null;
                }
                C0020ai.a("release record over");
            }
        }
    }

    protected void a(short s, int i, int i2) throws SpeechError {
        if (this.c != null) {
            b();
        }
        int i3 = (i * i2) / 1000;
        int i4 = (((i3 * 4) * 16) * s) / 8;
        int i5 = s == 1 ? 2 : 3;
        int minBufferSize = AudioRecord.getMinBufferSize(i, i5, 2);
        if (i4 < minBufferSize) {
            i4 = minBufferSize;
        }
        this.c = new AudioRecord(this.j, i, i5, 2, i4);
        this.b = new byte[((i3 * s) * 16) / 8];
        C0020ai.a("\nSampleRate:" + i + "\nChannel:" + i5 + "\nFormat:2\nFramePeriod:" + i3 + "\nBufferSize:" + i4 + "\nMinBufferSize:" + minBufferSize + "\nActualBufferSize:" + this.b.length + "\n");
        if (this.c.getState() != 1) {
            C0020ai.a("create AudioRecord error");
            throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
        }
    }

    protected void finalize() throws Throwable {
        b();
        super.finalize();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws IllegalStateException, SpeechError {
        int i = 0;
        int i2 = 0;
        while (!this.f) {
            try {
                try {
                    a((short) 1, this.g, this.h);
                    break;
                } catch (Exception e) {
                    i2++;
                    if (i2 >= 10) {
                        throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
                    }
                    sleep(40L);
                }
            } catch (Exception e2) {
                C0020ai.a(e2);
                if (this.d != null) {
                    this.d.onError(new SpeechError(ErrorCode.ERROR_AUDIO_RECORD));
                }
            }
        }
        while (!this.f) {
            try {
                this.c.startRecording();
                if (this.c.getRecordingState() == 3) {
                    break;
                } else {
                    throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
                }
            } catch (Exception e3) {
                i++;
                if (i >= 10) {
                    throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
                }
                sleep(40L);
            }
        }
        if (this.d != null) {
            this.d.onRecordStarted(true);
        }
        while (!this.f) {
            a();
            sleep(this.i);
        }
        b();
    }

    public void startRecording(PcmRecordListener pcmRecordListener) throws SpeechError {
        this.d = pcmRecordListener;
        setPriority(10);
        start();
    }

    public void stopRecord(boolean z) {
        this.f = true;
        if (this.e == null) {
            this.e = this.d;
        }
        this.d = null;
        if (z) {
            synchronized (this) {
                try {
                    C0020ai.a("stopRecord...release");
                    if (this.c != null) {
                        if (3 == this.c.getRecordingState() && 1 == this.c.getState()) {
                            C0020ai.a("stopRecord releaseRecording ing...");
                            this.c.release();
                            C0020ai.a("stopRecord releaseRecording end...");
                            this.c = null;
                        }
                        if (this.e != null) {
                            this.e.onRecordReleased();
                            this.e = null;
                        }
                    }
                } catch (Exception e) {
                    C0020ai.b(e.toString());
                }
            }
        }
        C0020ai.a("stop record");
    }
}
