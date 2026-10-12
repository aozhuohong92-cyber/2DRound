package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.cache.HttpCacheInvalidator;
import cz.msebera.android.httpclient.client.cache.HttpCacheStorage;
import cz.msebera.android.httpclient.client.cache.HttpCacheUpdateCallback;
import cz.msebera.android.httpclient.client.cache.HttpCacheUpdateException;
import cz.msebera.android.httpclient.client.cache.Resource;
import cz.msebera.android.httpclient.client.cache.ResourceFactory;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.entity.ByteArrayEntity;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.message.BasicHttpResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
class BasicHttpCache implements HttpCache {
    private static final Set<String> safeRequestMethods = new HashSet(Arrays.asList("HEAD", "GET", "OPTIONS", "TRACE"));
    private final CacheEntryUpdater cacheEntryUpdater;
    private final HttpCacheInvalidator cacheInvalidator;
    public HttpClientAndroidLog log;
    private final long maxObjectSizeBytes;
    private final ResourceFactory resourceFactory;
    private final CachedHttpResponseGenerator responseGenerator;
    private final HttpCacheStorage storage;
    private final CacheKeyGenerator uriExtractor;

    public BasicHttpCache(ResourceFactory resourceFactory, HttpCacheStorage storage, CacheConfig config, CacheKeyGenerator uriExtractor, HttpCacheInvalidator cacheInvalidator) {
        this.log = new HttpClientAndroidLog(getClass());
        this.resourceFactory = resourceFactory;
        this.uriExtractor = uriExtractor;
        this.cacheEntryUpdater = new CacheEntryUpdater(resourceFactory);
        this.maxObjectSizeBytes = config.getMaxObjectSize();
        this.responseGenerator = new CachedHttpResponseGenerator();
        this.storage = storage;
        this.cacheInvalidator = cacheInvalidator;
    }

    public BasicHttpCache(ResourceFactory resourceFactory, HttpCacheStorage storage, CacheConfig config, CacheKeyGenerator uriExtractor) {
        this(resourceFactory, storage, config, uriExtractor, new CacheInvalidator(uriExtractor, storage));
    }

    public BasicHttpCache(ResourceFactory resourceFactory, HttpCacheStorage storage, CacheConfig config) {
        this(resourceFactory, storage, config, new CacheKeyGenerator());
    }

    public BasicHttpCache(CacheConfig config) {
        this(new HeapResourceFactory(), new BasicHttpCacheStorage(config), config);
    }

