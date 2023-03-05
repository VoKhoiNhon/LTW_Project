package vn.edu.hcmuaf.fit.db;

import vn.edu.hcmuaf.fit.beans.AbBean;
import vn.edu.hcmuaf.fit.beans.Log;

public class DB {
    private static DB install;

    public static DB me() {
        if(install==null) install = new DB();
        return install;
    }

    public DB() {
    }

    public boolean insert(AbBean bean) {
        return bean.insert(JDBIConnector.me());
    }

    public static void main(String[] args) {
//        Log log = new Log(Log.INFO, null, "Login FALSE", "user ABC", 0);
//        DB.me().insert(log);
    }
}
