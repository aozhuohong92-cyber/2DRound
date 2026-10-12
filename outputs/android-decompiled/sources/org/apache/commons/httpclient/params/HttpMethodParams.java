package org.apache.commons.httpclient.params;

import android.support.v7.internal.widget.ActivityChooserView;
import org.apache.commons.httpclient.HttpVersion;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpMethodParams extends DefaultHttpParams {
    public static final String BUFFER_WARN_TRIGGER_LIMIT = "http.method.response.buffer.warnlimit";
    public static final String COOKIE_POLICY = "http.protocol.cookie-policy";
    public static final String CREDENTIAL_CHARSET = "http.protocol.credential-charset";
    public static final String DATE_PATTERNS = "http.dateparser.patterns";
    public static final String HEAD_BODY_CHECK_TIMEOUT = "http.protocol.head-body-timeout";
    public static final String HTTP_CONTENT_CHARSET = "http.protocol.content-charset";
    public static final String HTTP_ELEMENT_CHARSET = "http.protocol.element-charset";
    public static final String HTTP_URI_CHARSET = "http.protocol.uri-charset";
    private static final Log LOG;
    public static final String MULTIPART_BOUNDARY = "http.method.multipart.boundary";
    private static final String[] PROTOCOL_STRICTNESS_PARAMETERS;
    public static final String PROTOCOL_VERSION = "http.protocol.version";
    public static final String REJECT_HEAD_BODY = "http.protocol.reject-head-body";
    public static final String RETRY_HANDLER = "http.method.retry-handler";
    public static final String SINGLE_COOKIE_HEADER = "http.protocol.single-cookie-header";
    public static final String SO_TIMEOUT = "http.socket.timeout";
    public static final String STATUS_LINE_GARBAGE_LIMIT = "http.protocol.status-line-garbage-limit";
    public static final String STRICT_TRANSFER_ENCODING = "http.protocol.strict-transfer-encoding";
    public static final String UNAMBIGUOUS_STATUS_LINE = "http.protocol.unambiguous-statusline";
    public static final String USER_AGENT = "http.useragent";
    public static final String USE_EXPECT_CONTINUE = "http.protocol.expect-continue";
    public static final String VIRTUAL_HOST = "http.virtual-host";
    public static final String WARN_EXTRA_INPUT = "http.protocol.warn-extra-input";
    static Class class$org$apache$commons$httpclient$params$HttpMethodParams;

    static {
        Class clsClass$;
        if (class$org$apache$commons$httpclient$params$HttpMethodParams == null) {
            clsClass$ = class$("org.apache.commons.httpclient.params.HttpMethodParams");
            class$org$apache$commons$httpclient$params$HttpMethodParams = clsClass$;
        } else {
            clsClass$ = class$org$apache$commons$httpclient$params$HttpMethodParams;
        }
        LOG = LogFactory.getLog(clsClass$);
        PROTOCOL_STRICTNESS_PARAMETERS = new String[]{UNAMBIGUOUS_STATUS_LINE, "http.protocol.single-cookie-header", "http.protocol.strict-transfer-encoding", REJECT_HEAD_BODY, WARN_EXTRA_INPUT};
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public HttpMethodParams() {
        super(getDefaultParams());
    }

    public HttpMethodParams(HttpParams defaults) {
        super(defaults);
    }

    public String getHttpElementCharset() {
        String charset = (String) getParameter("http.protocol.element-charset");
        if (charset == null) {
            LOG.warn("HTTP element charset not configured, using US-ASCII");
            return "US-ASCII";
        }
        return charset;
    }

    public void setHttpElementCharset(String charset) {
        setParameter("http.protocol.element-charset", charset);
    }

    public String getContentCharset() {
        String charset = (String) getParameter("http.protocol.content-charset");
        if (charset == null) {
            LOG.warn("Default content charset not configured, using ISO-8859-1");
            return "ISO-8859-1";
        }
        return charset;
    }

    public void setUriCharset(String charset) {
        setParameter(HTTP_URI_CHARSET, charset);
    }

    public String getUriCharset() {
        String charset = (String) getParameter(HTTP_URI_CHARSET);
        if (charset == null) {
            return "UTF-8";
        }
        return charset;
    }

    public void setContentCharset(String charset) {
        setParameter("http.protocol.content-charset", charset);
    }

    public String getCredentialCharset() {
        String charset = (String) getParameter(CREDENTIAL_CHARSET);
        if (charset == null) {
            LOG.debug("Credential charset not configured, using HTTP element charset");
            return getHttpElementCharset();
        }
        return charset;
    }

    public void setCredentialCharset(String charset) {
        setParameter(CREDENTIAL_CHARSET, charset);
    }

    public HttpVersion getVersion() {
        Object param = getParameter("http.protocol.version");
        return param == null ? HttpVersion.HTTP_1_1 : (HttpVersion) param;
    }

    public void setVersion(HttpVersion version) {
        setParameter("http.protocol.version", version);
    }

    public String getCookiePolicy() {
        Object param = getParameter("http.protocol.cookie-policy");
        return param == null ? "default" : (String) param;
    }

    public void setCookiePolicy(String policy) {
        setParameter("http.protocol.cookie-policy", policy);
    }

    public int getSoTimeout() {
        return getIntParameter("http.socket.timeout", 0);
    }

    public void setSoTimeout(int timeout) {
        setIntParameter("http.socket.timeout", timeout);
    }

    public void setVirtualHost(String hostname) {
        setParameter("http.virtual-host", hostname);
    }

    public String getVirtualHost() {
        return (String) getParameter("http.virtual-host");
    }

    public void makeStrict() {
        setParameters(PROTOCOL_STRICTNESS_PARAMETERS, Boolean.TRUE);
        setIntParameter(STATUS_LINE_GARBAGE_LIMIT, 0);
    }

    public void makeLenient() {
        setParameters(PROTOCOL_STRICTNESS_PARAMETERS, Boolean.FALSE);
        setIntParameter(STATUS_LINE_GARBAGE_LIMIT, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }
}
