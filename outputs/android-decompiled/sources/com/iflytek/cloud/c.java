package com.iflytek.cloud;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class c implements Parcelable.Creator<IdentityResult> {
    c() {
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public IdentityResult createFromParcel(Parcel parcel) {
        return new IdentityResult(parcel, null);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public IdentityResult[] newArray(int i) {
        return new IdentityResult[i];
    }
}
