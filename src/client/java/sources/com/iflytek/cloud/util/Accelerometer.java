package com.iflytek.cloud.util;

import android.content.Context;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Accelerometer {
    private static CLOCKWISE_ANGLE c;
    private SensorManager a;
    private boolean b = false;
    private SensorEventListener d = new a(this);

    public enum CLOCKWISE_ANGLE {
        Deg0(0),
        Deg90(1),
        Deg180(2),
        Deg270(3);

        private int value;

        CLOCKWISE_ANGLE(int i) {
            this.value = i;
        }

        public int getValue() {
            return this.value;
        }
    }

    public Accelerometer(Context context) {
        this.a = null;
        this.a = (SensorManager) context.getSystemService("sensor");
        c = CLOCKWISE_ANGLE.Deg0;
    }

    public static int getDirection() {
        return c.getValue();
    }

    public void start() {
        if (this.b) {
            return;
        }
        this.b = true;
        c = CLOCKWISE_ANGLE.Deg0;
        this.a.registerListener(this.d, this.a.getDefaultSensor(1), 3);
    }

    public void stop() {
        if (this.b) {
            this.b = false;
            this.a.unregisterListener(this.d);
        }
    }
}
