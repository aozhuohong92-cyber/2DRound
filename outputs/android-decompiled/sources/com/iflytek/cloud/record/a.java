package com.iflytek.cloud.record;

import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.record.PcmRecorder;
import com.iflytek.thridparty.C0020ai;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class a extends PcmRecorder {
    private int a;
    private int b;
    private int c;
    private boolean d;
    private int e;
    private final short f;
    private int g;
    private int h;
    private byte[] i;
    private RandomAccessFile j;
    private String k;
    private PcmRecorder.PcmRecordListener l;

    public a(int i, int i2, int i3, String str) {
        super(i, i2, i3);
        this.a = 0;
        this.b = 0;
        this.c = 0;
        this.d = false;
        this.e = 16000;
        this.f = (short) 16;
        this.g = 40;
        this.h = 40;
        this.i = null;
        this.j = null;
        this.k = null;
        this.l = null;
        this.e = i;
        this.g = i2;
        this.h = i2;
        this.k = str;
    }

    private int a() throws SpeechError {
        if (this.j == null || this.l == null) {
            return 0;
        }
        if (this.b >= this.a) {
            try {
                this.b = 0;
                this.a = this.j.read(this.i, this.b, this.i.length);
                if (this.a < 0) {
                    return -1;
                }
            } catch (IOException e) {
                throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
            }
        }
        if (this.a <= 0 || this.l == null) {
            return 0;
        }
        int i = this.a - this.b > this.c ? this.c : this.a - this.b;
        this.l.onRecordBuffer(this.i, this.b, i);
        this.b += i;
        return i;
    }

    private void b() throws IOException {
        if (this.j != null) {
            C0020ai.a("release record begin");
            try {
                this.j.close();
            } catch (IOException e) {
                C0020ai.a(e);
            }
            this.j = null;
            if (this.l != null) {
                this.l.onRecordReleased();
                this.l = null;
            }
            C0020ai.a("release record over");
        }
        if (this.i != null) {
            this.i = null;
        }
    }

    @Override // com.iflytek.cloud.record.PcmRecorder
    protected void a(short s, int i, int i2) throws SpeechError {
        this.c = (16 * (((i * 40) / 1000) * s)) / 8;
        this.i = new byte[this.c * 10];
        try {
            this.j = new RandomAccessFile(this.k, "r");
        } catch (FileNotFoundException e) {
            throw new SpeechError(ErrorCode.ERROR_AUDIO_RECORD);
        }
    }

    @Override // com.iflytek.cloud.record.PcmRecorder
    protected void finalize() throws Throwable {
        b();
        super.finalize();
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001c, code lost:
    
        r3.d = true;
     */
    @Override // com.iflytek.cloud.record.PcmRecorder, java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() throws java.io.IOException {
        /*
            r3 = this;
            r0 = 1
            int r1 = r3.e     // Catch: java.lang.Exception -> L2a
            int r2 = r3.g     // Catch: java.lang.Exception -> L2a
            r3.a(r0, r1, r2)     // Catch: java.lang.Exception -> L2a
            com.iflytek.cloud.record.PcmRecorder$PcmRecordListener r0 = r3.l     // Catch: java.lang.Exception -> L2a
            if (r0 == 0) goto L12
            com.iflytek.cloud.record.PcmRecorder$PcmRecordListener r0 = r3.l     // Catch: java.lang.Exception -> L2a
            r1 = 1
            r0.onRecordStarted(r1)     // Catch: java.lang.Exception -> L2a
        L12:
            boolean r0 = r3.d     // Catch: java.lang.Exception -> L2a
            if (r0 != 0) goto L1f
            int r0 = r3.a()     // Catch: java.lang.Exception -> L2a
            if (r0 >= 0) goto L23
            r0 = 1
            r3.d = r0     // Catch: java.lang.Exception -> L2a
        L1f:
            r3.b()
            return
        L23:
            int r0 = r3.h     // Catch: java.lang.Exception -> L2a
            long r0 = (long) r0     // Catch: java.lang.Exception -> L2a
            sleep(r0)     // Catch: java.lang.Exception -> L2a
            goto L12
        L2a:
            r0 = move-exception
            com.iflytek.thridparty.C0020ai.a(r0)
            com.iflytek.cloud.record.PcmRecorder$PcmRecordListener r0 = r3.l
            if (r0 == 0) goto L1f
            com.iflytek.cloud.record.PcmRecorder$PcmRecordListener r0 = r3.l
            com.iflytek.cloud.SpeechError r1 = new com.iflytek.cloud.SpeechError
            r2 = 20006(0x4e26, float:2.8034E-41)
            r1.<init>(r2)
            r0.onError(r1)
            goto L1f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.iflytek.cloud.record.a.run():void");
    }

    @Override // com.iflytek.cloud.record.PcmRecorder
    public void startRecording(PcmRecorder.PcmRecordListener pcmRecordListener) throws SpeechError {
        this.l = pcmRecordListener;
        setPriority(10);
        start();
    }

    @Override // com.iflytek.cloud.record.PcmRecorder
    public void stopRecord(boolean z) {
        this.d = true;
    }
}
