package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HeaderConstants;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import java.util.Date;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CachedResponseSuitabilityChecker {
    private final float heuristicCoefficient;
    private final long heuristicDefaultLifetime;
    public HttpClientAndroidLog log;
    private final boolean sharedCache;
    private final boolean useHeuristicCaching;
    private final CacheValidityPolicy validityStrategy;

    CachedResponseSuitabilityChecker(CacheValidityPolicy validityStrategy, CacheConfig config) {
        this.log = new HttpClientAndroidLog(getClass());
        this.validityStrategy = validityStrategy;
        this.sharedCache = config.isSharedCache();
        this.useHeuristicCaching = config.isHeuristicCachingEnabled();
        this.heuristicCoefficient = config.getHeuristicCoefficient();
        this.heuristicDefaultLifetime = config.getHeuristicDefaultLifetime();
    }

    CachedResponseSuitabilityChecker(CacheConfig config) {
        this(new CacheValidityPolicy(), config);
    }

    private boolean isFreshEnough(HttpCacheEntry entry, HttpRequest request, Date now) throws ParseException, NumberFormatException {
        if (this.validityStrategy.isResponseFresh(entry, now)) {
            return true;
        }
        if (this.useHeuristicCaching && this.validityStrategy.isResponseHeuristicallyFresh(entry, now, this.heuristicCoefficient, this.heuristicDefaultLifetime)) {
            return true;
        }
        if (originInsistsOnFreshness(entry)) {
            return false;
        }
        long maxstale = getMaxStale(request);
        if (maxstale == -1) {
            return false;
        }
        return maxstale > this.validityStrategy.getStalenessSecs(entry, now);
    }

    private boolean originInsistsOnFreshness(HttpCacheEntry entry) {
        if (this.validityStrategy.mustRevalidate(entry)) {
            return true;
        }
        if (this.sharedCache) {
            return this.validityStrategy.proxyRevalidate(entry) || this.validityStrategy.hasCacheControlDirective(entry, "s-maxage");
        }
        return false;
    }

    private long getMaxStale(HttpRequest request) throws ParseException, NumberFormatException {
        long maxstale = -1;
        for (Header h : request.getHeaders("Cache-Control")) {
            for (HeaderElement elt : h.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_MAX_STALE.equals(elt.getName())) {
                    if ((elt.getValue() == null || "".equals(elt.getValue().trim())) && maxstale == -1) {
                        maxstale = Long.MAX_VALUE;
                    } else {
                        try {
                            long val = Long.parseLong(elt.getValue());
                            if (val < 0) {
                                val = 0;
                            }
                            if (maxstale == -1 || val < maxstale) {
                                maxstale = val;
                            }
                        } catch (NumberFormatException e) {
                            maxstale = 0;
                        }
                    }
                }
            }
        }
        return maxstale;
    }

    public boolean canCachedResponseBeUsed(HttpHost host, HttpRequest request, HttpCacheEntry entry, Date now) throws ParseException, NumberFormatException {
        if (!isFreshEnough(entry, request, now)) {
            this.log.trace("Cache entry was not fresh enough");
            return false;
        }
        if (isGet(request) && !this.validityStrategy.contentLengthHeaderMatchesActualLength(entry)) {
            this.log.debug("Cache entry Content-Length and header information do not match");
            return false;
        }
        if (hasUnsupportedConditionalHeaders(request)) {
            this.log.debug("Request contained conditional headers we don't handle");
            return false;
        }
        if (!isConditional(request) && entry.getStatusCode() == 304) {
            return false;
        }
        if (isConditional(request) && !allConditionalsMatch(request, entry, now)) {
            return false;
        }
        if (hasUnsupportedCacheEntryForGet(request, entry)) {
            this.log.debug("HEAD response caching enabled but the cache entry does not contain a request method, entity or a 204 response");
            return false;
        }
        Header[] headers = request.getHeaders("Cache-Control");
        int length = headers.length;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < length) {
                Header ccHdr = headers[i2];
                for (HeaderElement elt : ccHdr.getElements()) {
                    if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equals(elt.getName())) {
                        this.log.trace("Response contained NO CACHE directive, cache was not suitable");
                        return false;
                    }
                    if (HeaderConstants.CACHE_CONTROL_NO_STORE.equals(elt.getName())) {
                        this.log.trace("Response contained NO STORE directive, cache was not suitable");
                        return false;
                    }
                    if ("max-age".equals(elt.getName())) {
                        try {
                            int maxage = Integer.parseInt(elt.getValue());
                            if (this.validityStrategy.getCurrentAgeSecs(entry, now) > maxage) {
                                this.log.trace("Response from cache was NOT suitable due to max age");
                                return false;
                            }
                        } catch (NumberFormatException ex) {
                            this.log.debug("Response from cache was malformed" + ex.getMessage());
                            return false;
                        }
                    }
                    if (HeaderConstants.CACHE_CONTROL_MAX_STALE.equals(elt.getName())) {
                        try {
                            int maxstale = Integer.parseInt(elt.getValue());
                            if (this.validityStrategy.getFreshnessLifetimeSecs(entry) > maxstale) {
                                this.log.trace("Response from cache was not suitable due to Max stale freshness");
                                return false;
                            }
                        } catch (NumberFormatException ex2) {
                            this.log.debug("Response from cache was malformed: " + ex2.getMessage());
                            return false;
                        }
                    }
                    if (HeaderConstants.CACHE_CONTROL_MIN_FRESH.equals(elt.getName())) {
                        try {
                            long minfresh = Long.parseLong(elt.getValue());
                            if (minfresh < 0) {
                                return false;
                            }
                            long age = this.validityStrategy.getCurrentAgeSecs(entry, now);
                            long freshness = this.validityStrategy.getFreshnessLifetimeSecs(entry);
                            if (freshness - age < minfresh) {
                                this.log.trace("Response from cache was not suitable due to min fresh freshness requirement");
                                return false;
                            }
                        } catch (NumberFormatException ex3) {
                            this.log.debug("Response from cache was malformed: " + ex3.getMessage());
                            return false;
                        }
                    }
                }
                i = i2 + 1;
            } else {
                this.log.trace("Response from cache was suitable");
                return true;
            }
        }
    }

    private boolean isGet(HttpRequest request) {
        return request.getRequestLine().getMethod().equals("GET");
    }

    private boolean entryIsNotA204Response(HttpCacheEntry entry) {
        return entry.getStatusCode() != 204;
    }

    private boolean cacheEntryDoesNotContainMethodAndEntity(HttpCacheEntry entry) {
        return entry.getRequestMethod() == null && entry.getResource() == null;
    }

    private boolean hasUnsupportedCacheEntryForGet(HttpRequest request, HttpCacheEntry entry) {
        return isGet(request) && cacheEntryDoesNotContainMethodAndEntity(entry) && entryIsNotA204Response(entry);
    }

    public boolean isConditional(HttpRequest request) {
        return hasSupportedEtagValidator(request) || hasSupportedLastModifiedValidator(request);
    }

    public boolean allConditionalsMatch(HttpRequest request, HttpCacheEntry entry, Date now) {
        boolean hasEtagValidator = hasSupportedEtagValidator(request);
        boolean hasLastModifiedValidator = hasSupportedLastModifiedValidator(request);
        boolean etagValidatorMatches = hasEtagValidator && etagValidatorMatches(request, entry);
        boolean lastModifiedValidatorMatches = hasLastModifiedValidator && lastModifiedValidatorMatches(request, entry, now);
        if (hasEtagValidator && hasLastModifiedValidator && (!etagValidatorMatches || !lastModifiedValidatorMatches)) {
            return false;
        }
        if (!hasEtagValidator || etagValidatorMatches) {
            return !hasLastModifiedValidator || lastModifiedValidatorMatches;
        }
        return false;
    }

    private boolean hasUnsupportedConditionalHeaders(HttpRequest request) {
        return (request.getFirstHeader("If-Range") == null && request.getFirstHeader("If-Match") == null && !hasValidDateField(request, "If-Unmodified-Since")) ? false : true;
    }

    private boolean hasSupportedEtagValidator(HttpRequest request) {
        return request.containsHeader("If-None-Match");
    }

    private boolean hasSupportedLastModifiedValidator(HttpRequest request) {
        return hasValidDateField(request, "If-Modified-Since");
    }

    private boolean etagValidatorMatches(HttpRequest request, HttpCacheEntry entry) throws ParseException {
        Header etagHeader = entry.getFirstHeader("ETag");
        String etag = etagHeader != null ? etagHeader.getValue() : null;
        Header[] ifNoneMatch = request.getHeaders("If-None-Match");
        if (ifNoneMatch == null) {
            return false;
        }
        for (Header h : ifNoneMatch) {
            for (HeaderElement elt : h.getElements()) {
                String reqEtag = elt.toString();
                if (("*".equals(reqEtag) && etag != null) || reqEtag.equals(etag)) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean lastModifiedValidatorMatches(HttpRequest request, HttpCacheEntry entry, Date now) {
        Header lastModifiedHeader = entry.getFirstHeader("Last-Modified");
        Date lastModified = null;
        if (lastModifiedHeader != null) {
            lastModified = DateUtils.parseDate(lastModifiedHeader.getValue());
        }
        if (lastModified == null) {
            return false;
        }
        for (Header h : request.getHeaders("If-Modified-Since")) {
            Date ifModifiedSince = DateUtils.parseDate(h.getValue());
            if (ifModifiedSince != null && (ifModifiedSince.after(now) || lastModified.after(ifModifiedSince))) {
                return false;
            }
        }
        return true;
    }

    private boolean hasValidDateField(HttpRequest request, String headerName) {
        Header[] headers = request.getHeaders(headerName);
        if (0 >= headers.length) {
            return false;
        }
        Header h = headers[0];
        Date date = DateUtils.parseDate(h.getValue());
        return date != null;
    }
}
