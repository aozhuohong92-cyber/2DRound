package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.HeaderConstants;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.utils.DateUtils;
import java.util.Date;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class CacheValidityPolicy {
    public static final long MAX_AGE = 2147483648L;

    CacheValidityPolicy() {
    }

    public long getCurrentAgeSecs(HttpCacheEntry entry, Date now) {
        return getCorrectedInitialAgeSecs(entry) + getResidentTimeSecs(entry, now);
    }

    public long getFreshnessLifetimeSecs(HttpCacheEntry entry) {
        Date expiry;
        long maxage = getMaxAge(entry);
        if (maxage <= -1) {
            Date dateValue = entry.getDate();
            if (dateValue != null && (expiry = getExpirationDate(entry)) != null) {
                long diff = expiry.getTime() - dateValue.getTime();
                return diff / 1000;
            }
            return 0L;
        }
        return maxage;
    }

    public boolean isResponseFresh(HttpCacheEntry entry, Date now) {
        return getCurrentAgeSecs(entry, now) < getFreshnessLifetimeSecs(entry);
    }

    public boolean isResponseHeuristicallyFresh(HttpCacheEntry entry, Date now, float coefficient, long defaultLifetime) {
        return getCurrentAgeSecs(entry, now) < getHeuristicFreshnessLifetimeSecs(entry, coefficient, defaultLifetime);
    }

    public long getHeuristicFreshnessLifetimeSecs(HttpCacheEntry entry, float coefficient, long defaultLifetime) {
        Date dateValue = entry.getDate();
        Date lastModifiedValue = getLastModifiedValue(entry);
        if (dateValue != null && lastModifiedValue != null) {
            long diff = dateValue.getTime() - lastModifiedValue.getTime();
            if (diff < 0) {
                return 0L;
            }
            return (long) ((diff / 1000) * coefficient);
        }
        return defaultLifetime;
    }

    public boolean isRevalidatable(HttpCacheEntry entry) {
        return (entry.getFirstHeader("ETag") == null && entry.getFirstHeader("Last-Modified") == null) ? false : true;
    }

    public boolean mustRevalidate(HttpCacheEntry entry) {
        return hasCacheControlDirective(entry, HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE);
    }

    public boolean proxyRevalidate(HttpCacheEntry entry) {
        return hasCacheControlDirective(entry, HeaderConstants.CACHE_CONTROL_PROXY_REVALIDATE);
    }

    public boolean mayReturnStaleWhileRevalidating(HttpCacheEntry entry, Date now) throws ParseException, NumberFormatException {
        for (Header h : entry.getHeaders("Cache-Control")) {
            for (HeaderElement elt : h.getElements()) {
                if (HeaderConstants.STALE_WHILE_REVALIDATE.equalsIgnoreCase(elt.getName())) {
                    try {
                        int allowedStalenessLifetime = Integer.parseInt(elt.getValue());
                        if (getStalenessSecs(entry, now) <= allowedStalenessLifetime) {
                            return true;
                        }
                    } catch (NumberFormatException e) {
                    }
                }
            }
        }
        return false;
    }

    public boolean mayReturnStaleIfError(HttpRequest request, HttpCacheEntry entry, Date now) {
        long stalenessSecs = getStalenessSecs(entry, now);
        return mayReturnStaleIfError(request.getHeaders("Cache-Control"), stalenessSecs) || mayReturnStaleIfError(entry.getHeaders("Cache-Control"), stalenessSecs);
    }

    private boolean mayReturnStaleIfError(Header[] headers, long stalenessSecs) throws ParseException, NumberFormatException {
        boolean result = false;
        for (Header h : headers) {
            HeaderElement[] elements = h.getElements();
            int length = elements.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    HeaderElement elt = elements[i];
                    if (HeaderConstants.STALE_IF_ERROR.equals(elt.getName())) {
                        try {
                            int staleIfErrorSecs = Integer.parseInt(elt.getValue());
                            if (stalenessSecs <= staleIfErrorSecs) {
                                result = true;
                                break;
                            }
                        } catch (NumberFormatException e) {
                        }
                    }
                    i++;
                }
            }
        }
        return result;
    }

    @Deprecated
    protected Date getDateValue(HttpCacheEntry entry) {
        return entry.getDate();
    }

    protected Date getLastModifiedValue(HttpCacheEntry entry) {
        Header dateHdr = entry.getFirstHeader("Last-Modified");
        if (dateHdr == null) {
            return null;
        }
        return DateUtils.parseDate(dateHdr.getValue());
    }

    protected long getContentLengthValue(HttpCacheEntry entry) {
        Header cl = entry.getFirstHeader("Content-Length");
        if (cl == null) {
            return -1L;
        }
        try {
            return Long.parseLong(cl.getValue());
        } catch (NumberFormatException e) {
            return -1L;
        }
    }

    protected boolean hasContentLengthHeader(HttpCacheEntry entry) {
        return entry.getFirstHeader("Content-Length") != null;
    }

    protected boolean contentLengthHeaderMatchesActualLength(HttpCacheEntry entry) {
        return !hasContentLengthHeader(entry) || (entry.getResource() != null && getContentLengthValue(entry) == entry.getResource().length());
    }

    protected long getApparentAgeSecs(HttpCacheEntry entry) {
        Date dateValue = entry.getDate();
        if (dateValue == null) {
            return MAX_AGE;
        }
        long diff = entry.getResponseDate().getTime() - dateValue.getTime();
        if (diff >= 0) {
            return diff / 1000;
        }
        return 0L;
    }

    protected long getAgeValue(HttpCacheEntry entry) throws NumberFormatException {
        long hdrAge;
        long ageValue = 0;
        for (Header hdr : entry.getHeaders("Age")) {
            try {
                hdrAge = Long.parseLong(hdr.getValue());
                if (hdrAge < 0) {
                    hdrAge = MAX_AGE;
                }
            } catch (NumberFormatException e) {
                hdrAge = MAX_AGE;
            }
            if (hdrAge > ageValue) {
                ageValue = hdrAge;
            }
        }
        return ageValue;
    }

    protected long getCorrectedReceivedAgeSecs(HttpCacheEntry entry) throws NumberFormatException {
        long apparentAge = getApparentAgeSecs(entry);
        long ageValue = getAgeValue(entry);
        return apparentAge > ageValue ? apparentAge : ageValue;
    }

    protected long getResponseDelaySecs(HttpCacheEntry entry) {
        long diff = entry.getResponseDate().getTime() - entry.getRequestDate().getTime();
        return diff / 1000;
    }

    protected long getCorrectedInitialAgeSecs(HttpCacheEntry entry) {
        return getCorrectedReceivedAgeSecs(entry) + getResponseDelaySecs(entry);
    }

    protected long getResidentTimeSecs(HttpCacheEntry entry, Date now) {
        long diff = now.getTime() - entry.getResponseDate().getTime();
        return diff / 1000;
    }

    protected long getMaxAge(HttpCacheEntry entry) throws ParseException, NumberFormatException {
        long maxage = -1;
        for (Header hdr : entry.getHeaders("Cache-Control")) {
            for (HeaderElement elt : hdr.getElements()) {
                if ("max-age".equals(elt.getName()) || "s-maxage".equals(elt.getName())) {
                    try {
                        long currMaxAge = Long.parseLong(elt.getValue());
                        if (maxage == -1 || currMaxAge < maxage) {
                            maxage = currMaxAge;
                        }
                    } catch (NumberFormatException e) {
                        maxage = 0;
                    }
                }
            }
        }
        return maxage;
    }

    protected Date getExpirationDate(HttpCacheEntry entry) {
        Header expiresHeader = entry.getFirstHeader("Expires");
        if (expiresHeader == null) {
            return null;
        }
        return DateUtils.parseDate(expiresHeader.getValue());
    }

    public boolean hasCacheControlDirective(HttpCacheEntry entry, String directive) throws ParseException {
        for (Header h : entry.getHeaders("Cache-Control")) {
            for (HeaderElement elt : h.getElements()) {
                if (directive.equalsIgnoreCase(elt.getName())) {
                    return true;
                }
            }
        }
        return false;
    }

    public long getStalenessSecs(HttpCacheEntry entry, Date now) {
        long age = getCurrentAgeSecs(entry, now);
        long freshness = getFreshnessLifetimeSecs(entry);
        if (age <= freshness) {
            return 0L;
        }
        return age - freshness;
    }
}
