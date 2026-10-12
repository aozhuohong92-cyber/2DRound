package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

@NotThreadSafe
@Deprecated
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CloseableHttpResponseProxy implements InvocationHandler {
    private static final Constructor<?> CONSTRUCTOR;
    private final HttpResponse original;

    static {
        try {
            CONSTRUCTOR = Proxy.getProxyClass(CloseableHttpResponseProxy.class.getClassLoader(), CloseableHttpResponse.class).getConstructor(InvocationHandler.class);
        } catch (NoSuchMethodException ex) {
            throw new IllegalStateException(ex);
        }
    }

    CloseableHttpResponseProxy(HttpResponse original) {
        this.original = original;
    }

    public void close() throws IOException {
        HttpEntity entity = this.original.getEntity();
        EntityUtils.consume(entity);
    }

    @Override // java.lang.reflect.InvocationHandler
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        String mname = method.getName();
        if (mname.equals("close")) {
            close();
            return null;
        }
        try {
            return method.invoke(this.original, args);
        } catch (InvocationTargetException ex) {
            Throwable cause = ex.getCause();
            if (cause != null) {
                throw cause;
            }
            throw ex;
        }
    }

    public static CloseableHttpResponse newProxy(HttpResponse original) {
        try {
            return (CloseableHttpResponse) CONSTRUCTOR.newInstance(new CloseableHttpResponseProxy(original));
        } catch (IllegalAccessException ex) {
            throw new IllegalStateException(ex);
        } catch (InstantiationException ex2) {
            throw new IllegalStateException(ex2);
        } catch (InvocationTargetException ex3) {
            throw new IllegalStateException(ex3);
        }
    }
}
