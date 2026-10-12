package com.game.core;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.iflytek.cloud.InitListener;
import com.iflytek.cloud.RecognizerListener;
import com.iflytek.cloud.RecognizerResult;
import com.iflytek.cloud.SpeechConstant;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.SpeechRecognizer;
import com.iflytek.cloud.SpeechUtility;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Speech {
    private static Speech instance;
    private SpeechRecognizer mIat;
    Context mContext = null;
    private HashMap<String, String> mIatResults = new LinkedHashMap();
    protected String fullText = "";
    private String key = "";
    private RecognizerListener mRecognizerListener = new RecognizerListener() { // from class: com.game.core.Speech.1
        @Override // com.iflytek.cloud.RecognizerListener
        public void onBeginOfSpeech() {
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onError(SpeechError error) {
            Speech.this.sendMessage(error.getErrorCode(), error.getPlainDescription(true));
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEndOfSpeech() {
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onResult(RecognizerResult results, boolean isLast) {
            StringBuilder sb = new StringBuilder();
            Speech speech = Speech.this;
            speech.fullText = sb.append(speech.fullText).append(Speech.this.resultToText(results)).toString();
            if (isLast) {
                Speech.this.sendMessage(0, Speech.this.resultToText(results));
            }
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onVolumeChanged(int volume, byte[] data) {
        }

        @Override // com.iflytek.cloud.RecognizerListener
        public void onEvent(int eventType, int arg1, int arg2, Bundle obj) {
        }
    };
    private InitListener mInitListener = new InitListener() { // from class: com.game.core.Speech.2
        @Override // com.iflytek.cloud.InitListener
        public void onInit(int code) {
            Log.d("cocos2dx", "SpeechRecognizer init() code = " + code);
        }
    };

    public static Speech getInstance() {
        if (instance == null) {
            instance = new Speech();
        }
        return instance;
    }

    public void init(Activity activity) {
        Log.v("cocos2dx", "正在启动语音识别服务");
        this.mContext = activity.getApplicationContext();
        SpeechUtility.createUtility(this.mContext, "appid=571df986");
        this.mIat = SpeechRecognizer.createRecognizer(this.mContext, this.mInitListener);
    }

    public void speechRecognizeFile(String key, String filepath) {
        try {
            BufferedInputStream ins = new BufferedInputStream(new FileInputStream(filepath));
            byte[] data = new byte[ins.available()];
            ins.read(data);
            ins.close();
            Log.v("cocos2dx", "data_length==" + data.length + "===");
            speechRecognize(key, data);
        } catch (IOException e) {
            e.printStackTrace();
            sendMessage(-1, "识别失败,错误码：读取文件失败");
        }
    }

    public void speechRecognize(String key, byte[] audioData) {
        this.mIatResults.clear();
        this.fullText = "";
        this.key = key;
        this.mIat.setParameter("domain", "iat");
        this.mIat.setParameter(SpeechConstant.SAMPLE_RATE, "16000");
        this.mIat.setParameter(SpeechConstant.LANGUAGE, "zh_cn");
        this.mIat.setParameter(SpeechConstant.AUDIO_SOURCE, "-1");
        int ret = this.mIat.startListening(this.mRecognizerListener);
        if (ret != 0) {
            sendMessage(1, "识别失败,错误码：" + ret);
        } else if (audioData != null) {
            this.mIat.writeAudio(audioData, 0, audioData.length);
            this.mIat.stopListening();
        } else {
            this.mIat.cancel();
            sendMessage(1, "读取音频流失败");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMessage(int code, String msg) {
        GameHelper.callLuaFunction("callBackSpeech", code, msg);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String resultToText(RecognizerResult results) throws JSONException {
        String text = JsonParser.parseIatResult(results.getResultString());
        String sn = null;
        try {
            JSONObject resultJson = new JSONObject(results.getResultString());
            sn = resultJson.optString("sn");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.mIatResults.put(sn, text);
        StringBuffer resultBuffer = new StringBuffer();
        for (String key : this.mIatResults.keySet()) {
            resultBuffer.append(this.mIatResults.get(key));
        }
        return resultBuffer.toString();
    }
}
