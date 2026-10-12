package cz.msebera.android.httpclient.client.protocol;

import com.loopj.android.http.AsyncHttpClient;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpResponseInterceptor;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.client.entity.DecompressingEntity;
import cz.msebera.android.httpclient.client.entity.DeflateInputStream;
import cz.msebera.android.httpclient.client.entity.InputStreamFactory;
import cz.msebera.android.httpclient.config.Lookup;
import cz.msebera.android.httpclient.config.RegistryBuilder;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.zip.GZIPInputStream;

@Immutable
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class ResponseContentEncoding implements HttpResponseInterceptor {
    public static final String UNCOMPRESSED = "http.client.response.uncompressed";
    private final Lookup<InputStreamFactory> decoderRegistry;
    private static final InputStreamFactory GZIP = new InputStreamFactory() { // from class: cz.msebera.android.httpclient.client.protocol.ResponseContentEncoding.1
        @Override // cz.msebera.android.httpclient.client.entity.InputStreamFactory
        public InputStream create(InputStream instream) throws IOException {
            return new GZIPInputStream(instream);
        }
    };
    private static final InputStreamFactory DEFLATE = new InputStreamFactory() { // from class: cz.msebera.android.httpclient.client.protocol.ResponseContentEncoding.2
        @Override // cz.msebera.android.httpclient.client.entity.InputStreamFactory
        public InputStream create(InputStream instream) throws IOException {
            return new DeflateInputStream(instream);
        }
    };

    public ResponseContentEncoding(Lookup<InputStreamFactory> decoderRegistry) {
        this.decoderRegistry = decoderRegistry == null ? RegistryBuilder.create().register(AsyncHttpClient.ENCODING_GZIP, GZIP).register("x-gzip", GZIP).register("deflate", DEFLATE).build() : decoderRegistry;
    }

    public ResponseContentEncoding() {
        this(null);
    }

    @Override // cz.msebera.android.httpclient.HttpResponseInterceptor
    public void process(HttpResponse response, HttpContext context) throws ParseException, HttpException, IOException {
        Header ceheader;
        HttpEntity entity = response.getEntity();
        HttpClientContext clientContext = HttpClientContext.adapt(context);
        RequestConfig requestConfig = clientContext.getRequestConfig();
        if (requestConfig.isDecompressionEnabled() && entity != null && entity.getContentLength() != 0 && (ceheader = entity.getContentEncoding()) != null) {
            HeaderElement[] codecs = ceheader.getElements();
            for (HeaderElement codec : codecs) {
                String codecname = codec.getName().toLowerCase(Locale.ROOT);
                InputStreamFactory decoderFactory = this.decoderRegistry.lookup(codecname);
                if (decoderFactory != null) {
                    response.setEntity(new DecompressingEntity(response.getEntity(), decoderFactory));
                    response.removeHeaders("Content-Length");
                    response.removeHeaders("Content-Encoding");
                    response.removeHeaders("Content-MD5");
                } else if (!"identity".equals(codecname)) {
                    throw new HttpException("Unsupported Content-Coding: " + codec.getName());
                }
            }
        }
    }
}
