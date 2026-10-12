package cz.msebera.android.httpclient;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public interface ExceptionLogger {
    public static final ExceptionLogger NO_OP = new ExceptionLogger() { // from class: cz.msebera.android.httpclient.ExceptionLogger.1
        @Override // cz.msebera.android.httpclient.ExceptionLogger
        public void log(Exception ex) {
        }
    };
    public static final ExceptionLogger STD_ERR = new ExceptionLogger() { // from class: cz.msebera.android.httpclient.ExceptionLogger.2
        @Override // cz.msebera.android.httpclient.ExceptionLogger
        public void log(Exception ex) {
            ex.printStackTrace();
        }
    };

    void log(Exception exc);
}
