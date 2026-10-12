package com.iflytek.thridparty;

import com.iflytek.cloud.ErrorCode;
import com.iflytek.cloud.SpeechError;
import com.iflytek.cloud.util.FileDownloadListener;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class T implements InterfaceC0018ag {
    final /* synthetic */ S a;

    T(S s) {
        this.a = s;
    }

    @Override // com.iflytek.thridparty.InterfaceC0018ag
    public void a(int i, C0017af c0017af) {
        C0020ai.b("httpdownload onError:errorCode:" + i);
        if (this.a.c == null) {
            c0017af.a();
            return;
        }
        if (this.a.e.size() > 0) {
            this.a.e.remove(Long.valueOf(c0017af.b()));
        }
        if (this.a.c.size() > 0) {
            this.a.c.remove(Long.valueOf(c0017af.b()));
        }
        if (this.a.d.size() <= 0 || this.a.d.get(Long.valueOf(c0017af.b())) == null) {
            return;
        }
        ((FileDownloadListener) this.a.d.get(Long.valueOf(c0017af.b()))).onCompleted(null, new SpeechError(i));
        this.a.d.remove(Long.valueOf(c0017af.b()));
    }

    @Override // com.iflytek.thridparty.InterfaceC0018ag
    public void a(long j, int i, C0017af c0017af) {
        C0020ai.a("httpdownload onProgress:currentBytes:" + j + " percent:" + i);
        if (this.a.c == null) {
            c0017af.a();
        } else {
            if (this.a.d.size() <= 0 || this.a.d.get(Long.valueOf(c0017af.b())) == null) {
                return;
            }
            ((FileDownloadListener) this.a.d.get(Long.valueOf(c0017af.b()))).onProgress(i);
        }
    }

    @Override // com.iflytek.thridparty.InterfaceC0018ag
    public void a(long j, String str, String str2, String str3, C0017af c0017af) {
        C0020ai.a("httpdownload onStart:length:" + j + " mimeType:" + str + " newPath:" + str2);
        if (this.a.c == null) {
            c0017af.a();
            return;
        }
        this.a.e.put(Long.valueOf(c0017af.b()), str2);
        this.a.h.a(((C0027ap) this.a.c.get(Long.valueOf(c0017af.b()))).e("download_uri"), str2);
        if (this.a.d.size() <= 0 || this.a.d.get(Long.valueOf(c0017af.b())) == null) {
            return;
        }
        ((FileDownloadListener) this.a.d.get(Long.valueOf(c0017af.b()))).onStart();
    }

    @Override // com.iflytek.thridparty.InterfaceC0018ag
    public void a(String str, C0017af c0017af) {
        C0020ai.a("httpdownload onFinish:fileName:" + str);
        if (this.a.c == null) {
            c0017af.a();
            return;
        }
        if (this.a.e.size() > 0) {
            this.a.e.remove(Long.valueOf(c0017af.b()));
        }
        String strE = ((C0027ap) this.a.c.get(Long.valueOf(c0017af.b()))).e("file_md5");
        if (this.a.c.size() > 0) {
            this.a.h.a(((C0027ap) this.a.c.get(Long.valueOf(c0017af.b()))).e("download_uri"));
            this.a.c.remove(Long.valueOf(c0017af.b()));
        }
        C0020ai.a("path=" + str);
        if (this.a.d.size() <= 0 || this.a.d.get(Long.valueOf(c0017af.b())) == null) {
            return;
        }
        FileDownloadListener fileDownloadListener = (FileDownloadListener) this.a.d.get(Long.valueOf(c0017af.b()));
        if (U.a(strE, str)) {
            C0020ai.a("this file calculate md5 success！");
            fileDownloadListener.onCompleted(str, null);
        } else {
            fileDownloadListener.onCompleted(null, new SpeechError(ErrorCode.ERROR_INVALID_DATA));
            C0020ai.b("this file calculate md5 error!");
        }
        this.a.d.remove(Long.valueOf(c0017af.b()));
    }
}
