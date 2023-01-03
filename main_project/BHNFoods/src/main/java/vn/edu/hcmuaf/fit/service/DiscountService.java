package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.Discount;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

public class DiscountService {

    public DiscountService() {
    }

    private static DiscountService instance;
    public static DiscountService getInstance() {
        if (instance == null) {
            instance = new DiscountService();
        }
        return instance;
    }

    public List<Discount> getAllDiscount() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT ID_CODE, SOLUONG, `CODE`, NUMBER, TYPE, MINIMUM from discount WHERE SOLUONG > 0").mapToBean(Discount.class).list();
        });
    }

    public List<Discount> getDiscountByCode(String code) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT ID_CODE, SOLUONG, `CODE`, NUMBER, TYPE, MINIMUM from discount WHERE `CODE` = '"+code+"'").mapToBean(Discount.class).list();
        });
    }

    public void changeAmountDiscount(String maGiamGia, int i) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE discount set SOLUONG = SOLUONG + "+i+" WHERE `CODE` = '"+maGiamGia+"'").execute();
        });
    }
}
