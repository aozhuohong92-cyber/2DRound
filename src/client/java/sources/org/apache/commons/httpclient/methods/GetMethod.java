package org.apache.commons.httpclient.methods;

import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class GetMethod extends HttpMethodBase {
    private static final Log LOG;
    static Class class$org$apache$commons$httpclient$methods$GetMethod;

    static {
        Class clsClass$;
        if (class$org$apache$commons$httpclient$methods$GetMethod == null) {
            clsClass$ = class$("org.apache.commons.httpclient.methods.GetMethod");
            class$org$apache$commons$httpclient$methods$GetMethod = clsClass$;
        } else {
            clsClass$ = class$org$apache$commons$httpclient$methods$GetMethod;
        }
        LOG = LogFactory.getLog(clsClass$);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public GetMethod() {
        setFollowRedirects(true);
    }

    public GetMethod(String uri) {
        super(uri);
        LOG.trace("enter GetMethod(String)");
        setFollowRedirects(true);
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public String getName() {
        return "GET";
    }

    @Override // org.apache.commons.httpclient.HttpMethodBase, org.apache.commons.httpclient.HttpMethod
    public void recycle() {
        LOG.trace("enter GetMethod.recycle()");
        super.recycle();
        setFollowRedirects(true);
    }
}
