package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.cache.HttpCacheInvalidator;
import cz.msebera.android.httpclient.client.cache.HttpCacheStorage;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CacheInvalidator implements HttpCacheInvalidator {
    private final CacheKeyGenerator cacheKeyGenerator;
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final HttpCacheStorage storage;

    public CacheInvalidator(CacheKeyGenerator uriExtractor, HttpCacheStorage storage) {
        this.cacheKeyGenerator = uriExtractor;
        this.storage = storage;
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheInvalidator
    public void flushInvalidatedCacheEntries(HttpHost host, HttpRequest req) {
        String theUri = this.cacheKeyGenerator.getURI(host, req);
        HttpCacheEntry parent = getEntry(theUri);
        if (requestShouldNotBeCached(req) || shouldInvalidateHeadCacheEntry(req, parent)) {
            this.log.debug("Invalidating parent cache entry: " + parent);
            if (parent != null) {
                for (String variantURI : parent.getVariantMap().values()) {
                    flushEntry(variantURI);
                }
                flushEntry(theUri);
            }
            URL reqURL = getAbsoluteURL(theUri);
            if (reqURL == null) {
                this.log.error("Couldn't transform request into valid URL");
                return;
            }
            Header clHdr = req.getFirstHeader("Content-Location");
            if (clHdr != null) {
                String contentLocation = clHdr.getValue();
                if (!flushAbsoluteUriFromSameHost(reqURL, contentLocation)) {
                    flushRelativeUriFromSameHost(reqURL, contentLocation);
                }
            }
            Header lHdr = req.getFirstHeader("Location");
            if (lHdr != null) {
                flushAbsoluteUriFromSameHost(reqURL, lHdr.getValue());
            }
        }
    }

    private boolean shouldInvalidateHeadCacheEntry(HttpRequest req, HttpCacheEntry parentCacheEntry) {
        return requestIsGet(req) && isAHeadCacheEntry(parentCacheEntry);
    }

    private boolean requestIsGet(HttpRequest req) {
        return req.getRequestLine().getMethod().equals("GET");
    }

    private boolean isAHeadCacheEntry(HttpCacheEntry parentCacheEntry) {
        return parentCacheEntry != null && parentCacheEntry.getRequestMethod().equals("HEAD");
    }

    private void flushEntry(String uri) {
        try {
            this.storage.removeEntry(uri);
        } catch (IOException ioe) {
            this.log.warn("unable to flush cache entry", ioe);
        }
    }

    private HttpCacheEntry getEntry(String theUri) {
        try {
            return this.storage.getEntry(theUri);
        } catch (IOException ioe) {
            this.log.warn("could not retrieve entry from storage", ioe);
            return null;
        }
    }

    protected void flushUriIfSameHost(URL requestURL, URL targetURL) {
        URL canonicalTarget = getAbsoluteURL(this.cacheKeyGenerator.canonicalizeUri(targetURL.toString()));
        if (canonicalTarget != null && canonicalTarget.getAuthority().equalsIgnoreCase(requestURL.getAuthority())) {
            flushEntry(canonicalTarget.toString());
        }
    }

    protected void flushRelativeUriFromSameHost(URL reqURL, String relUri) {
        URL relURL = getRelativeURL(reqURL, relUri);
        if (relURL != null) {
            flushUriIfSameHost(reqURL, relURL);
        }
    }

    protected boolean flushAbsoluteUriFromSameHost(URL reqURL, String uri) {
        URL absURL = getAbsoluteURL(uri);
        if (absURL == null) {
            return false;
        }
        flushUriIfSameHost(reqURL, absURL);
        return true;
    }

    private URL getAbsoluteURL(String uri) {
        try {
            URL absURL = new URL(uri);
            return absURL;
        } catch (MalformedURLException e) {
            return null;
        }
    }

    private URL getRelativeURL(URL reqURL, String relUri) {
        try {
            URL relURL = new URL(reqURL, relUri);
            return relURL;
        } catch (MalformedURLException e) {
            return null;
        }
    }

    protected boolean requestShouldNotBeCached(HttpRequest req) {
        String method = req.getRequestLine().getMethod();
        return notGetOrHeadRequest(method);
    }

    private boolean notGetOrHeadRequest(String method) {
        return ("GET".equals(method) || "HEAD".equals(method)) ? false : true;
    }

    @Override // cz.msebera.android.httpclient.client.cache.HttpCacheInvalidator
    public void flushInvalidatedCacheEntries(HttpHost host, HttpRequest request, HttpResponse response) {
        URL reqURL;
        int status = response.getStatusLine().getStatusCode();
        if (status >= 200 && status <= 299 && (reqURL = getAbsoluteURL(this.cacheKeyGenerator.getURI(host, request))) != null) {
            URL contentLocation = getContentLocationURL(reqURL, response);
            if (contentLocation != null) {
                flushLocationCacheEntry(reqURL, response, contentLocation);
            }
            URL location = getLocationURL(reqURL, response);
            if (location != null) {
                flushLocationCacheEntry(reqURL, response, location);
            }
        }
    }

    private void flushLocationCacheEntry(URL reqURL, HttpResponse response, URL location) {
        String cacheKey = this.cacheKeyGenerator.canonicalizeUri(location.toString());
        HttpCacheEntry entry = getEntry(cacheKey);
        if (entry != null && !responseDateOlderThanEntryDate(response, entry) && responseAndEntryEtagsDiffer(response, entry)) {
            flushUriIfSameHost(reqURL, location);
        }
    }

    private URL getContentLocationURL(URL reqURL, HttpResponse response) {
        Header clHeader = response.getFirstHeader("Content-Location");
        if (clHeader == null) {
            return null;
        }
        String contentLocation = clHeader.getValue();
        URL canonURL = getAbsoluteURL(contentLocation);
        return canonURL == null ? getRelativeURL(reqURL, contentLocation) : canonURL;
    }

    private URL getLocationURL(URL reqURL, HttpResponse response) {
        Header clHeader = response.getFirstHeader("Location");
        if (clHeader == null) {
            return null;
        }
        String location = clHeader.getValue();
        URL canonURL = getAbsoluteURL(location);
        return canonURL == null ? getRelativeURL(reqURL, location) : canonURL;
    }

    private boolean responseAndEntryEtagsDiffer(HttpResponse response, HttpCacheEntry entry) {
        Header entryEtag = entry.getFirstHeader("ETag");
        Header responseEtag = response.getFirstHeader("ETag");
        return (entryEtag == null || responseEtag == null || entryEtag.getValue().equals(responseEtag.getValue())) ? false : true;
    }

    private boolean responseDateOlderThanEntryDate(HttpResponse response, HttpCacheEntry entry) {
        Header entryDateHeader = entry.getFirstHeader("Date");
        Header responseDateHeader = response.getFirstHeader("Date");
        if (entryDateHeader == null || responseDateHeader == null) {
            return false;
        }
        Date entryDate = DateUtils.parseDate(entryDateHeader.getValue());
        Date responseDate = DateUtils.parseDate(responseDateHeader.getValue());
        if (entryDate == null || responseDate == null) {
            return false;
        }
        return responseDate.before(entryDate);
    }
}
