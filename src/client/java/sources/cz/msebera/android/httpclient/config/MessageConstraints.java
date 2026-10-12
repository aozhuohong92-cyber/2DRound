package cz.msebera.android.httpclient.config;

import cz.msebera.android.httpclient.util.Args;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class MessageConstraints implements Cloneable {
    public static final MessageConstraints DEFAULT = new Builder().build();
    private final int maxHeaderCount;
    private final int maxLineLength;

    MessageConstraints(int maxLineLength, int maxHeaderCount) {
        this.maxLineLength = maxLineLength;
        this.maxHeaderCount = maxHeaderCount;
    }

    public int getMaxLineLength() {
        return this.maxLineLength;
    }

    public int getMaxHeaderCount() {
        return this.maxHeaderCount;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public MessageConstraints m6clone() throws CloneNotSupportedException {
        return (MessageConstraints) super.clone();
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("[maxLineLength=").append(this.maxLineLength).append(", maxHeaderCount=").append(this.maxHeaderCount).append("]");
        return builder.toString();
    }

    public static MessageConstraints lineLen(int max) {
        return new MessageConstraints(Args.notNegative(max, "Max line length"), -1);
    }

    public static Builder custom() {
        return new Builder();
    }

    public static Builder copy(MessageConstraints config) {
        Args.notNull(config, "Message constraints");
        return new Builder().setMaxHeaderCount(config.getMaxHeaderCount()).setMaxLineLength(config.getMaxLineLength());
    }

    public static class Builder {
        private int maxLineLength = -1;
        private int maxHeaderCount = -1;

        Builder() {
        }

        public Builder setMaxLineLength(int maxLineLength) {
            this.maxLineLength = maxLineLength;
            return this;
        }

        public Builder setMaxHeaderCount(int maxHeaderCount) {
            this.maxHeaderCount = maxHeaderCount;
            return this;
        }

        public MessageConstraints build() {
            return new MessageConstraints(this.maxLineLength, this.maxHeaderCount);
        }
    }
}
