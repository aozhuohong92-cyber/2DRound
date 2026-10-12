package org.cocos2dx.lib;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.iflytek.cloud.SpeechEvent;

/* loaded from: /Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted/classes.dex */
public class Cocos2dxLocalStorage {
    private static final int DATABASE_VERSION = 1;
    private static final String TAG = "Cocos2dxLocalStorage";
    private static String DATABASE_NAME = "jsb.sqlite";
    private static String TABLE_NAME = SpeechEvent.KEY_EVENT_RECORD_DATA;
    private static DBOpenHelper mDatabaseOpenHelper = null;
    private static SQLiteDatabase mDatabase = null;

    public static boolean init(String dbName, String tableName) {
        if (Cocos2dxActivity.getContext() == null) {
            return false;
        }
        DATABASE_NAME = dbName;
        TABLE_NAME = tableName;
        mDatabaseOpenHelper = new DBOpenHelper(Cocos2dxActivity.getContext());
        mDatabase = mDatabaseOpenHelper.getWritableDatabase();
        return true;
    }

    public static void destroy() {
        if (mDatabase != null) {
            mDatabase.close();
        }
    }

    public static void setItem(String key, String value) throws SQLException {
        try {
            String sql = "replace into " + TABLE_NAME + "(key,value)values(?,?)";
            mDatabase.execSQL(sql, new Object[]{key, value});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getItem(String key) {
        String ret = null;
        try {
            String sql = "select value from " + TABLE_NAME + " where key=?";
            Cursor c = mDatabase.rawQuery(sql, new String[]{key});
            while (true) {
                if (!c.moveToNext()) {
                    break;
                }
                if (ret != null) {
                    Log.e(TAG, "The key contains more than one value.");
                    break;
                }
                ret = c.getString(c.getColumnIndex("value"));
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static void removeItem(String key) throws SQLException {
        try {
            String sql = "delete from " + TABLE_NAME + " where key=?";
            mDatabase.execSQL(sql, new Object[]{key});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void clear() throws SQLException {
        try {
            String sql = "delete from " + TABLE_NAME;
            mDatabase.execSQL(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static class DBOpenHelper extends SQLiteOpenHelper {
        DBOpenHelper(Context context) {
            super(context, Cocos2dxLocalStorage.DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) throws SQLException {
            db.execSQL("CREATE TABLE IF NOT EXISTS " + Cocos2dxLocalStorage.TABLE_NAME + "(key TEXT PRIMARY KEY,value TEXT);");
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            Log.w(Cocos2dxLocalStorage.TAG, "Upgrading database from version " + oldVersion + " to " + newVersion + ", which will destroy all old data");
        }
    }
}
