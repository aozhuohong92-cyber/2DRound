package com.iflytek.thridparty;

import android.content.Context;
import android.net.Uri;
import android.provider.Contacts;
import com.android.vending.expansion.zipfile.APEZProvider;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class aZ extends bb {
    private static final String[] d = {APEZProvider.FILEID, "name"};
    private static final String[] e = {"name", "number", APEZProvider.FILEID};
    private static final String[] f = {"person"};
    private static final String[] g = {"display_name"};
    private static final String[] h = {"number", "type", "name"};
    private static final String[] i = {APEZProvider.FILEID, "name", "number", "type"};
    private static final String[] j = {"number"};

    public aZ(Context context) {
        super(context);
        a(context);
    }

    @Override // com.iflytek.thridparty.bb
    public Uri a() {
        return Contacts.People.CONTENT_URI;
    }

    @Override // com.iflytek.thridparty.bb
    protected String[] b() {
        return d;
    }

    @Override // com.iflytek.thridparty.bb
    protected String c() {
        return "name";
    }
}
