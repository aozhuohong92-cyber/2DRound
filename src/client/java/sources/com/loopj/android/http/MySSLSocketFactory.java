package com.loopj.android.http;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.http.HttpVersion;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class MySSLSocketFactory extends SSLSocketFactory {
    SSLContext sslContext;

    public MySSLSocketFactory(KeyStore truststore) throws NoSuchAlgorithmException, UnrecoverableKeyException, KeyManagementException, KeyStoreException {
        super(truststore);
        this.sslContext = SSLContext.getInstance("TLS");
        X509TrustManager tm = new X509TrustManager() { // from class: com.loopj.android.http.MySSLSocketFactory.1
            @Override // javax.net.ssl.X509TrustManager
            public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }

            @Override // javax.net.ssl.X509TrustManager
            public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }

            @Override // javax.net.ssl.X509TrustManager
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        };
        this.sslContext.init(null, new TrustManager[]{tm}, null);
    }

    @Override // org.apache.http.conn.ssl.SSLSocketFactory, org.apache.http.conn.scheme.LayeredSocketFactory
    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException {
        return this.sslContext.getSocketFactory().createSocket(socket, host, port, autoClose);
    }

    @Override // org.apache.http.conn.ssl.SSLSocketFactory, org.apache.http.conn.scheme.SocketFactory
    public Socket createSocket() throws IOException {
        return this.sslContext.getSocketFactory().createSocket();
    }

    public void fixHttpsURLConnection() {
        HttpsURLConnection.setDefaultSSLSocketFactory(this.sslContext.getSocketFactory());
    }

    public static KeyStore getKeystoreOfCA(InputStream cert) throws Throwable {
        KeyStore keyStore;
        CertificateFactory cf;
        InputStream caInput;
        InputStream caInput2 = null;
        Certificate ca = null;
        try {
            try {
                cf = CertificateFactory.getInstance("X.509");
                caInput = new BufferedInputStream(cert);
            } catch (Throwable th) {
                th = th;
            }
        } catch (CertificateException e) {
            e1 = e;
        }
        try {
            try {
                ca = cf.generateCertificate(caInput);
                if (caInput != null) {
                    try {
                        caInput.close();
                        caInput2 = caInput;
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        caInput2 = caInput;
                    }
                } else {
                    caInput2 = caInput;
                }
            } catch (CertificateException e3) {
                e1 = e3;
                caInput2 = caInput;
                e1.printStackTrace();
                if (caInput2 != null) {
                    try {
                        caInput2.close();
                    } catch (IOException e4) {
                        e4.printStackTrace();
                    }
                }
                String keyStoreType = KeyStore.getDefaultType();
                keyStore = null;
                keyStore = KeyStore.getInstance(keyStoreType);
                keyStore.load(null, null);
                keyStore.setCertificateEntry("ca", ca);
                return keyStore;
            } catch (Throwable th2) {
                th = th2;
                caInput2 = caInput;
                if (caInput2 != null) {
                    try {
                        caInput2.close();
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                throw th;
            }
            keyStore = KeyStore.getInstance(keyStoreType);
            keyStore.load(null, null);
            keyStore.setCertificateEntry("ca", ca);
            return keyStore;
        } catch (Exception e6) {
            e6.printStackTrace();
            return keyStore;
        }
        String keyStoreType2 = KeyStore.getDefaultType();
        keyStore = null;
    }

    public static KeyStore getKeystore() {
        KeyStore trustStore = null;
        try {
            trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
            trustStore.load(null, null);
            return trustStore;
        } catch (Throwable t) {
            t.printStackTrace();
            return trustStore;
        }
    }

    public static SSLSocketFactory getFixedSocketFactory() {
        try {
            SSLSocketFactory socketFactory = new MySSLSocketFactory(getKeystore());
            socketFactory.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            return socketFactory;
        } catch (Throwable t) {
            t.printStackTrace();
            return SSLSocketFactory.getSocketFactory();
        }
    }

    public static DefaultHttpClient getNewHttpClient(KeyStore keyStore) {
        try {
            SSLSocketFactory sf = new MySSLSocketFactory(keyStore);
            SchemeRegistry registry = new SchemeRegistry();
            registry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
            registry.register(new Scheme("https", sf, 443));
            HttpParams params = new BasicHttpParams();
            HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
            HttpProtocolParams.setContentCharset(params, "UTF-8");
            ClientConnectionManager ccm = new ThreadSafeClientConnManager(params, registry);
            return new DefaultHttpClient(ccm, params);
        } catch (Exception e) {
            return new DefaultHttpClient();
        }
    }
}
