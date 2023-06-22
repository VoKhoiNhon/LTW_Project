package vn.edu.hcmuaf.fit.service;

import org.jdbi.v3.core.result.ResultIterable;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

public class VerifyingService {

    public VerifyingService() {
    }

    private static VerifyingService instance;
    public static VerifyingService getInstance() {
        if (instance == null) {
            instance = new VerifyingService();
        }
        return instance;
    }

    public static void addKey(String key, String differentEvent) {

        String sql = "INSERT INTO identity values(?)";
            JDBIConnector.get().withHandle(handle ->
                handle.createUpdate(sql).bind(0, key).execute()
            );
            createEvent(differentEvent, 5, key);
        }

    public boolean isExistKey(String key) {
        String sql = "SELECT `KEY` FROM identity WHERE `KEY` = :key";
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("key", key)
                        .mapTo(String.class)
                        .findOne()
                        .isPresent()
        );
    }
    public void dropEventNow(String event) {
        String sql = "DROP EVENT IF EXISTS delete_identity_row_" + event;
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate(sql).execute()
        );
    }

    public void dropKeyNow(String key) {
        String sql = "DELETE FROM identity WHERE `KEY` = :key";
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("key",key)
                        .execute()
        );
    }

    public static void createEvent(String event, int min, String key) {
        String sql = "CREATE EVENT delete_identity_row_"+event+"\n" +
                "ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL "+min+" MINUTE\n" +
                "DO\n" +
                "BEGIN\n" +
                "\tDELETE FROM identity WHERE `KEY` = :key;\n" +
                "\tDROP EVENT IF EXISTS delete_identity_row_"+event+";\n" +
                "END";
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("key",key)
                        .execute()
        );
    }

    public static void onEvent_scheduler(){
        String sql = "SET GLOBAL event_scheduler = ON";
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate(sql).execute()
        );
    }


    public static void main(String[] args) {
//        onEvent_scheduler();
        addKey("aaa", "abc");
    }
}
