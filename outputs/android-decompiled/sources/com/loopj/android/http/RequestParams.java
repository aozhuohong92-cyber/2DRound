package com.loopj.android.http;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class RequestParams implements Serializable {
    public static final String APPLICATION_JSON = "application/json";
    public static final String APPLICATION_OCTET_STREAM = "application/octet-stream";
    protected static final String LOG_TAG = "RequestParams";
    protected boolean autoCloseInputStreams;
    protected String contentEncoding;
    protected String elapsedFieldInJsonStreamer;
    protected final ConcurrentHashMap<String, List<FileWrapper>> fileArrayParams;
    protected final ConcurrentHashMap<String, FileWrapper> fileParams;
    protected boolean forceMultipartEntity;
    protected boolean isRepeatable;
    protected final ConcurrentHashMap<String, StreamWrapper> streamParams;
    protected final ConcurrentHashMap<String, String> urlParams;
    protected final ConcurrentHashMap<String, Object> urlParamsWithObjects;
    protected boolean useJsonStreamer;

    public void setContentEncoding(String encoding) {
        if (encoding != null) {
            this.contentEncoding = encoding;
        } else {
            AsyncHttpClient.log.d(LOG_TAG, "setContentEncoding called with null attribute");
        }
    }

    public void setForceMultipartEntityContentType(boolean force) {
        this.forceMultipartEntity = force;
    }

    public RequestParams() {
        this((Map<String, String>) null);
    }

    public RequestParams(Map<String, String> source) {
        this.forceMultipartEntity = false;
        this.elapsedFieldInJsonStreamer = "_elapsed";
        this.urlParams = new ConcurrentHashMap<>();
        this.streamParams = new ConcurrentHashMap<>();
        this.fileParams = new ConcurrentHashMap<>();
        this.fileArrayParams = new ConcurrentHashMap<>();
        this.urlParamsWithObjects = new ConcurrentHashMap<>();
        this.contentEncoding = "UTF-8";
        if (source != null) {
            for (Map.Entry<String, String> entry : source.entrySet()) {
                put(entry.getKey(), entry.getValue());
            }
        }
    }

    public RequestParams(final String key, final String value) {
        this(new HashMap<String, String>() { // from class: com.loopj.android.http.RequestParams.1
            {
                put(key, value);
            }
        });
    }

    public RequestParams(Object... keysAndValues) {
        this.forceMultipartEntity = false;
        this.elapsedFieldInJsonStreamer = "_elapsed";
        this.urlParams = new ConcurrentHashMap<>();
        this.streamParams = new ConcurrentHashMap<>();
        this.fileParams = new ConcurrentHashMap<>();
        this.fileArrayParams = new ConcurrentHashMap<>();
        this.urlParamsWithObjects = new ConcurrentHashMap<>();
        this.contentEncoding = "UTF-8";
        int len = keysAndValues.length;
        if (len % 2 != 0) {
            throw new IllegalArgumentException("Supplied arguments must be even");
        }
        for (int i = 0; i < len; i += 2) {
            String key = String.valueOf(keysAndValues[i]);
            String val = String.valueOf(keysAndValues[i + 1]);
            put(key, val);
        }
    }

    public void put(String key, String value) {
        if (key != null && value != null) {
            this.urlParams.put(key, value);
        }
    }

    public void put(String key, File[] files) throws FileNotFoundException {
        put(key, files, (String) null, (String) null);
    }

    public void put(String key, File[] files, String contentType, String customFileName) throws FileNotFoundException {
        if (key != null) {
            List<FileWrapper> fileWrappers = new ArrayList<>();
            for (File file : files) {
                if (file == null || !file.exists()) {
                    throw new FileNotFoundException();
                }
                fileWrappers.add(new FileWrapper(file, contentType, customFileName));
            }
            this.fileArrayParams.put(key, fileWrappers);
        }
    }

    public void put(String key, File file) throws FileNotFoundException {
        put(key, file, (String) null, (String) null);
    }

    public void put(String key, String customFileName, File file) throws FileNotFoundException {
        put(key, file, (String) null, customFileName);
    }

    public void put(String key, File file, String contentType) throws FileNotFoundException {
        put(key, file, contentType, (String) null);
    }

    public void put(String key, File file, String contentType, String customFileName) throws FileNotFoundException {
        if (file == null || !file.exists()) {
            throw new FileNotFoundException();
        }
        if (key != null) {
            this.fileParams.put(key, new FileWrapper(file, contentType, customFileName));
        }
    }

    public void put(String key, InputStream stream) {
        put(key, stream, (String) null);
    }

    public void put(String key, InputStream stream, String name) {
        put(key, stream, name, (String) null);
    }

    public void put(String key, InputStream stream, String name, String contentType) {
        put(key, stream, name, contentType, this.autoCloseInputStreams);
    }

    public void put(String key, InputStream stream, String name, String contentType, boolean autoClose) {
        if (key != null && stream != null) {
            this.streamParams.put(key, StreamWrapper.newInstance(stream, name, contentType, autoClose));
        }
    }

    public void put(String key, Object value) {
        if (key != null && value != null) {
            this.urlParamsWithObjects.put(key, value);
        }
    }

    public void put(String key, int value) {
        if (key != null) {
            this.urlParams.put(key, String.valueOf(value));
        }
    }

    public void put(String key, long value) {
        if (key != null) {
            this.urlParams.put(key, String.valueOf(value));
        }
    }

    public void add(String key, String value) {
        if (key != null && value != null) {
            Object params = this.urlParamsWithObjects.get(key);
            if (params == null) {
                params = new HashSet();
                put(key, params);
            }
            if (params instanceof List) {
                ((List) params).add(value);
            } else if (params instanceof Set) {
                ((Set) params).add(value);
            }
        }
    }

    public void remove(String key) {
        this.urlParams.remove(key);
        this.streamParams.remove(key);
        this.fileParams.remove(key);
        this.urlParamsWithObjects.remove(key);
        this.fileArrayParams.remove(key);
    }

    public boolean has(String key) {
        return (this.urlParams.get(key) == null && this.streamParams.get(key) == null && this.fileParams.get(key) == null && this.urlParamsWithObjects.get(key) == null && this.fileArrayParams.get(key) == null) ? false : true;
    }

    public String toString() {
        StringBuilder result = new StringBuilder();
        for (Map.Entry<String, String> entry : this.urlParams.entrySet()) {
            if (result.length() > 0) {
                result.append("&");
            }
            result.append(entry.getKey());
            result.append("=");
            result.append(entry.getValue());
        }
        for (Map.Entry<String, StreamWrapper> entry2 : this.streamParams.entrySet()) {
            if (result.length() > 0) {
                result.append("&");
            }
            result.append(entry2.getKey());
            result.append("=");
            result.append("STREAM");
        }
        for (Map.Entry<String, FileWrapper> entry3 : this.fileParams.entrySet()) {
            if (result.length() > 0) {
                result.append("&");
            }
            result.append(entry3.getKey());
            result.append("=");
            result.append("FILE");
        }
        for (Map.Entry<String, List<FileWrapper>> entry4 : this.fileArrayParams.entrySet()) {
            if (result.length() > 0) {
                result.append("&");
            }
            result.append(entry4.getKey());
            result.append("=");
            result.append("FILES(SIZE=").append(entry4.getValue().size()).append(")");
        }
        List<BasicNameValuePair> params = getParamsList(null, this.urlParamsWithObjects);
        for (BasicNameValuePair kv : params) {
            if (result.length() > 0) {
                result.append("&");
            }
            result.append(kv.getName());
            result.append("=");
            result.append(kv.getValue());
        }
        return result.toString();
    }

    public void setHttpEntityIsRepeatable(boolean flag) {
        this.isRepeatable = flag;
    }

    public void setUseJsonStreamer(boolean flag) {
        this.useJsonStreamer = flag;
    }

    public void setElapsedFieldInJsonStreamer(String value) {
        this.elapsedFieldInJsonStreamer = value;
    }

    public void setAutoCloseInputStreams(boolean flag) {
        this.autoCloseInputStreams = flag;
    }

    public HttpEntity getEntity(ResponseHandlerInterface progressHandler) throws IOException {
        if (this.useJsonStreamer) {
            return createJsonStreamerEntity(progressHandler);
        }
        if (!this.forceMultipartEntity && this.streamParams.isEmpty() && this.fileParams.isEmpty() && this.fileArrayParams.isEmpty()) {
            return createFormEntity();
        }
        return createMultipartEntity(progressHandler);
    }

    private HttpEntity createJsonStreamerEntity(ResponseHandlerInterface progressHandler) throws IOException {
        JsonStreamerEntity entity = new JsonStreamerEntity(progressHandler, (this.fileParams.isEmpty() && this.streamParams.isEmpty()) ? false : true, this.elapsedFieldInJsonStreamer);
        for (Map.Entry<String, String> entry : this.urlParams.entrySet()) {
            entity.addPart(entry.getKey(), entry.getValue());
        }
        for (Map.Entry<String, Object> entry2 : this.urlParamsWithObjects.entrySet()) {
            entity.addPart(entry2.getKey(), entry2.getValue());
        }
        for (Map.Entry<String, FileWrapper> entry3 : this.fileParams.entrySet()) {
            entity.addPart(entry3.getKey(), entry3.getValue());
        }
        for (Map.Entry<String, StreamWrapper> entry4 : this.streamParams.entrySet()) {
            StreamWrapper stream = entry4.getValue();
            if (stream.inputStream != null) {
                entity.addPart(entry4.getKey(), StreamWrapper.newInstance(stream.inputStream, stream.name, stream.contentType, stream.autoClose));
            }
        }
        return entity;
    }

    private HttpEntity createFormEntity() {
        try {
            return new UrlEncodedFormEntity(getParamsList(), this.contentEncoding);
        } catch (UnsupportedEncodingException e) {
            AsyncHttpClient.log.e(LOG_TAG, "createFormEntity failed", e);
            return null;
        }
    }

    private HttpEntity createMultipartEntity(ResponseHandlerInterface progressHandler) throws IOException {
        SimpleMultipartEntity entity = new SimpleMultipartEntity(progressHandler);
        entity.setIsRepeatable(this.isRepeatable);
        for (Map.Entry<String, String> entry : this.urlParams.entrySet()) {
            entity.addPartWithCharset(entry.getKey(), entry.getValue(), this.contentEncoding);
        }
        List<BasicNameValuePair> params = getParamsList(null, this.urlParamsWithObjects);
        for (BasicNameValuePair kv : params) {
            entity.addPartWithCharset(kv.getName(), kv.getValue(), this.contentEncoding);
        }
        for (Map.Entry<String, StreamWrapper> entry2 : this.streamParams.entrySet()) {
            StreamWrapper stream = entry2.getValue();
            if (stream.inputStream != null) {
                entity.addPart(entry2.getKey(), stream.name, stream.inputStream, stream.contentType);
            }
        }
        for (Map.Entry<String, FileWrapper> entry3 : this.fileParams.entrySet()) {
            FileWrapper fileWrapper = entry3.getValue();
            entity.addPart(entry3.getKey(), fileWrapper.file, fileWrapper.contentType, fileWrapper.customFileName);
        }
        for (Map.Entry<String, List<FileWrapper>> entry4 : this.fileArrayParams.entrySet()) {
            for (FileWrapper fw : entry4.getValue()) {
                entity.addPart(entry4.getKey(), fw.file, fw.contentType, fw.customFileName);
            }
        }
        return entity;
    }

    protected List<BasicNameValuePair> getParamsList() {
        List<BasicNameValuePair> lparams = new LinkedList<>();
        for (Map.Entry<String, String> entry : this.urlParams.entrySet()) {
            lparams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        }
        lparams.addAll(getParamsList(null, this.urlParamsWithObjects));
        return lparams;
    }

    private List<BasicNameValuePair> getParamsList(String key, Object value) {
        Object nestedValue;
        List<BasicNameValuePair> params = new LinkedList<>();
        if (value instanceof Map) {
            Map map = (Map) value;
            List list = new ArrayList(map.keySet());
            if (list.size() > 0 && (list.get(0) instanceof Comparable)) {
                Collections.sort(list);
            }
            for (Object nestedKey : list) {
                if ((nestedKey instanceof String) && (nestedValue = map.get(nestedKey)) != null) {
                    params.addAll(getParamsList(key == null ? (String) nestedKey : String.format(Locale.US, "%s[%s]", key, nestedKey), nestedValue));
                }
            }
        } else if (value instanceof List) {
            List list2 = (List) value;
            int listSize = list2.size();
            for (int nestedValueIndex = 0; nestedValueIndex < listSize; nestedValueIndex++) {
                params.addAll(getParamsList(String.format(Locale.US, "%s[%d]", key, Integer.valueOf(nestedValueIndex)), list2.get(nestedValueIndex)));
            }
        } else if (value instanceof Object[]) {
            Object[] array = (Object[]) value;
            int arrayLength = array.length;
            for (int nestedValueIndex2 = 0; nestedValueIndex2 < arrayLength; nestedValueIndex2++) {
                params.addAll(getParamsList(String.format(Locale.US, "%s[%d]", key, Integer.valueOf(nestedValueIndex2)), array[nestedValueIndex2]));
            }
        } else if (value instanceof Set) {
            Set set = (Set) value;
            Iterator it2 = set.iterator();
            while (it2.hasNext()) {
                params.addAll(getParamsList(key, it2.next()));
            }
        } else {
            params.add(new BasicNameValuePair(key, value.toString()));
        }
        return params;
    }

    protected String getParamString() {
        return URLEncodedUtils.format(getParamsList(), this.contentEncoding);
    }

    public static class FileWrapper implements Serializable {
        public final String contentType;
        public final String customFileName;
        public final File file;

        public FileWrapper(File file, String contentType, String customFileName) {
            this.file = file;
            this.contentType = contentType;
            this.customFileName = customFileName;
        }
    }

    public static class StreamWrapper {
        public final boolean autoClose;
        public final String contentType;
        public final InputStream inputStream;
        public final String name;

        public StreamWrapper(InputStream inputStream, String name, String contentType, boolean autoClose) {
            this.inputStream = inputStream;
            this.name = name;
            this.contentType = contentType;
            this.autoClose = autoClose;
        }

        static StreamWrapper newInstance(InputStream inputStream, String name, String contentType, boolean autoClose) {
            if (contentType == null) {
                contentType = "application/octet-stream";
            }
            return new StreamWrapper(inputStream, name, contentType, autoClose);
        }
    }
}
