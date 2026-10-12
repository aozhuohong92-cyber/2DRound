package org.apache.commons.httpclient;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.httpclient.util.EncodingUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class HttpParser {
    private static final Log LOG;
    static Class class$org$apache$commons$httpclient$HttpParser;

    static {
        Class clsClass$;
        if (class$org$apache$commons$httpclient$HttpParser == null) {
            clsClass$ = class$("org.apache.commons.httpclient.HttpParser");
            class$org$apache$commons$httpclient$HttpParser = clsClass$;
        } else {
            clsClass$ = class$org$apache$commons$httpclient$HttpParser;
        }
        LOG = LogFactory.getLog(clsClass$);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private HttpParser() {
    }

    public static byte[] readRawLine(InputStream inputStream) throws IOException {
        int ch;
        LOG.trace("enter HttpParser.readRawLine()");
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        do {
            ch = inputStream.read();
            if (ch < 0) {
                break;
            }
            buf.write(ch);
        } while (ch != 10);
        if (buf.size() == 0) {
            return null;
        }
        return buf.toByteArray();
    }

    public static String readLine(InputStream inputStream, String charset) throws IOException {
        LOG.trace("enter HttpParser.readLine(InputStream, String)");
        byte[] rawdata = readRawLine(inputStream);
        if (rawdata == null) {
            return null;
        }
        int len = rawdata.length;
        int offset = 0;
        if (len > 0 && rawdata[len - 1] == 10) {
            offset = 0 + 1;
            if (len > 1 && rawdata[len - 2] == 13) {
                offset++;
            }
        }
        String result = EncodingUtil.getString(rawdata, 0, len - offset, charset);
        if (Wire.HEADER_WIRE.enabled()) {
            String logoutput = result;
            if (offset == 2) {
                logoutput = new StringBuffer().append(result).append("\r\n").toString();
            } else if (offset == 1) {
                logoutput = new StringBuffer().append(result).append("\n").toString();
            }
            Wire.HEADER_WIRE.input(logoutput);
            return result;
        }
        return result;
    }

    public static String readLine(InputStream inputStream) throws IOException {
        LOG.trace("enter HttpParser.readLine(InputStream)");
        return readLine(inputStream, "US-ASCII");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x003e, code lost:
    
        return (org.apache.commons.httpclient.Header[]) r1.toArray(new org.apache.commons.httpclient.Header[r1.size()]);
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0022, code lost:
    
        if (r3 == null) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0024, code lost:
    
        r1.add(new org.apache.commons.httpclient.Header(r3, r4.toString()));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static org.apache.commons.httpclient.Header[] parseHeaders(java.io.InputStream r9, java.lang.String r10) throws java.io.IOException {
        /*
            r8 = 32
            r7 = 0
            org.apache.commons.logging.Log r5 = org.apache.commons.httpclient.HttpParser.LOG
            java.lang.String r6 = "enter HeaderParser.parseHeaders(InputStream, String)"
            r5.trace(r6)
            java.util.ArrayList r1 = new java.util.ArrayList
            r1.<init>()
            r3 = 0
            r4 = 0
        L11:
            java.lang.String r2 = readLine(r9, r10)
            if (r2 == 0) goto L22
            java.lang.String r5 = r2.trim()
            int r5 = r5.length()
            r6 = 1
            if (r5 >= r6) goto L3f
        L22:
            if (r3 == 0) goto L30
            org.apache.commons.httpclient.Header r5 = new org.apache.commons.httpclient.Header
            java.lang.String r6 = r4.toString()
            r5.<init>(r3, r6)
            r1.add(r5)
        L30:
            int r5 = r1.size()
            org.apache.commons.httpclient.Header[] r5 = new org.apache.commons.httpclient.Header[r5]
            java.lang.Object[] r5 = r1.toArray(r5)
            org.apache.commons.httpclient.Header[] r5 = (org.apache.commons.httpclient.Header[]) r5
            org.apache.commons.httpclient.Header[] r5 = (org.apache.commons.httpclient.Header[]) r5
            return r5
        L3f:
            char r5 = r2.charAt(r7)
            if (r5 == r8) goto L4d
            char r5 = r2.charAt(r7)
            r6 = 9
            if (r5 != r6) goto L5a
        L4d:
            if (r4 == 0) goto L11
            r4.append(r8)
            java.lang.String r5 = r2.trim()
            r4.append(r5)
            goto L11
        L5a:
            if (r3 == 0) goto L68
            org.apache.commons.httpclient.Header r5 = new org.apache.commons.httpclient.Header
            java.lang.String r6 = r4.toString()
            r5.<init>(r3, r6)
            r1.add(r5)
        L68:
            java.lang.String r5 = ":"
            int r0 = r2.indexOf(r5)
            if (r0 >= 0) goto L89
            org.apache.commons.httpclient.ProtocolException r5 = new org.apache.commons.httpclient.ProtocolException
            java.lang.StringBuffer r6 = new java.lang.StringBuffer
            r6.<init>()
            java.lang.String r7 = "Unable to parse header: "
            java.lang.StringBuffer r6 = r6.append(r7)
            java.lang.StringBuffer r6 = r6.append(r2)
            java.lang.String r6 = r6.toString()
            r5.<init>(r6)
            throw r5
        L89:
            java.lang.String r5 = r2.substring(r7, r0)
            java.lang.String r3 = r5.trim()
            java.lang.StringBuffer r4 = new java.lang.StringBuffer
            int r5 = r0 + 1
            java.lang.String r5 = r2.substring(r5)
            java.lang.String r5 = r5.trim()
            r4.<init>(r5)
            goto L11
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.httpclient.HttpParser.parseHeaders(java.io.InputStream, java.lang.String):org.apache.commons.httpclient.Header[]");
    }

    public static Header[] parseHeaders(InputStream is) throws IOException {
        LOG.trace("enter HeaderParser.parseHeaders(InputStream, String)");
        return parseHeaders(is, "US-ASCII");
    }
}
