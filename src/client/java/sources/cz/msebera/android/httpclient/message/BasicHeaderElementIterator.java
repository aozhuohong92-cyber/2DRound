package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.FormattedHeader;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HeaderElementIterator;
import cz.msebera.android.httpclient.HeaderIterator;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.NoSuchElementException;

@NotThreadSafe
/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class BasicHeaderElementIterator implements HeaderElementIterator {
    private CharArrayBuffer buffer;
    private HeaderElement currentElement;
    private ParserCursor cursor;
    private final HeaderIterator headerIt;
    private final HeaderValueParser parser;

    public BasicHeaderElementIterator(HeaderIterator headerIterator, HeaderValueParser parser) {
        this.currentElement = null;
        this.buffer = null;
        this.cursor = null;
        this.headerIt = (HeaderIterator) Args.notNull(headerIterator, "Header iterator");
        this.parser = (HeaderValueParser) Args.notNull(parser, "Parser");
    }

    public BasicHeaderElementIterator(HeaderIterator headerIterator) {
        this(headerIterator, BasicHeaderValueParser.INSTANCE);
    }

    private void bufferHeaderValue() {
        this.cursor = null;
        this.buffer = null;
        while (this.headerIt.hasNext()) {
            Header h = this.headerIt.nextHeader();
            if (h instanceof FormattedHeader) {
                this.buffer = ((FormattedHeader) h).getBuffer();
                this.cursor = new ParserCursor(0, this.buffer.length());
                this.cursor.updatePos(((FormattedHeader) h).getValuePos());
                return;
            } else {
                String value = h.getValue();
                if (value != null) {
                    this.buffer = new CharArrayBuffer(value.length());
                    this.buffer.append(value);
                    this.cursor = new ParserCursor(0, this.buffer.length());
                    return;
                }
            }
        }
    }

    private void parseNextElement() throws ParseException {
        HeaderElement e;
        loop0: while (true) {
            if (this.headerIt.hasNext() || this.cursor != null) {
                if (this.cursor == null || this.cursor.atEnd()) {
                    bufferHeaderValue();
                }
                if (this.cursor != null) {
                    while (!this.cursor.atEnd()) {
                        e = this.parser.parseHeaderElement(this.buffer, this.cursor);
                        if (e.getName().length() != 0 || e.getValue() != null) {
                            break loop0;
                        }
                    }
                    if (this.cursor.atEnd()) {
                        this.cursor = null;
                        this.buffer = null;
                    }
                }
            } else {
                return;
            }
        }
        this.currentElement = e;
    }

    @Override // cz.msebera.android.httpclient.HeaderElementIterator, java.util.Iterator
    public boolean hasNext() throws ParseException {
        if (this.currentElement == null) {
            parseNextElement();
        }
        return this.currentElement != null;
    }

    @Override // cz.msebera.android.httpclient.HeaderElementIterator
    public HeaderElement nextElement() throws ParseException, NoSuchElementException {
        if (this.currentElement == null) {
            parseNextElement();
        }
        if (this.currentElement == null) {
            throw new NoSuchElementException("No more header elements available");
        }
        HeaderElement element = this.currentElement;
        this.currentElement = null;
        return element;
    }

    @Override // java.util.Iterator
    public final Object next() throws NoSuchElementException {
        return nextElement();
    }

    @Override // java.util.Iterator
    public void remove() throws UnsupportedOperationException {
        throw new UnsupportedOperationException("Remove not supported");
    }
}
