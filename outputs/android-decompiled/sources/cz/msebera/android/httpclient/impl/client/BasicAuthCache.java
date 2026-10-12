package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.client.AuthCache;
import cz.msebera.android.httpclient.conn.SchemePortResolver;
import cz.msebera.android.httpclient.conn.UnsupportedSchemeException;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.impl.conn.DefaultSchemePortResolver;
import cz.msebera.android.httpclient.util.Args;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicAuthCache implements AuthCache {
    public HttpClientAndroidLog log;
    private final Map<HttpHost, byte[]> map;
    private final SchemePortResolver schemePortResolver;

    public BasicAuthCache(SchemePortResolver schemePortResolver) {
        this.log = new HttpClientAndroidLog(getClass());
        this.map = new ConcurrentHashMap();
        this.schemePortResolver = schemePortResolver == null ? DefaultSchemePortResolver.INSTANCE : schemePortResolver;
    }

    public BasicAuthCache() {
        this(null);
    }

    protected HttpHost getKey(HttpHost host) {
        if (host.getPort() <= 0) {
            try {
                int port = this.schemePortResolver.resolve(host);
                return new HttpHost(host.getHostName(), port, host.getSchemeName());
            } catch (UnsupportedSchemeException e) {
                return host;
            }
        }
        return host;
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void put(HttpHost host, AuthScheme authScheme) throws IOException {
        Args.notNull(host, "HTTP host");
        if (authScheme != null) {
            if (authScheme instanceof Serializable) {
                try {
                    ByteArrayOutputStream buf = new ByteArrayOutputStream();
                    ObjectOutputStream out = new ObjectOutputStream(buf);
                    out.writeObject(authScheme);
                    out.close();
                    this.map.put(getKey(host), buf.toByteArray());
                    return;
                } catch (IOException ex) {
                    if (this.log.isWarnEnabled()) {
                        this.log.warn("Unexpected I/O error while serializing auth scheme", ex);
                        return;
                    }
                    return;
                }
            }
            if (this.log.isDebugEnabled()) {
                this.log.debug("Auth scheme " + authScheme.getClass() + " is not serializable");
            }
        }
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public AuthScheme get(HttpHost host) throws IOException {
        Args.notNull(host, "HTTP host");
        byte[] bytes = this.map.get(getKey(host));
        if (bytes == null) {
            return null;
        }
        try {
            ByteArrayInputStream buf = new ByteArrayInputStream(bytes);
            ObjectInputStream in = new ObjectInputStream(buf);
            AuthScheme authScheme = (AuthScheme) in.readObject();
            in.close();
            return authScheme;
        } catch (IOException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("Unexpected I/O error while de-serializing auth scheme", ex);
            }
            return null;
        } catch (ClassNotFoundException ex2) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("Unexpected error while de-serializing auth scheme", ex2);
            }
            return null;
        }
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void remove(HttpHost host) {
        Args.notNull(host, "HTTP host");
        this.map.remove(getKey(host));
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void clear() {
        this.map.clear();
    }

    public String toString() {
        return this.map.toString();
    }
}
