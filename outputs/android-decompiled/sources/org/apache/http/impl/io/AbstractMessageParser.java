package org.apache.http.impl.io;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.ParseException;
import org.apache.http.ProtocolException;
import org.apache.http.config.MessageConstraints;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class AbstractMessageParser<T extends HttpMessage> implements HttpMessageParser<T> {
    private static final int HEADERS = 1;
    private static final int HEAD_LINE = 0;
    private final List<CharArrayBuffer> headerLines;
    protected final LineParser lineParser;
    private T message;
    private final MessageConstraints messageConstraints;
    private final SessionInputBuffer sessionBuffer;
    private int state;

    protected abstract T parseHead(SessionInputBuffer sessionInputBuffer) throws HttpException, ParseException, IOException;

    @Deprecated
    public AbstractMessageParser(SessionInputBuffer buffer, LineParser parser, HttpParams params) {
        Args.notNull(buffer, "Session input buffer");
        Args.notNull(params, "HTTP parameters");
        this.sessionBuffer = buffer;
        this.messageConstraints = HttpParamConfig.getMessageConstraints(params);
        this.lineParser = parser == null ? BasicLineParser.INSTANCE : parser;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public AbstractMessageParser(SessionInputBuffer buffer, LineParser lineParser, MessageConstraints constraints) {
        this.sessionBuffer = (SessionInputBuffer) Args.notNull(buffer, "Session input buffer");
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.messageConstraints = constraints == null ? MessageConstraints.DEFAULT : constraints;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public static Header[] parseHeaders(SessionInputBuffer inBuffer, int maxHeaderCount, int maxLineLen, LineParser parser) throws HttpException, IOException {
        List<CharArrayBuffer> headerLines = new ArrayList<>();
        if (parser == null) {
            parser = BasicLineParser.INSTANCE;
        }
        return parseHeaders(inBuffer, maxHeaderCount, maxLineLen, parser, headerLines);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0033, code lost:
    
        if (r5 >= r14.size()) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0035, code lost:
    
        r0 = r14.get(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x003b, code lost:
    
        r4[r5] = r13.parseHeader(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0041, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00ad, code lost:
    
        r3 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b7, code lost:
    
        throw new org.apache.http.ProtocolException(r3.getMessage());
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00b8, code lost:
    
        return r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0028, code lost:
    
        r4 = new org.apache.http.Header[r14.size()];
        r5 = 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static org.apache.http.Header[] parseHeaders(org.apache.http.io.SessionInputBuffer r10, int r11, int r12, org.apache.http.message.LineParser r13, java.util.List<org.apache.http.util.CharArrayBuffer> r14) throws org.apache.http.HttpException, java.io.IOException {
        /*
            java.lang.String r8 = "Session input buffer"
            org.apache.http.util.Args.notNull(r10, r8)
            java.lang.String r8 = "Line parser"
            org.apache.http.util.Args.notNull(r13, r8)
            java.lang.String r8 = "Header line list"
            org.apache.http.util.Args.notNull(r14, r8)
            r2 = 0
            r6 = 0
        L11:
            if (r2 != 0) goto L44
            org.apache.http.util.CharArrayBuffer r2 = new org.apache.http.util.CharArrayBuffer
            r8 = 64
            r2.<init>(r8)
        L1a:
            int r7 = r10.readLine(r2)
            r8 = -1
            if (r7 == r8) goto L28
            int r8 = r2.length()
            r9 = 1
            if (r8 >= r9) goto L48
        L28:
            int r8 = r14.size()
            org.apache.http.Header[] r4 = new org.apache.http.Header[r8]
            r5 = 0
        L2f:
            int r8 = r14.size()
            if (r5 >= r8) goto Lb8
            java.lang.Object r0 = r14.get(r5)
            org.apache.http.util.CharArrayBuffer r0 = (org.apache.http.util.CharArrayBuffer) r0
            org.apache.http.Header r8 = r13.parseHeader(r0)     // Catch: org.apache.http.ParseException -> Lad
            r4[r5] = r8     // Catch: org.apache.http.ParseException -> Lad
            int r5 = r5 + 1
            goto L2f
        L44:
            r2.clear()
            goto L1a
        L48:
            r8 = 0
            char r8 = r2.charAt(r8)
            r9 = 32
            if (r8 == r9) goto L5a
            r8 = 0
            char r8 = r2.charAt(r8)
            r9 = 9
            if (r8 != r9) goto La7
        L5a:
            if (r6 == 0) goto La7
            r5 = 0
        L5d:
            int r8 = r2.length()
            if (r5 >= r8) goto L6f
            char r1 = r2.charAt(r5)
            r8 = 32
            if (r1 == r8) goto L87
            r8 = 9
            if (r1 == r8) goto L87
        L6f:
            if (r12 <= 0) goto L8a
            int r8 = r6.length()
            int r8 = r8 + 1
            int r9 = r2.length()
            int r8 = r8 + r9
            int r8 = r8 - r5
            if (r8 <= r12) goto L8a
            org.apache.http.MessageConstraintException r8 = new org.apache.http.MessageConstraintException
            java.lang.String r9 = "Maximum line length limit exceeded"
            r8.<init>(r9)
            throw r8
        L87:
            int r5 = r5 + 1
            goto L5d
        L8a:
            r8 = 32
            r6.append(r8)
            int r8 = r2.length()
            int r8 = r8 - r5
            r6.append(r2, r5, r8)
        L97:
            if (r11 <= 0) goto L11
            int r8 = r14.size()
            if (r8 < r11) goto L11
            org.apache.http.MessageConstraintException r8 = new org.apache.http.MessageConstraintException
            java.lang.String r9 = "Maximum header count exceeded"
            r8.<init>(r9)
            throw r8
        La7:
            r14.add(r2)
            r6 = r2
            r2 = 0
            goto L97
        Lad:
            r3 = move-exception
            org.apache.http.ProtocolException r8 = new org.apache.http.ProtocolException
            java.lang.String r9 = r3.getMessage()
            r8.<init>(r9)
            throw r8
        Lb8:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.io.AbstractMessageParser.parseHeaders(org.apache.http.io.SessionInputBuffer, int, int, org.apache.http.message.LineParser, java.util.List):org.apache.http.Header[]");
    }

    @Override // org.apache.http.io.HttpMessageParser
    public T parse() throws HttpException, IOException {
        switch (this.state) {
            case 0:
                try {
                    this.message = (T) parseHead(this.sessionBuffer);
                    this.state = 1;
                    break;
                } catch (ParseException e) {
                    throw new ProtocolException(e.getMessage(), e);
                }
            case 1:
                break;
            default:
                throw new IllegalStateException("Inconsistent parser state");
        }
        this.message.setHeaders(parseHeaders(this.sessionBuffer, this.messageConstraints.getMaxHeaderCount(), this.messageConstraints.getMaxLineLength(), this.lineParser, this.headerLines));
        T t = this.message;
        this.message = null;
        this.headerLines.clear();
        this.state = 0;
        return t;
    }
}
