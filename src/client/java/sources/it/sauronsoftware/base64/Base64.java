package it.sauronsoftware.base64;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Base64 {
    private static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[1024];
        while (true) {
            int i = inputStream.read(bArr);
            if (i == -1) {
                return;
            } else {
                outputStream.write(bArr, 0, i);
            }
        }
    }

    public static String decode(String str) throws RuntimeException {
        try {
            return new String(decode(str.getBytes("ASCII")));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("ASCII is not supported!", e);
        }
    }

    public static String decode(String str, String str2) throws RuntimeException {
        try {
            try {
                return new String(decode(str.getBytes("ASCII")), str2);
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(new StringBuffer().append("Unsupported charset: ").append(str2).toString(), e);
            }
        } catch (UnsupportedEncodingException e2) {
            throw new RuntimeException("ASCII is not supported!", e2);
        }
    }

    public static void decode(File file, File file2) throws Throwable {
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(file);
            try {
                fileOutputStream = new FileOutputStream(file2);
                try {
                    decode(fileInputStream, fileOutputStream);
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th) {
                        }
                    }
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Throwable th2) {
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th4) {
                        }
                    }
                    if (fileInputStream == null) {
                        throw th;
                    }
                    try {
                        fileInputStream.close();
                        throw th;
                    } catch (Throwable th5) {
                        throw th;
                    }
                }
            } catch (Throwable th6) {
                th = th6;
                fileOutputStream = null;
            }
        } catch (Throwable th7) {
            th = th7;
            fileOutputStream = null;
            fileInputStream = null;
        }
    }

    public static void decode(InputStream inputStream, OutputStream outputStream) throws IOException {
        copy(new Base64InputStream(inputStream), outputStream);
    }

    public static byte[] decode(byte[] bArr) throws RuntimeException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            try {
                decode(byteArrayInputStream, byteArrayOutputStream);
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th) {
                }
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th2) {
                }
                return byteArrayOutputStream.toByteArray();
            } catch (Throwable th3) {
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th4) {
                }
                try {
                    byteArrayOutputStream.close();
                    throw th3;
                } catch (Throwable th5) {
                    throw th3;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Unexpected I/O error", e);
        }
    }

    public static String encode(String str) throws RuntimeException {
        try {
            return new String(encode(str.getBytes()), "ASCII");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("ASCII is not supported!", e);
        }
    }

    public static String encode(String str, String str2) throws RuntimeException {
        try {
            try {
                return new String(encode(str.getBytes(str2)), "ASCII");
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("ASCII is not supported!", e);
            }
        } catch (UnsupportedEncodingException e2) {
            throw new RuntimeException(new StringBuffer().append("Unsupported charset: ").append(str2).toString(), e2);
        }
    }

    public static void encode(File file, File file2) throws Throwable {
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(file);
            try {
                fileOutputStream = new FileOutputStream(file2);
                try {
                    encode(fileInputStream, fileOutputStream);
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th) {
                        }
                    }
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Throwable th2) {
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th4) {
                        }
                    }
                    if (fileInputStream == null) {
                        throw th;
                    }
                    try {
                        fileInputStream.close();
                        throw th;
                    } catch (Throwable th5) {
                        throw th;
                    }
                }
            } catch (Throwable th6) {
                th = th6;
                fileOutputStream = null;
            }
        } catch (Throwable th7) {
            th = th7;
            fileOutputStream = null;
            fileInputStream = null;
        }
    }

    public static void encode(File file, File file2, int i) throws Throwable {
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(file);
            try {
                fileOutputStream = new FileOutputStream(file2);
                try {
                    encode(fileInputStream, fileOutputStream, i);
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th) {
                        }
                    }
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Throwable th2) {
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th4) {
                        }
                    }
                    if (fileInputStream == null) {
                        throw th;
                    }
                    try {
                        fileInputStream.close();
                        throw th;
                    } catch (Throwable th5) {
                        throw th;
                    }
                }
            } catch (Throwable th6) {
                th = th6;
                fileOutputStream = null;
            }
        } catch (Throwable th7) {
            th = th7;
            fileOutputStream = null;
            fileInputStream = null;
        }
    }

    public static void encode(InputStream inputStream, OutputStream outputStream) throws IOException {
        encode(inputStream, outputStream, 0);
    }

    public static void encode(InputStream inputStream, OutputStream outputStream, int i) throws IOException {
        Base64OutputStream base64OutputStream = new Base64OutputStream(outputStream, i);
        copy(inputStream, base64OutputStream);
        base64OutputStream.commit();
    }

    public static byte[] encode(byte[] bArr) throws RuntimeException {
        return encode(bArr, 0);
    }

    public static byte[] encode(byte[] bArr, int i) throws RuntimeException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            try {
                encode(byteArrayInputStream, byteArrayOutputStream, i);
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th) {
                }
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th2) {
                }
                return byteArrayOutputStream.toByteArray();
            } catch (Throwable th3) {
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th4) {
                }
                try {
                    byteArrayOutputStream.close();
                    throw th3;
                } catch (Throwable th5) {
                    throw th3;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Unexpected I/O error", e);
        }
    }
}
