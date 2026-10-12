package com.iflytek.thridparty;

import android.content.Context;
import android.text.TextUtils;
import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.msc.MSC;
import com.iflytek.msc.MSCSessionInfo;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class C {
    public static Object a = new Object();
    private MSCSessionInfo b = new MSCSessionInfo();

    public static void a(Context context, String str, String str2, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, IOException {
        byte[] bytes;
        synchronized (a) {
            String strA = C0029ar.a(context, abstractHandlerC0059w);
            if (!TextUtils.isEmpty(str)) {
                bytes = str.getBytes("utf-8");
            } else if (context != null) {
                String strA2 = C0029ar.a(context);
                bytes = TextUtils.isEmpty(strA2) ? null : strA2.getBytes(abstractHandlerC0059w.o());
            } else {
                bytes = null;
            }
            try {
                int iQMSPLogin = MSC.QMSPLogin(bytes, TextUtils.isEmpty(str2) ? null : str2.getBytes(abstractHandlerC0059w.o()), strA.getBytes(abstractHandlerC0059w.o()));
                C0020ai.a("[MSPLogin]ret:" + iQMSPLogin);
                if (iQMSPLogin != 0) {
                    throw new SpeechError(iQMSPLogin);
                }
            } catch (UnsatisfiedLinkError e) {
                C0020ai.a(e);
                throw new SpeechError(ErrorCode.ERROR_UNSATISFIED_LINK);
            }
        }
    }

    public static boolean a() {
        boolean z;
        synchronized (a) {
            z = MSC.QMSPLogOut() == 0;
        }
        return z;
    }

    public synchronized byte[] a(Context context, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        byte[] bArrQMSPDownloadData;
        synchronized (a) {
            String strC = C0029ar.c(context, abstractHandlerC0059w);
            C0020ai.a("[MSPSession downloadData]enter time:" + System.currentTimeMillis());
            C0021aj.a("LastDataFlag", null);
            bArrQMSPDownloadData = MSC.QMSPDownloadData(strC.getBytes(abstractHandlerC0059w.o()), this.b);
            C0021aj.a("GetNotifyResult", null);
            C0020ai.a("[MSPSession downloadData]leavel:" + this.b.errorcode + ",data len = " + (bArrQMSPDownloadData == null ? 0 : bArrQMSPDownloadData.length));
            int i = this.b.errorcode;
            if (i != 0 || bArrQMSPDownloadData == null) {
                throw new SpeechError(i);
            }
        }
        return bArrQMSPDownloadData;
    }

    public synchronized byte[] a(Context context, AbstractHandlerC0059w abstractHandlerC0059w, String str) throws SpeechError, UnsupportedEncodingException {
        byte[] bArrQMSPSearch;
        synchronized (a) {
            String strC = C0029ar.c(context, abstractHandlerC0059w);
            C0020ai.a("[MSPSession searchResult]enter time:" + System.currentTimeMillis());
            byte[] bytes = str.getBytes("utf-8");
            C0021aj.a("LastDataFlag", null);
            bArrQMSPSearch = MSC.QMSPSearch(strC.getBytes(abstractHandlerC0059w.o()), bytes, this.b);
            C0021aj.a("GetNotifyResult", null);
            C0020ai.a("[QMSPSearch searchResult]leavel:" + this.b.errorcode + ",data len = " + (bArrQMSPSearch == null ? 0 : bArrQMSPSearch.length));
            int i = this.b.errorcode;
            if (i != 0 || bArrQMSPSearch == null) {
                throw new SpeechError(i);
            }
        }
        return bArrQMSPSearch;
    }

    public synchronized byte[] a(Context context, String str, byte[] bArr, AbstractHandlerC0059w abstractHandlerC0059w) throws SpeechError, UnsupportedEncodingException {
        byte[] bArrQMSPUploadData;
        synchronized (a) {
            String strC = C0029ar.c(context, abstractHandlerC0059w);
            C0020ai.a("[MSPSession uploadData]enter time:" + System.currentTimeMillis());
            bArrQMSPUploadData = MSC.QMSPUploadData(str.getBytes(abstractHandlerC0059w.o()), bArr, bArr.length, strC.getBytes("utf-8"), this.b);
            C0020ai.a("[MSPSession uploaddData]leavel:" + this.b.errorcode + ",data len = " + (bArrQMSPUploadData == null ? 0 : bArrQMSPUploadData.length));
            int i = this.b.errorcode;
            if (i != 0 || bArrQMSPUploadData == null) {
                throw new SpeechError(i);
            }
        }
        return bArrQMSPUploadData;
    }
}
