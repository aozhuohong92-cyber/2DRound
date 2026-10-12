package com.game.core;

import android.app.Activity;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.util.Log;
import java.io.IOException;
import java.io.RandomAccessFile;
import org.apache.commons.httpclient.cookie.CookieSpec;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class AudioRecorder {
    private static AudioRecorder instance;
    private AudioManager audioManager;
    private byte[] buffer;
    private int bufferSize;
    private int maxVolumeLevel;
    private AudioRecord recorder;
    private boolean recording;
    private int sampleRate;
    private int totalSize;
    private RandomAccessFile wavFile;
    private String wavFilePath;
    private String Tag = "cocos2dx";
    private int bSamples = 16;
    private int nChannels = 1;

    class AudioRecordThread implements Runnable {
        AudioRecordThread() {
        }

        @Override // java.lang.Runnable
        public void run() throws IOException {
            int result;
            try {
                AudioRecorder.this.wavFile = new RandomAccessFile(AudioRecorder.this.wavFilePath, "rw");
                AudioRecorder.this.wavFile.setLength(0L);
                byte[] header = new byte[44];
                AudioRecorder.this.wavFile.write(header);
                while (true) {
                    if (!AudioRecorder.this.recording || (result = AudioRecorder.this.recorder.read(AudioRecorder.this.buffer, 0, AudioRecorder.this.buffer.length)) == -3) {
                        break;
                    }
                    if (result == -2) {
                        Log.e(AudioRecorder.this.Tag, "AudioRecord.read()读取录音数据时发生错误: Bad value error");
                        break;
                    } else if (result == -1) {
                        Log.e(AudioRecorder.this.Tag, "AudioRecord.read()读取录音数据时发生错误: Unknown error");
                        break;
                    } else {
                        AudioRecorder.this.wavFile.write(AudioRecorder.this.buffer);
                        AudioRecorder.this.totalSize += AudioRecorder.this.buffer.length;
                    }
                }
                AudioRecorder.this.writeWavHeader(AudioRecorder.this.wavFile, AudioRecorder.this.totalSize, AudioRecorder.this.nChannels, AudioRecorder.this.sampleRate, AudioRecorder.this.bSamples);
                AudioRecorder.this.wavFile.close();
                Log.v(AudioRecorder.this.Tag, "录音数据写入完成");
            } catch (IOException e) {
                Log.e(AudioRecorder.this.Tag, "写入录音数据时发生异常: " + e.getMessage());
            }
        }
    }

    public static AudioRecorder getInstance() {
        if (instance == null) {
            instance = new AudioRecorder();
        }
        return instance;
    }

    public void setCurrentActivity(Activity activity) {
        this.audioManager = (AudioManager) activity.getSystemService("audio");
        this.maxVolumeLevel = this.audioManager.getStreamMaxVolume(3);
        int current = this.audioManager.getStreamVolume(3);
        Log.v(this.Tag, "当前音量====" + current + CookieSpec.PATH_DELIM + this.maxVolumeLevel);
    }

    public int getVolume() {
        int current = this.audioManager.getStreamVolume(3);
        int vol = (int) ((current / this.maxVolumeLevel) * 100.0f);
        Log.v(this.Tag, "获取音量,current:" + current + " max:" + this.maxVolumeLevel + " vol:" + vol);
        return vol;
    }

    public void setVolume(int percent) {
        if (percent >= 0 && percent <= 100) {
            int vol = (this.maxVolumeLevel * percent) / 100;
            Log.v(this.Tag, "设置音量: " + vol);
            this.audioManager.setStreamVolume(3, vol, 0);
        }
    }

    public boolean init(int sampleRate, String filepath) {
        if (this.recorder != null) {
            Log.e(this.Tag, "AudioRecord不能重复初始化");
            return false;
        }
        this.wavFilePath = filepath;
        this.sampleRate = sampleRate;
        this.bufferSize = AudioRecord.getMinBufferSize(sampleRate, 16, 2);
        this.recorder = new AudioRecord(1, sampleRate, 16, 2, this.bufferSize);
        if (this.recorder.getState() == 1) {
            return true;
        }
        Log.e(this.Tag, "AudioRecord初始化失败: " + this.recorder.getState());
        return false;
    }

    public boolean start() throws IllegalStateException {
        if (this.recorder == null || this.recording) {
            return false;
        }
        this.totalSize = 0;
        this.buffer = new byte[this.bufferSize];
        try {
            this.recorder.startRecording();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        this.recording = true;
        new Thread(new AudioRecordThread()).start();
        return true;
    }

    public void stop() throws IllegalStateException {
        if (this.recorder != null && this.recording) {
            this.recording = false;
            try {
                this.recorder.stop();
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
            Log.v(this.Tag, "=> 停止录音");
        }
    }

    public boolean isRecording() {
        return this.recording;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeWavHeader(RandomAccessFile file, int dataLen, int channels, int sampleRate, int byteRate) throws IOException {
        int totalLen = dataLen + 36;
        byte[] header = {82, 73, 70, 70, (byte) (totalLen & 255), (byte) ((totalLen >> 8) & 255), (byte) ((totalLen >> 16) & 255), (byte) ((totalLen >> 24) & 255), 87, 65, 86, 69, 102, 109, 116, 32, 16, 0, 0, 0, 1, 0, (byte) channels, 0, (byte) (sampleRate & 255), (byte) ((sampleRate >> 8) & 255), (byte) ((sampleRate >> 16) & 255), (byte) ((sampleRate >> 24) & 255), (byte) (byteRate & 255), (byte) ((byteRate >> 8) & 255), (byte) ((byteRate >> 16) & 255), (byte) ((byteRate >> 24) & 255), 4, 0, 16, 0, 100, 97, 116, 97, (byte) (dataLen & 255), (byte) ((dataLen >> 8) & 255), (byte) ((dataLen >> 16) & 255), (byte) ((dataLen >> 24) & 255)};
        file.seek(0L);
        file.write(header);
    }
}
