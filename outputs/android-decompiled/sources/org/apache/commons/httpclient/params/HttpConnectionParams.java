package org.apache.commons.httpclient.params;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpConnectionParams extends DefaultHttpParams {
    public static final String CONNECTION_TIMEOUT = "http.connection.timeout";
    public static final String SO_LINGER = "http.socket.linger";
    public static final String SO_RCVBUF = "http.socket.receivebuffer";
    public static final String SO_SNDBUF = "http.socket.sendbuffer";
    public static final String SO_TIMEOUT = "http.socket.timeout";
    public static final String STALE_CONNECTION_CHECK = "http.connection.stalecheck";
    public static final String TCP_NODELAY = "http.tcp.nodelay";

    public int getSoTimeout() {
        return getIntParameter("http.socket.timeout", 0);
    }

    public void setSoTimeout(int timeout) {
        setIntParameter("http.socket.timeout", timeout);
    }

    public void setTcpNoDelay(boolean value) {
        setBooleanParameter("http.tcp.nodelay", value);
    }

    public boolean getTcpNoDelay() {
        return getBooleanParameter("http.tcp.nodelay", true);
    }

    public int getSendBufferSize() {
        return getIntParameter(SO_SNDBUF, -1);
    }

    public void setSendBufferSize(int size) {
        setIntParameter(SO_SNDBUF, size);
    }

    public int getReceiveBufferSize() {
        return getIntParameter(SO_RCVBUF, -1);
    }

    public void setReceiveBufferSize(int size) {
        setIntParameter(SO_RCVBUF, size);
    }

    public int getLinger() {
        return getIntParameter("http.socket.linger", -1);
    }

    public void setLinger(int value) {
        setIntParameter("http.socket.linger", value);
    }

    public int getConnectionTimeout() {
        return getIntParameter("http.connection.timeout", 0);
    }

    public void setConnectionTimeout(int timeout) {
        setIntParameter("http.connection.timeout", timeout);
    }

    public boolean isStaleCheckingEnabled() {
        return getBooleanParameter("http.connection.stalecheck", true);
    }

    public void setStaleCheckingEnabled(boolean value) {
        setBooleanParameter("http.connection.stalecheck", value);
    }
}
