package com.iflytek.cloud.util;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import com.iflytek.cloud.util.Accelerometer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class a implements SensorEventListener {
    final /* synthetic */ Accelerometer a;

    a(Accelerometer accelerometer) {
        this.a = accelerometer;
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        if (sensorEvent.sensor.getType() == 1) {
            float f = sensorEvent.values[0];
            float f2 = sensorEvent.values[1];
            float f3 = sensorEvent.values[2];
            if (Math.abs(f) > 3.0f || Math.abs(f2) > 3.0f) {
                if (Math.abs(f) > Math.abs(f2)) {
                    if (f > 0.0f) {
                        Accelerometer.CLOCKWISE_ANGLE unused = Accelerometer.c = Accelerometer.CLOCKWISE_ANGLE.Deg0;
                        return;
                    } else {
                        Accelerometer.CLOCKWISE_ANGLE unused2 = Accelerometer.c = Accelerometer.CLOCKWISE_ANGLE.Deg180;
                        return;
                    }
                }
                if (f2 > 0.0f) {
                    Accelerometer.CLOCKWISE_ANGLE unused3 = Accelerometer.c = Accelerometer.CLOCKWISE_ANGLE.Deg90;
                } else {
                    Accelerometer.CLOCKWISE_ANGLE unused4 = Accelerometer.c = Accelerometer.CLOCKWISE_ANGLE.Deg270;
                }
            }
        }
    }
}
