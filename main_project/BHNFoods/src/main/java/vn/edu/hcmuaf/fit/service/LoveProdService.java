package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.Like;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

public class LoveProdService {

    public LoveProdService() {
    }

    private static LoveProdService instance;
    public static LoveProdService getInstance() {
        if (instance == null) {
            instance = new LoveProdService();
        }
        return instance;
    }


    public void deleteFromLike(String idUser, String idProd) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM `like` WHERE `like`.ID_PR = '"+idProd+"' and `like`.ID_USER = '"+idUser+"'").execute();
        });
    }

    public void insertToLike(String idUser, String idProd) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `like` VALUES ('"+idProd+"', '"+idUser+"')").execute();
        });
    }
    public boolean checkLiked(String idUser, String idProd) {
        List<Like> listLiked = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT ID_PR, ID_USER FROM `like` WHERE `like`.ID_PR = '"+idProd+"' and ID_USER = '"+idUser+"'").mapToBean(Like.class).list();
        });
        return listLiked.size() > 0;
    }

}
