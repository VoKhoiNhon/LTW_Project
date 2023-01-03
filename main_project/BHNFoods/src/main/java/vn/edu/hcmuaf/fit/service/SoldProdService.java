package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

public class SoldProdService {
    public SoldProdService() {
    }

    private static SoldProdService instance;
    public static SoldProdService getInstance() {
        if (instance == null) {
            instance = new SoldProdService();
        }
        return instance;
    }
    public void addToSoldProd(String idProd, String idUser, String timeSold, int amount, String idOrder, int priceHere) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO sold_pr VALUES('"+idProd+"', '"+idUser+"', '"+timeSold+"', "+amount+", '"+idOrder+"', "+priceHere+")").execute();
        });
    }
}
