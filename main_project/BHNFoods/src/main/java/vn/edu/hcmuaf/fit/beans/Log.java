package vn.edu.hcmuaf.fit.beans;

import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

public class Log extends AbBean implements Serializable {
    int id;
    int level;
    String user;
    String src;
    String content;
    LocalDateTime createAt;
    int status;
    String browserName;
    String locationIpClient;

    static Map<Integer, String> levelMapping = new HashMap<Integer, String>();

    static {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "AlERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
        levelMapping.put(4, "CATASTROPHIC");
        levelMapping.put(5, "LOCK");
    }

    public static int INFO = 0;
    public static int ALERT = 1;
    public static int WARNING = 2;
    public static int DANGER = 3;


    public Log() {
    }

    public Log(String user, String content) {
        this.user = user;
        this.content = content;
    }

    public Log(int level, String user, String src, String content, LocalDateTime createAt, int status, String browserName, String locationIpClient) {
        this.level = level;
        this.user = user;
        this.src = src;
        this.content = content;
        this.createAt = createAt;
        this.status = status;
        this.browserName = browserName;
        this.locationIpClient = locationIpClient;
    }


    public Log(int level, String user, String src, String content, int status, String browserName, String locationIpClient) {
        this.level = level;
        this.user = user;
        this.src = src;
        this.content = content;
        this.status = status;
        this.browserName = browserName;
        this.locationIpClient = locationIpClient;
    }

    public int getId() {
        return id;
    }

    public int getLevel() {
        return level;
    }

    public String getUser() {
        return user;
    }

    public String getSrc() {
        return src;
    }

    public String getContent() {
        return content;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public int getStatus() {
        return status;
    }

    public static Map<Integer, String> getLevelMapping() {
        return levelMapping;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getbrowserName() {
        return browserName;
    }


    public void setbrowserName(String browserName) {
        this.browserName = browserName;
    }

    public String getLocationIpClient() {
        return locationIpClient;
    }

    public void setLocationIpClient(String locationIpClient) {
        this.locationIpClient = locationIpClient;
    }

    public static void setLevelMapping(Map<Integer, String> levelMapping) {
        Log.levelMapping = levelMapping;
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }


    public boolean insert(Jdbi db) {
        Integer i = db.withHandle(handle ->
                handle.execute("INSERT INTO log(`level`,`user`, src, content, createAt, `status`, `browserName`, `locationIpClient`)VALUES (?,?,?,?,NOW(),?,?,?)",
                        this.level, this.user, this.src, this.content, this.status, this.browserName, this.locationIpClient)
        );
        return i == 1;
    }
}
