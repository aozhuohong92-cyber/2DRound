package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.client.utils.CloneUtils;
import cz.msebera.android.httpclient.concurrent.Cancellable;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger;
import cz.msebera.android.httpclient.message.AbstractHttpMessage;
import cz.msebera.android.httpclient.message.HeaderGroup;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractExecutionAwareRequest extends AbstractHttpMessage implements HttpExecutionAware, AbortableHttpRequest, Cloneable, HttpRequest {
    private final AtomicBoolean aborted = new AtomicBoolean(false);
    private final AtomicReference<Cancellable> cancellableRef = new AtomicReference<>(null);

    protected AbstractExecutionAwareRequest() {
    }

    @Override // cz.msebera.android.httpclient.client.methods.AbortableHttpRequest
    @Deprecated
    public void setConnectionRequest(final ClientConnectionRequest connRequest) {
        setCancellable(new Cancellable() { // from class: cz.msebera.android.httpclient.client.methods.AbstractExecutionAwareRequest.1
            @Override // cz.msebera.android.httpclient.concurrent.Cancellable
            public boolean cancel() {
                connRequest.abortRequest();
                return true;
            }
        });
    }

    @Override // cz.msebera.android.httpclient.client.methods.AbortableHttpRequest
    @Deprecated
    public void setReleaseTrigger(final ConnectionReleaseTrigger releaseTrigger) {
        setCancellable(new Cancellable() { // from class: cz.msebera.android.httpclient.client.methods.AbstractExecutionAwareRequest.2
            @Override // cz.msebera.android.httpclient.concurrent.Cancellable
            public boolean cancel() {
                try {
                    releaseTrigger.abortConnection();
                    return true;
                } catch (IOException e) {
                    return false;
                }
            }
        });
    }

    @Override // cz.msebera.android.httpclient.client.methods.AbortableHttpRequest
    public void abort() {
        Cancellable cancellable;
        if (this.aborted.compareAndSet(false, true) && (cancellable = this.cancellableRef.getAndSet(null)) != null) {
            cancellable.cancel();
        }
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpExecutionAware
    public boolean isAborted() {
        return this.aborted.get();
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpExecutionAware
    public void setCancellable(Cancellable cancellable) {
        if (!this.aborted.get()) {
            this.cancellableRef.set(cancellable);
        }
    }

    public Object clone() throws CloneNotSupportedException {
        AbstractExecutionAwareRequest clone = (AbstractExecutionAwareRequest) super.clone();
        clone.headergroup = (HeaderGroup) CloneUtils.cloneObject(this.headergroup);
        clone.params = (HttpParams) CloneUtils.cloneObject(this.params);
        return clone;
    }

    public void completed() {
        this.cancellableRef.set(null);
    }

    public void reset() {
        Cancellable cancellable = this.cancellableRef.getAndSet(null);
        if (cancellable != null) {
            cancellable.cancel();
        }
        this.aborted.set(false);
    }
}
