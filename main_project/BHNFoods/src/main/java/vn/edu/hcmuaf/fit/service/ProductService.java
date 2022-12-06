package vn.edu.hcmuaf.fit.service;

import com.mysql.cj.protocol.x.XProtocolRow;
import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {
    public static final int GAO = 1;
    public static final int NEP = 2;
    public static final int HAT = 3;
    public static final int BOT = 4;
    public static final int RAU_CU = 5;
    private static ProductService instance;

    private ProductService(){

    }
    public static ProductService getInstance(){
        if (instance == null){
            instance = new ProductService();
        }
        return  instance;
    }

    public List<SingleProduct> getSingleProduct(String idPro) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.NAME_PR,p.PRICE, c.ID_PR, c.NSX, c.HSD, c.BRAND, c.`DESCRIBE`, c.WEIGHT, c.ORIGIN, c.DATE_IMPORT_PR, c.INVENTORY, c.CONDITION_PR, i.URL from ct_pr c join image i on i.ID_PR = c.ID_PR JOIN product p on p.ID_PR = c.ID_PR where i.`CONDITION` = 0 and c.ID_PR = '" + idPro + "'").mapToBean(SingleProduct.class).collect(Collectors.toList());
        });
    }

    public List<ImgForSingleProd> getListImgForSingleProduct(String idPro) {
         return JDBIConnector.get().withHandle(handle -> {
             return handle.createQuery("SELECT URL FROM image where image.ID_PR = '" + idPro + "'").mapToBean(ImgForSingleProd.class).collect(Collectors.toList());
         });
    }

    public List<Feedback> getFeedBack(String idPro) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT f.ID_USER, u.NAME_USER, f.SCORESTAR, f.TEXT, f.DATE FROM feed_back f join user u on u.`ID_USER` = f.ID_USER and f.ID_PR = '" + idPro + "'").mapToBean(Feedback.class).collect(Collectors.toList());
        });
    }


   public static List<Product> getAll(int kind){
        switch (kind) {
            case 1: return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm1'").mapToBean(Product.class).collect(Collectors.toList());
            });
            case 2: return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm2'").mapToBean(Product.class).collect(Collectors.toList());
            });
            case 3: return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm3'").mapToBean(Product.class).collect(Collectors.toList());
            });
            case 4: return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm4'").mapToBean(Product.class).collect(Collectors.toList());
            });
            case 5: return JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm5'").mapToBean(Product.class).collect(Collectors.toList());
            });
        }
       return JDBIConnector.get().withHandle(handle -> {
           return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
       });
   }
   public List<Product> getListProdInPage(int kind, int page) {
        List<Product> listProd = getAll(kind);
        List<Product> listResult = new ArrayList<Product>();
        int start = (page - 1) * 15 < 0 ? 0 : (page - 1) * 15;
        int end = page <= listProd.size() / 15 ? page * 15 : listProd.size() - ((page - 1) * 15) + start;
       for (int i = start; i < end; i++) {
           listResult.add(listProd.get(i));
       }
        return  listResult;
   }
   public int getSize(int kind) {
        return getAll(kind).size();
   }
}
