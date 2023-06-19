package vn.edu.hcmuaf.fit.service;

import com.sun.tools.javac.Main;
import vn.edu.hcmuaf.fit.beans.Discount;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

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
    public int getLevelForDayLogin(String userid) {
        LocalDate date = LocalDate.now();
        return JDBIConnector.get().withHandle(handle -> {
            Integer maxLevel = handle.createQuery("SELECT max(level) FROM log WHERE DATE(createAt) = :date AND content ='LOGIN FALSE: "+userid+"'")
                    .bind("date", date)
                    .bind("userid", userid)
                    .mapTo(Integer.class)
                    .findOne()
                    .orElse(null);
            return maxLevel != null ? maxLevel.intValue() : 0;
        });
    }
    public List<Log> listLog(){
     return JDBIConnector.get().withHandle(handle -> {
        return handle.createQuery(" SELECT l.`user`, u.NAME_USER, l.browserName ,l.src, l.content, l.createAt, l.locationIpClient FROM log l JOIN `user` u on l.`user`= u.ID_USER")
                .mapToBean(Log.class).collect(Collectors.toList());
    });
}

//    public static void main(String[] args) {
//        System.out.println(LogSercive.getInstance().getAllLog().toString());
//        System.out.println(123);
//    }
}
