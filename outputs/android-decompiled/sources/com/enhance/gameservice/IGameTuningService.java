package com.enhance.gameservice;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface IGameTuningService extends IInterface {
    int boostUp(int i) throws RemoteException;

    int getAbstractTemperature() throws RemoteException;

    int setFramePerSecond(int i) throws RemoteException;

    int setGamePowerSaving(boolean z) throws RemoteException;

    int setPreferredResolution(int i) throws RemoteException;

    public static class Default implements IGameTuningService {
        @Override // com.enhance.gameservice.IGameTuningService
        public int setPreferredResolution(int resolution) throws RemoteException {
            return 0;
        }

        @Override // com.enhance.gameservice.IGameTuningService
        public int setFramePerSecond(int fps) throws RemoteException {
            return 0;
        }

        @Override // com.enhance.gameservice.IGameTuningService
        public int boostUp(int seconds) throws RemoteException {
            return 0;
        }

        @Override // com.enhance.gameservice.IGameTuningService
        public int getAbstractTemperature() throws RemoteException {
            return 0;
        }

        @Override // com.enhance.gameservice.IGameTuningService
        public int setGamePowerSaving(boolean enable) throws RemoteException {
            return 0;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }
    }

    public static abstract class Stub extends Binder implements IGameTuningService {
        private static final String DESCRIPTOR = "com.enhance.gameservice.IGameTuningService";
        static final int TRANSACTION_boostUp = 3;
        static final int TRANSACTION_getAbstractTemperature = 4;
        static final int TRANSACTION_setFramePerSecond = 2;
        static final int TRANSACTION_setGamePowerSaving = 5;
        static final int TRANSACTION_setPreferredResolution = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IGameTuningService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IGameTuningService)) {
                return (IGameTuningService) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg0 = data.readInt();
                    int _result = setPreferredResolution(_arg0);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg02 = data.readInt();
                    int _result2 = setFramePerSecond(_arg02);
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg03 = data.readInt();
                    int _result3 = boostUp(_arg03);
                    reply.writeNoException();
                    reply.writeInt(_result3);
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    int _result4 = getAbstractTemperature();
                    reply.writeNoException();
                    reply.writeInt(_result4);
                    return true;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    boolean _arg04 = data.readInt() != 0;
                    int _result5 = setGamePowerSaving(_arg04);
                    reply.writeNoException();
                    reply.writeInt(_result5);
                    return true;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements IGameTuningService {
            public static IGameTuningService sDefaultImpl;
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // com.enhance.gameservice.IGameTuningService
            public int setPreferredResolution(int resolution) throws RemoteException {
                int preferredResolution;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(resolution);
                    boolean _status = this.mRemote.transact(1, _data, _reply, 0);
                    if (!_status && Stub.getDefaultImpl() != null) {
                        preferredResolution = Stub.getDefaultImpl().setPreferredResolution(resolution);
                    } else {
                        _reply.readException();
                        preferredResolution = _reply.readInt();
                    }
                    return preferredResolution;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.enhance.gameservice.IGameTuningService
            public int setFramePerSecond(int fps) throws RemoteException {
                int framePerSecond;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(fps);
                    boolean _status = this.mRemote.transact(2, _data, _reply, 0);
                    if (!_status && Stub.getDefaultImpl() != null) {
                        framePerSecond = Stub.getDefaultImpl().setFramePerSecond(fps);
                    } else {
                        _reply.readException();
                        framePerSecond = _reply.readInt();
                    }
                    return framePerSecond;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.enhance.gameservice.IGameTuningService
            public int boostUp(int seconds) throws RemoteException {
                int iBoostUp;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(seconds);
                    boolean _status = this.mRemote.transact(3, _data, _reply, 0);
                    if (!_status && Stub.getDefaultImpl() != null) {
                        iBoostUp = Stub.getDefaultImpl().boostUp(seconds);
                    } else {
                        _reply.readException();
                        iBoostUp = _reply.readInt();
                    }
                    return iBoostUp;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.enhance.gameservice.IGameTuningService
            public int getAbstractTemperature() throws RemoteException {
                int abstractTemperature;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    boolean _status = this.mRemote.transact(4, _data, _reply, 0);
                    if (!_status && Stub.getDefaultImpl() != null) {
                        abstractTemperature = Stub.getDefaultImpl().getAbstractTemperature();
                    } else {
                        _reply.readException();
                        abstractTemperature = _reply.readInt();
                    }
                    return abstractTemperature;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.enhance.gameservice.IGameTuningService
            public int setGamePowerSaving(boolean enable) throws RemoteException {
                int gamePowerSaving;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(enable ? 1 : 0);
                    boolean _status = this.mRemote.transact(5, _data, _reply, 0);
                    if (!_status && Stub.getDefaultImpl() != null) {
                        gamePowerSaving = Stub.getDefaultImpl().setGamePowerSaving(enable);
                    } else {
                        _reply.readException();
                        gamePowerSaving = _reply.readInt();
                    }
                    return gamePowerSaving;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }

        public static boolean setDefaultImpl(IGameTuningService impl) {
            if (Proxy.sDefaultImpl != null) {
                throw new IllegalStateException("setDefaultImpl() called twice");
            }
            if (impl == null) {
                return false;
            }
            Proxy.sDefaultImpl = impl;
            return true;
        }

        public static IGameTuningService getDefaultImpl() {
            return Proxy.sDefaultImpl;
        }
    }
}
