package com.iflytek.cloud;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class u implements Parcelable.Creator<WakeuperResult> {
    u() {
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public WakeuperResult createFromParcel(Parcel parcel) {
        return new WakeuperResult(parcel);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public WakeuperResult[] newArray(int i) {
        return new WakeuperResult[i];
    }
}
