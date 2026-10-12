package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.ClientProtocolException;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import cz.msebera.android.httpclient.message.BasicHeader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class ResponseProtocolCompliance {
    private static final String UNEXPECTED_100_CONTINUE = "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue.";
    private static final String UNEXPECTED_PARTIAL_CONTENT = "partial content was returned for a request that did not ask for it";

    ResponseProtocolCompliance() {
    }

    public void ensureProtocolCompliance(HttpRequestWrapper request, HttpResponse response) throws IOException {
        if (backendResponseMustNotHaveBody(request, response)) {
            consumeBody(response);
            response.setEntity(null);
        }
        requestDidNotExpect100ContinueButResponseIsOne(request, response);
        transferEncodingIsNotReturnedTo1_0Client(request, response);
        ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(request, response);
        ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(request, response);
        ensure206ContainsDateHeader(response);
        ensure304DoesNotContainExtraEntityHeaders(response);
        identityIsNotUsedInContentEncoding(response);
        warningsWithNonMatchingWarnDatesAreRemoved(response);
    }

    private void consumeBody(HttpResponse response) throws IOException {
        HttpEntity body = response.getEntity();
        if (body != null) {
            IOUtils.consume(body);
        }
    }

    private void warningsWithNonMatchingWarnDatesAreRemoved(HttpResponse response) {
        Header[] warningHeaders;
        Date responseDate = DateUtils.parseDate(response.getFirstHeader("Date").getValue());
        if (responseDate != null && (warningHeaders = response.getHeaders("Warning")) != null && warningHeaders.length != 0) {
            List<Header> newWarningHeaders = new ArrayList<>();
            boolean modified = false;
            for (Header h : warningHeaders) {
                for (WarningValue wv : WarningValue.getWarningValues(h)) {
                    Date warnDate = wv.getWarnDate();
                    if (warnDate == null || warnDate.equals(responseDate)) {
                        newWarningHeaders.add(new BasicHeader("Warning", wv.toString()));
                    } else {
                        modified = true;
                    }
                }
            }
            if (modified) {
                response.removeHeaders("Warning");
                for (Header h2 : newWarningHeaders) {
                    response.addHeader(h2);
                }
            }
        }
    }

    private void identityIsNotUsedInContentEncoding(HttpResponse response) throws ParseException {
        Header[] hdrs = response.getHeaders("Content-Encoding");
        if (hdrs != null && hdrs.length != 0) {
            List<Header> newHeaders = new ArrayList<>();
            boolean modified = false;
            for (Header h : hdrs) {
                StringBuilder buf = new StringBuilder();
                boolean first = true;
                for (HeaderElement elt : h.getElements()) {
                    if ("identity".equalsIgnoreCase(elt.getName())) {
                        modified = true;
                    } else {
                        if (!first) {
                            buf.append(",");
                        }
                        buf.append(elt.toString());
                        first = false;
                    }
                }
                String newHeaderValue = buf.toString();
                if (!"".equals(newHeaderValue)) {
                    newHeaders.add(new BasicHeader("Content-Encoding", newHeaderValue));
                }
            }
            if (modified) {
                response.removeHeaders("Content-Encoding");
                for (Header h2 : newHeaders) {
                    response.addHeader(h2);
                }
            }
        }
    }

    private void ensure206ContainsDateHeader(HttpResponse response) {
        if (response.getFirstHeader("Date") == null) {
            response.addHeader("Date", DateUtils.formatDate(new Date()));
        }
    }

    private void ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(HttpRequest request, HttpResponse response) throws IOException {
        if (request.getFirstHeader("Range") != null || response.getStatusLine().getStatusCode() != 206) {
            return;
        }
        consumeBody(response);
        throw new ClientProtocolException(UNEXPECTED_PARTIAL_CONTENT);
    }

    private void ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(HttpRequest request, HttpResponse response) {
        if (request.getRequestLine().getMethod().equalsIgnoreCase("OPTIONS") && response.getStatusLine().getStatusCode() == 200 && response.getFirstHeader("Content-Length") == null) {
            response.addHeader("Content-Length", "0");
        }
    }

    private void ensure304DoesNotContainExtraEntityHeaders(HttpResponse response) {
        String[] disallowedEntityHeaders = {"Allow", "Content-Encoding", "Content-Language", "Content-Length", "Content-MD5", "Content-Range", "Content-Type", "Last-Modified"};
        if (response.getStatusLine().getStatusCode() == 304) {
            for (String hdr : disallowedEntityHeaders) {
                response.removeHeaders(hdr);
            }
        }
    }

    private boolean backendResponseMustNotHaveBody(HttpRequest request, HttpResponse backendResponse) {
        return "HEAD".equals(request.getRequestLine().getMethod()) || backendResponse.getStatusLine().getStatusCode() == 204 || backendResponse.getStatusLine().getStatusCode() == 205 || backendResponse.getStatusLine().getStatusCode() == 304;
    }

    private void requestDidNotExpect100ContinueButResponseIsOne(HttpRequestWrapper request, HttpResponse response) throws IOException {
        if (response.getStatusLine().getStatusCode() == 100) {
            HttpRequest originalRequest = request.getOriginal();
            if ((originalRequest instanceof HttpEntityEnclosingRequest) && ((HttpEntityEnclosingRequest) originalRequest).expectContinue()) {
                return;
            }
            consumeBody(response);
            throw new ClientProtocolException(UNEXPECTED_100_CONTINUE);
        }
    }

    private void transferEncodingIsNotReturnedTo1_0Client(HttpRequestWrapper request, HttpResponse response) {
        HttpRequest originalRequest = request.getOriginal();
        if (originalRequest.getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) < 0) {
            removeResponseTransferEncoding(response);
        }
    }

    private void removeResponseTransferEncoding(HttpResponse response) {
        response.removeHeaders("TE");
        response.removeHeaders("Transfer-Encoding");
    }
}
