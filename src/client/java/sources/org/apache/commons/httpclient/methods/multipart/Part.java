package org.apache.commons.httpclient.methods.multipart;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.httpclient.util.EncodingUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class Part {
    protected static final String BOUNDARY = "----------------314159265358979323846";
    protected static final byte[] BOUNDARY_BYTES;
    protected static final String CHARSET = "; charset=";
    protected static final byte[] CHARSET_BYTES;
    protected static final String CONTENT_DISPOSITION = "Content-Disposition: form-data; name=";
    protected static final byte[] CONTENT_DISPOSITION_BYTES;
    protected static final String CONTENT_TRANSFER_ENCODING = "Content-Transfer-Encoding: ";
    protected static final byte[] CONTENT_TRANSFER_ENCODING_BYTES;
    protected static final String CONTENT_TYPE = "Content-Type: ";
    protected static final byte[] CONTENT_TYPE_BYTES;
    protected static final String CRLF = "\r\n";
    protected static final byte[] CRLF_BYTES;
    private static final byte[] DEFAULT_BOUNDARY_BYTES;
    protected static final String EXTRA = "--";
    protected static final byte[] EXTRA_BYTES;
    private static final Log LOG;
    protected static final String QUOTE = "\"";
    protected static final byte[] QUOTE_BYTES;
    static Class class$org$apache$commons$httpclient$methods$multipart$Part;
    private byte[] boundaryBytes;

    public abstract String getCharSet();

    public abstract String getContentType();

    public abstract String getName();

    public abstract String getTransferEncoding();

    protected abstract long lengthOfData() throws IOException;

    protected abstract void sendData(OutputStream outputStream) throws IOException;

    static {
        Class clsClass$;
        if (class$org$apache$commons$httpclient$methods$multipart$Part == null) {
            clsClass$ = class$("org.apache.commons.httpclient.methods.multipart.Part");
            class$org$apache$commons$httpclient$methods$multipart$Part = clsClass$;
        } else {
            clsClass$ = class$org$apache$commons$httpclient$methods$multipart$Part;
        }
        LOG = LogFactory.getLog(clsClass$);
        BOUNDARY_BYTES = EncodingUtil.getAsciiBytes(BOUNDARY);
        DEFAULT_BOUNDARY_BYTES = BOUNDARY_BYTES;
        CRLF_BYTES = EncodingUtil.getAsciiBytes(CRLF);
        QUOTE_BYTES = EncodingUtil.getAsciiBytes(QUOTE);
        EXTRA_BYTES = EncodingUtil.getAsciiBytes(EXTRA);
        CONTENT_DISPOSITION_BYTES = EncodingUtil.getAsciiBytes(CONTENT_DISPOSITION);
        CONTENT_TYPE_BYTES = EncodingUtil.getAsciiBytes(CONTENT_TYPE);
        CHARSET_BYTES = EncodingUtil.getAsciiBytes("; charset=");
        CONTENT_TRANSFER_ENCODING_BYTES = EncodingUtil.getAsciiBytes(CONTENT_TRANSFER_ENCODING);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public static String getBoundary() {
        return BOUNDARY;
    }

    protected byte[] getPartBoundary() {
        return this.boundaryBytes == null ? DEFAULT_BOUNDARY_BYTES : this.boundaryBytes;
    }

    void setPartBoundary(byte[] boundaryBytes) {
        this.boundaryBytes = boundaryBytes;
    }

    public boolean isRepeatable() {
        return true;
    }

    protected void sendStart(OutputStream out) throws IOException {
        LOG.trace("enter sendStart(OutputStream out)");
        out.write(EXTRA_BYTES);
        out.write(getPartBoundary());
        out.write(CRLF_BYTES);
    }

    protected void sendDispositionHeader(OutputStream out) throws IOException {
        LOG.trace("enter sendDispositionHeader(OutputStream out)");
        out.write(CONTENT_DISPOSITION_BYTES);
        out.write(QUOTE_BYTES);
        out.write(EncodingUtil.getAsciiBytes(getName()));
        out.write(QUOTE_BYTES);
    }

    protected void sendContentTypeHeader(OutputStream out) throws IOException {
        LOG.trace("enter sendContentTypeHeader(OutputStream out)");
        String contentType = getContentType();
        if (contentType != null) {
            out.write(CRLF_BYTES);
            out.write(CONTENT_TYPE_BYTES);
            out.write(EncodingUtil.getAsciiBytes(contentType));
            String charSet = getCharSet();
            if (charSet != null) {
                out.write(CHARSET_BYTES);
                out.write(EncodingUtil.getAsciiBytes(charSet));
            }
        }
    }

    protected void sendTransferEncodingHeader(OutputStream out) throws IOException {
        LOG.trace("enter sendTransferEncodingHeader(OutputStream out)");
        String transferEncoding = getTransferEncoding();
        if (transferEncoding != null) {
            out.write(CRLF_BYTES);
            out.write(CONTENT_TRANSFER_ENCODING_BYTES);
            out.write(EncodingUtil.getAsciiBytes(transferEncoding));
        }
    }

    protected void sendEndOfHeader(OutputStream out) throws IOException {
        LOG.trace("enter sendEndOfHeader(OutputStream out)");
        out.write(CRLF_BYTES);
        out.write(CRLF_BYTES);
    }

    protected void sendEnd(OutputStream out) throws IOException {
        LOG.trace("enter sendEnd(OutputStream out)");
        out.write(CRLF_BYTES);
    }

    public void send(OutputStream out) throws IOException {
        LOG.trace("enter send(OutputStream out)");
        sendStart(out);
        sendDispositionHeader(out);
        sendContentTypeHeader(out);
        sendTransferEncodingHeader(out);
        sendEndOfHeader(out);
        sendData(out);
        sendEnd(out);
    }

    public long length() throws IOException {
        LOG.trace("enter length()");
        if (lengthOfData() < 0) {
            return -1L;
        }
        ByteArrayOutputStream overhead = new ByteArrayOutputStream();
        sendStart(overhead);
        sendDispositionHeader(overhead);
        sendContentTypeHeader(overhead);
        sendTransferEncodingHeader(overhead);
        sendEndOfHeader(overhead);
        sendEnd(overhead);
        return overhead.size() + lengthOfData();
    }

    public String toString() {
        return getName();
    }

    public static void sendParts(OutputStream out, Part[] parts) throws IOException {
        sendParts(out, parts, DEFAULT_BOUNDARY_BYTES);
    }

    public static void sendParts(OutputStream out, Part[] parts, byte[] partBoundary) throws IOException {
        if (parts == null) {
            throw new IllegalArgumentException("Parts may not be null");
        }
        if (partBoundary == null || partBoundary.length == 0) {
            throw new IllegalArgumentException("partBoundary may not be empty");
        }
        for (int i = 0; i < parts.length; i++) {
            parts[i].setPartBoundary(partBoundary);
            parts[i].send(out);
        }
        out.write(EXTRA_BYTES);
        out.write(partBoundary);
        out.write(EXTRA_BYTES);
        out.write(CRLF_BYTES);
    }

    public static long getLengthOfParts(Part[] parts) throws IOException {
        return getLengthOfParts(parts, DEFAULT_BOUNDARY_BYTES);
    }

    public static long getLengthOfParts(Part[] parts, byte[] partBoundary) throws IOException {
        LOG.trace("getLengthOfParts(Parts[])");
        if (parts == null) {
            throw new IllegalArgumentException("Parts may not be null");
        }
        long total = 0;
        for (int i = 0; i < parts.length; i++) {
            parts[i].setPartBoundary(partBoundary);
            long l = parts[i].length();
            if (l < 0) {
                return -1L;
            }
            total += l;
        }
        return total + EXTRA_BYTES.length + partBoundary.length + EXTRA_BYTES.length + CRLF_BYTES.length;
    }
}
