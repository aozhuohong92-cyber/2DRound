package com.loopj.android.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public abstract class SaxAsyncHttpResponseHandler<T extends DefaultHandler> extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "SaxAsyncHttpRH";
    private T handler;

    public abstract void onFailure(int i, Header[] headerArr, T t);

    public abstract void onSuccess(int i, Header[] headerArr, T t);

    public SaxAsyncHttpResponseHandler(T t) {
        this.handler = null;
        if (t == null) {
            throw new Error("null instance of <T extends DefaultHandler> passed to constructor");
        }
        this.handler = t;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    protected byte[] getResponseData(HttpEntity entity) throws Throwable {
        XMLReader rssReader;
        InputStreamReader inputStreamReader;
        if (entity == null) {
            return null;
        }
        InputStream instream = entity.getContent();
        InputStreamReader inputStreamReader2 = null;
        try {
            if (instream == null) {
                return null;
            }
            try {
                SAXParserFactory sfactory = SAXParserFactory.newInstance();
                SAXParser sparser = sfactory.newSAXParser();
                rssReader = sparser.getXMLReader();
                rssReader.setContentHandler(this.handler);
                inputStreamReader = new InputStreamReader(instream, getCharset());
            } catch (ParserConfigurationException e) {
                e = e;
            } catch (SAXException e2) {
                e = e2;
            }
            try {
                rssReader.parse(new InputSource(inputStreamReader));
                AsyncHttpClient.silentCloseInputStream(instream);
                if (inputStreamReader != null) {
                    try {
                        inputStreamReader.close();
                    } catch (IOException e3) {
                    }
                }
            } catch (ParserConfigurationException e4) {
                e = e4;
                inputStreamReader2 = inputStreamReader;
                AsyncHttpClient.log.e(LOG_TAG, "getResponseData exception", e);
                AsyncHttpClient.silentCloseInputStream(instream);
                if (inputStreamReader2 != null) {
                    try {
                        inputStreamReader2.close();
                    } catch (IOException e5) {
                    }
                }
                return null;
            } catch (SAXException e6) {
                e = e6;
                inputStreamReader2 = inputStreamReader;
                AsyncHttpClient.log.e(LOG_TAG, "getResponseData exception", e);
                AsyncHttpClient.silentCloseInputStream(instream);
                if (inputStreamReader2 != null) {
                    try {
                        inputStreamReader2.close();
                    } catch (IOException e7) {
                    }
                }
                return null;
            } catch (Throwable th) {
                th = th;
                inputStreamReader2 = inputStreamReader;
                AsyncHttpClient.silentCloseInputStream(instream);
                if (inputStreamReader2 != null) {
                    try {
                        inputStreamReader2.close();
                    } catch (IOException e8) {
                    }
                }
                throw th;
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
        onSuccess(statusCode, headers, (Header[]) this.handler);
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
        onFailure(statusCode, headers, this.handler);
    }
}
