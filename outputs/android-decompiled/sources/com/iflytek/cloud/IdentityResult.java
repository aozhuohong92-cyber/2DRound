package com.iflytek.cloud;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class IdentityResult implements Parcelable {
    public static final Parcelable.Creator<IdentityResult> CREATOR = new c();
    private String a;

    private IdentityResult(Parcel parcel) {
        this.a = "";
        this.a = parcel.readString();
    }

    /* synthetic */ IdentityResult(Parcel parcel, c cVar) {
        this(parcel);
    }

    public IdentityResult(String str) {
        this.a = "";
        if (str != null) {
            this.a = str;
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getResultString() {
        return this.a;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.a);
    }
}
