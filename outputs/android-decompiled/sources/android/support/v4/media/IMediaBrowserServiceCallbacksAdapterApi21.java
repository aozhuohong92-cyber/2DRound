package android.support.v4.media;

import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class IMediaBrowserServiceCallbacksAdapterApi21 {
    private Method mAsBinderMethod;
    Object mCallbackObject;
    private Method mOnConnectFailedMethod;
    private Method mOnConnectMethod;
    private Method mOnLoadChildrenMethod;

    IMediaBrowserServiceCallbacksAdapterApi21(Object callbackObject) throws ClassNotFoundException {
        this.mCallbackObject = callbackObject;
        try {
            Class theClass = Class.forName("android.service.media.IMediaBrowserServiceCallbacks");
            Class parceledListSliceClass = Class.forName("android.content.pm.ParceledListSlice");
            this.mAsBinderMethod = theClass.getMethod("asBinder", new Class[0]);
            this.mOnConnectMethod = theClass.getMethod("onConnect", String.class, MediaSession.Token.class, Bundle.class);
            this.mOnConnectFailedMethod = theClass.getMethod("onConnectFailed", new Class[0]);
            this.mOnLoadChildrenMethod = theClass.getMethod("onLoadChildren", String.class, parceledListSliceClass);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    IBinder asBinder() {
        try {
            IBinder result = (IBinder) this.mAsBinderMethod.invoke(this.mCallbackObject, new Object[0]);
            return result;
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
            return null;
        }
    }

    void onConnect(String root, Object session, Bundle extras) throws IllegalAccessException, RemoteException, IllegalArgumentException, InvocationTargetException {
        try {
            this.mOnConnectMethod.invoke(this.mCallbackObject, root, session, extras);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    void onConnectFailed() throws IllegalAccessException, RemoteException, IllegalArgumentException, InvocationTargetException {
        try {
            this.mOnConnectFailedMethod.invoke(this.mCallbackObject, new Object[0]);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    void onLoadChildren(String mediaId, Object parceledListSliceObj) throws IllegalAccessException, RemoteException, IllegalArgumentException, InvocationTargetException {
        try {
            this.mOnLoadChildrenMethod.invoke(this.mCallbackObject, mediaId, parceledListSliceObj);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    static class Stub {
        static Method sAsInterfaceMethod;

        Stub() {
        }

        static {
            try {
                Class theClass = Class.forName("android.service.media.IMediaBrowserServiceCallbacks$Stub");
                sAsInterfaceMethod = theClass.getMethod("asInterface", IBinder.class);
            } catch (ClassNotFoundException | NoSuchMethodException e) {
                e.printStackTrace();
            }
        }

        static Object asInterface(IBinder binder) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
            try {
                Object result = sAsInterfaceMethod.invoke(null, binder);
                return result;
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
                return null;
            }
        }
    }
}
