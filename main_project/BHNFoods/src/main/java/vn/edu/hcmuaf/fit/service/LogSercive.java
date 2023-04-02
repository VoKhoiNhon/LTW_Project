package vn.edu.hcmuaf.fit.service;

import com.sun.tools.javac.Main;
import vn.edu.hcmuaf.fit.beans.Discount;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

public class LogSercive {
    public LogSercive(){}
    private static LogSercive instance;
    public static LogSercive getInstance() {
        if (instance == null) {
            instance = new LogSercive();
        }
        return instance;
    }
    public List<Log> getAllLog() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * from log").mapToBean(Log.class).list();
        });
    }

//    public static void main(String[] args) {
//        System.out.println(LogSercive.getInstance().getAllLog().toString());
//        System.out.println(123);
//    }
}
