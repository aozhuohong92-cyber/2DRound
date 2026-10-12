package com.iflytek.cloud;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class t implements Parcelable.Creator<UnderstanderResult> {
    t() {
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public UnderstanderResult createFromParcel(Parcel parcel) {
        return new UnderstanderResult(parcel);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public UnderstanderResult[] newArray(int i) {
        return new UnderstanderResult[i];
    }
}
