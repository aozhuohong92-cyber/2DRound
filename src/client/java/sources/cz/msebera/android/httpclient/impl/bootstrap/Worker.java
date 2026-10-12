package cz.msebera.android.httpclient.impl.bootstrap;

import cz.msebera.android.httpclient.ExceptionLogger;
import cz.msebera.android.httpclient.HttpServerConnection;
import cz.msebera.android.httpclient.protocol.BasicHttpContext;
import cz.msebera.android.httpclient.protocol.HttpCoreContext;
import cz.msebera.android.httpclient.protocol.HttpService;
import java.io.IOException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class Worker implements Runnable {
    private final HttpServerConnection conn;
    private final ExceptionLogger exceptionLogger;
    private final HttpService httpservice;

    Worker(HttpService httpservice, HttpServerConnection conn, ExceptionLogger exceptionLogger) {
        this.httpservice = httpservice;
        this.conn = conn;
        this.exceptionLogger = exceptionLogger;
    }

    public HttpServerConnection getConnection() {
        return this.conn;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            try {
                BasicHttpContext localContext = new BasicHttpContext();
                HttpCoreContext context = HttpCoreContext.adapt(localContext);
                while (!Thread.interrupted() && this.conn.isOpen()) {
                    this.httpservice.handleRequest(this.conn, context);
                    localContext.clear();
                }
                this.conn.close();
                try {
                    this.conn.shutdown();
                } catch (IOException ex) {
                    this.exceptionLogger.log(ex);
                }
            } finally {
                try {
                    this.conn.shutdown();
                } catch (IOException ex2) {
                    this.exceptionLogger.log(ex2);
                }
            }
        } catch (Exception ex3) {
            this.exceptionLogger.log(ex3);
        }
    }
}
