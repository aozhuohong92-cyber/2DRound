package com.iflytek.thridparty;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
final class aY implements Parcelable.Creator<aX> {
    aY() {
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public aX createFromParcel(Parcel parcel) {
        aX aXVar = new aX();
        aXVar.a = parcel.readString();
        aXVar.b = parcel.readString();
        aXVar.c = parcel.readString();
        aXVar.d = parcel.readString();
        aXVar.e = parcel.readString();
        aXVar.f = parcel.readString();
        aXVar.g = parcel.readString();
        return aXVar;
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public aX[] newArray(int i) {
        return new aX[i];
    }
}
