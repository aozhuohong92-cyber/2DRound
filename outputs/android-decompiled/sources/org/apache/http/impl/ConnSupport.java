package org.apache.http.impl;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import org.apache.http.config.ConnectionConfig;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public final class ConnSupport {
    public static CharsetDecoder createDecoder(ConnectionConfig cconfig) {
        if (cconfig == null) {
            return null;
        }
        Charset charset = cconfig.getCharset();
        CodingErrorAction malformed = cconfig.getMalformedInputAction();
        CodingErrorAction unmappable = cconfig.getUnmappableInputAction();
        if (charset == null) {
            return null;
        }
        CharsetDecoder charsetDecoderNewDecoder = charset.newDecoder();
        if (malformed == null) {
            malformed = CodingErrorAction.REPORT;
        }
        CharsetDecoder charsetDecoderOnMalformedInput = charsetDecoderNewDecoder.onMalformedInput(malformed);
        if (unmappable == null) {
            unmappable = CodingErrorAction.REPORT;
        }
        return charsetDecoderOnMalformedInput.onUnmappableCharacter(unmappable);
    }

    public static CharsetEncoder createEncoder(ConnectionConfig cconfig) {
        Charset charset;
        if (cconfig == null || (charset = cconfig.getCharset()) == null) {
            return null;
        }
        CodingErrorAction malformed = cconfig.getMalformedInputAction();
        CodingErrorAction unmappable = cconfig.getUnmappableInputAction();
        CharsetEncoder charsetEncoderNewEncoder = charset.newEncoder();
        if (malformed == null) {
            malformed = CodingErrorAction.REPORT;
        }
        CharsetEncoder charsetEncoderOnMalformedInput = charsetEncoderNewEncoder.onMalformedInput(malformed);
        if (unmappable == null) {
            unmappable = CodingErrorAction.REPORT;
        }
        return charsetEncoderOnMalformedInput.onUnmappableCharacter(unmappable);
    }
}
