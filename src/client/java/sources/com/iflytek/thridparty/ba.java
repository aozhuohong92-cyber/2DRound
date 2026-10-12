package com.iflytek.thridparty;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.provider.ContactsContract;
import com.android.vending.expansion.zipfile.APEZProvider;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ba extends bb {
    private static final String[] d = {"display_name", APEZProvider.FILEID};
    private static final String[] e = {"display_name", "data1", "contact_id"};
    private static final String[] f = {APEZProvider.FILEID, "has_phone_number"};
    private static final String[] g = {"contact_id"};
    private static final String[] h = {"display_name"};
    private static final String[] i = {"data1", "data2", "display_name"};
    private static final String[] j = {"has_phone_number"};

    public ba(Context context) {
        super(context);
        a(context);
    }

    @Override // com.iflytek.thridparty.bb
    public Uri a() {
        return ContactsContract.Contacts.CONTENT_URI;
    }

    @Override // com.iflytek.thridparty.bb
    protected String[] b() {
        return d;
    }

    @Override // com.iflytek.thridparty.bb
    protected String c() {
        return Integer.parseInt(Build.VERSION.SDK) >= 8 ? "sort_key" : "display_name";
    }
}