    public BasicHttpCache() {
        this(CacheConfig.DEFAULT);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public void flushCacheEntriesFor(HttpHost host, HttpRequest request) throws IOException {
        if (!safeRequestMethods.contains(request.getRequestLine().getMethod())) {
            String uri = this.uriExtractor.getURI(host, request);
            this.storage.removeEntry(uri);
        }
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public void flushInvalidatedCacheEntriesFor(HttpHost host, HttpRequest request, HttpResponse response) {
        if (!safeRequestMethods.contains(request.getRequestLine().getMethod())) {
            this.cacheInvalidator.flushInvalidatedCacheEntries(host, request, response);
        }
    }

    void storeInCache(HttpHost target, HttpRequest request, HttpCacheEntry entry) throws IOException {
        if (entry.hasVariants()) {
            storeVariantEntry(target, request, entry);
        } else {
            storeNonVariantEntry(target, request, entry);
        }
    }

    void storeNonVariantEntry(HttpHost target, HttpRequest req, HttpCacheEntry entry) throws IOException {
        String uri = this.uriExtractor.getURI(target, req);
        this.storage.putEntry(uri, entry);
    }

    void storeVariantEntry(HttpHost target, final HttpRequest req, final HttpCacheEntry entry) throws IOException {
        String parentURI = this.uriExtractor.getURI(target, req);
        final String variantURI = this.uriExtractor.getVariantURI(target, req, entry);
        this.storage.putEntry(variantURI, entry);
        HttpCacheUpdateCallback callback = new HttpCacheUpdateCallback() { // from class: cz.msebera.android.httpclient.impl.client.cache.BasicHttpCache.1
            @Override // cz.msebera.android.httpclient.client.cache.HttpCacheUpdateCallback
            public HttpCacheEntry update(HttpCacheEntry existing) throws IOException {
                return BasicHttpCache.this.doGetUpdatedParentEntry(req.getRequestLine().getUri(), existing, entry, BasicHttpCache.this.uriExtractor.getVariantKey(req, entry), variantURI);
            }
        };
        try {
            this.storage.updateEntry(parentURI, callback);
        } catch (HttpCacheUpdateException e) {
            this.log.warn("Could not update key [" + parentURI + "]", e);
        }
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public void reuseVariantEntryFor(HttpHost target, final HttpRequest req, Variant variant) throws ParseException, IOException {
        String parentCacheKey = this.uriExtractor.getURI(target, req);
        final HttpCacheEntry entry = variant.getEntry();
        final String variantKey = this.uriExtractor.getVariantKey(req, entry);
        final String variantCacheKey = variant.getCacheKey();
        HttpCacheUpdateCallback callback = new HttpCacheUpdateCallback() { // from class: cz.msebera.android.httpclient.impl.client.cache.BasicHttpCache.2
            @Override // cz.msebera.android.httpclient.client.cache.HttpCacheUpdateCallback
            public HttpCacheEntry update(HttpCacheEntry existing) throws IOException {
                return BasicHttpCache.this.doGetUpdatedParentEntry(req.getRequestLine().getUri(), existing, entry, variantKey, variantCacheKey);
            }
        };
        try {
            this.storage.updateEntry(parentCacheKey, callback);
        } catch (HttpCacheUpdateException e) {
            this.log.warn("Could not update key [" + parentCacheKey + "]", e);
        }
    }

    boolean isIncompleteResponse(HttpResponse resp, Resource resource) throws NumberFormatException {
        Header hdr;
        int status = resp.getStatusLine().getStatusCode();
        if ((status != 200 && status != 206) || (hdr = resp.getFirstHeader("Content-Length")) == null) {
            return false;
        }
        try {
            int contentLength = Integer.parseInt(hdr.getValue());
            return resource != null && resource.length() < ((long) contentLength);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    CloseableHttpResponse generateIncompleteResponseError(HttpResponse response, Resource resource) throws NumberFormatException {
        Integer contentLength = Integer.valueOf(response.getFirstHeader("Content-Length").getValue());
        HttpResponse error = new BasicHttpResponse(HttpVersion.HTTP_1_1, 502, "Bad Gateway");
        error.setHeader("Content-Type", "text/plain;charset=UTF-8");
        String msg = String.format("Received incomplete response with Content-Length %d but actual body length %d", contentLength, Long.valueOf(resource.length()));
        byte[] msgBytes = msg.getBytes();
        error.setHeader("Content-Length", Integer.toString(msgBytes.length));
        error.setEntity(new ByteArrayEntity(msgBytes));
        return Proxies.enhanceResponse(error);
    }

    HttpCacheEntry doGetUpdatedParentEntry(String requestId, HttpCacheEntry existing, HttpCacheEntry entry, String variantKey, String variantCacheKey) throws IOException {
        HttpCacheEntry src = existing;
        if (src == null) {
            src = entry;
        }
        Resource resource = null;
        if (src.getResource() != null) {
            resource = this.resourceFactory.copy(requestId, src.getResource());
        }
        Map<String, String> variantMap = new HashMap<>(src.getVariantMap());
        variantMap.put(variantKey, variantCacheKey);
        return new HttpCacheEntry(src.getRequestDate(), src.getResponseDate(), src.getStatusLine(), src.getAllHeaders(), resource, variantMap, src.getRequestMethod());
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public HttpCacheEntry updateCacheEntry(HttpHost target, HttpRequest request, HttpCacheEntry stale, HttpResponse originResponse, Date requestSent, Date responseReceived) throws IOException {
        HttpCacheEntry updatedEntry = this.cacheEntryUpdater.updateCacheEntry(request.getRequestLine().getUri(), stale, requestSent, responseReceived, originResponse);
        storeInCache(target, request, updatedEntry);
        return updatedEntry;
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public HttpCacheEntry updateVariantCacheEntry(HttpHost target, HttpRequest request, HttpCacheEntry stale, HttpResponse originResponse, Date requestSent, Date responseReceived, String cacheKey) throws IOException {
        HttpCacheEntry updatedEntry = this.cacheEntryUpdater.updateCacheEntry(request.getRequestLine().getUri(), stale, requestSent, responseReceived, originResponse);
        this.storage.putEntry(cacheKey, updatedEntry);
        return updatedEntry;
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public HttpResponse cacheAndReturnResponse(HttpHost host, HttpRequest request, HttpResponse originResponse, Date requestSent, Date responseReceived) throws IOException {
        return cacheAndReturnResponse(host, request, Proxies.enhanceResponse(originResponse), requestSent, responseReceived);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public CloseableHttpResponse cacheAndReturnResponse(HttpHost host, HttpRequest request, CloseableHttpResponse originResponse, Date requestSent, Date responseReceived) throws IOException {
        CloseableHttpResponse closeableHttpResponseGenerateResponse;
        boolean closeOriginResponse = true;
        SizeLimitedResponseReader responseReader = getResponseReader(request, originResponse);
        try {
            responseReader.readResponse();
            if (responseReader.isLimitReached()) {
                closeOriginResponse = false;
                closeableHttpResponseGenerateResponse = responseReader.getReconstructedResponse();
            } else {
                Resource resource = responseReader.getResource();
                if (isIncompleteResponse(originResponse, resource)) {
                    closeableHttpResponseGenerateResponse = generateIncompleteResponseError(originResponse, resource);
                    if (closeOriginResponse) {
                        originResponse.close();
                    }
                } else {
                    HttpCacheEntry entry = new HttpCacheEntry(requestSent, responseReceived, originResponse.getStatusLine(), originResponse.getAllHeaders(), resource, request.getRequestLine().getMethod());
                    storeInCache(host, request, entry);
                    closeableHttpResponseGenerateResponse = this.responseGenerator.generateResponse(HttpRequestWrapper.wrap(request, host), entry);
                    if (closeOriginResponse) {
                        originResponse.close();
                    }
                }
            }
            return closeableHttpResponseGenerateResponse;
        } finally {
            if (closeOriginResponse) {
                originResponse.close();
            }
        }
    }

    SizeLimitedResponseReader getResponseReader(HttpRequest request, CloseableHttpResponse backEndResponse) {
        return new SizeLimitedResponseReader(this.resourceFactory, this.maxObjectSizeBytes, request, backEndResponse);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public HttpCacheEntry getCacheEntry(HttpHost host, HttpRequest request) throws IOException {
        HttpCacheEntry root = this.storage.getEntry(this.uriExtractor.getURI(host, request));
        if (root == null) {
            return null;
        }
        if (root.hasVariants()) {
            String variantCacheKey = root.getVariantMap().get(this.uriExtractor.getVariantKey(request, root));
            if (variantCacheKey == null) {
                return null;
            }
            return this.storage.getEntry(variantCacheKey);
        }
        return root;
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public void flushInvalidatedCacheEntriesFor(HttpHost host, HttpRequest request) throws IOException {
        this.cacheInvalidator.flushInvalidatedCacheEntries(host, request);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.HttpCache
    public Map<String, Variant> getVariantCacheEntriesWithEtags(HttpHost host, HttpRequest request) throws IOException {
        Map<String, Variant> variants = new HashMap<>();
        HttpCacheEntry root = this.storage.getEntry(this.uriExtractor.getURI(host, request));
        if (root != null && root.hasVariants()) {
            for (Map.Entry<String, String> variant : root.getVariantMap().entrySet()) {
                String variantKey = variant.getKey();
                String variantCacheKey = variant.getValue();
                addVariantWithEtag(variantKey, variantCacheKey, variants);
            }
        }
        return variants;
    }

    private void addVariantWithEtag(String variantKey, String variantCacheKey, Map<String, Variant> variants) throws IOException {
        Header etagHeader;
        HttpCacheEntry entry = this.storage.getEntry(variantCacheKey);
        if (entry != null && (etagHeader = entry.getFirstHeader("ETag")) != null) {
            variants.put(etagHeader.getValue(), new Variant(variantKey, variantCacheKey, entry));
        }
    }
}
