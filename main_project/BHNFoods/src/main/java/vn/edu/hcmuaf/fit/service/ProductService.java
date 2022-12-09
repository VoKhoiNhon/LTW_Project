package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;

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

    private ProductService() {

    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    // Lấy ra sản phẩm theo id
    public List<SingleProduct> getSingleProduct(String idPro) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.NAME_PR,p.PRICE, c.ID_PR, c.NSX, c.HSD, c.BRAND, c.`DESCRIBE`, c.WEIGHT, c.ORIGIN, c.DATE_IMPORT_PR, c.INVENTORY, c.CONDITION_PR, i.URL, p.ID_MENU  from ct_pr c join image i on i.ID_PR = c.ID_PR JOIN product p on p.ID_PR = c.ID_PR where i.`CONDITION` = 0 and c.ID_PR = '" + idPro + "'").mapToBean(SingleProduct.class).collect(Collectors.toList());
        });

    }

    // lấy tất cả hình liên quan đến product theo id
    public List<ImgForSingleProd> getListImgForSingleProduct(String idPro) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT URL FROM image where image.ID_PR = '" + idPro + "'").mapToBean(ImgForSingleProd.class).collect(Collectors.toList());
        });
    }

    // Lấy ra phản hồi về sản phẩm theo id
    public List<Feedback> getFeedBack(String idPro) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT f.ID_USER, u.NAME_USER, f.SCORESTAR, f.TEXT, f.DATE FROM feed_back f join user u on u.`ID_USER` = f.ID_USER and f.ID_PR = '" + idPro + "'").mapToBean(Feedback.class).collect(Collectors.toList());
        });
    }

    // lấy ra danh sách sản phẩm theo loại, nếu không có loại thì lấy tất cả
    public static List<Product> getProductByKind(int kind) {
        switch (kind) {
            case 1:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm1'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 2:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm2'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 3:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm3'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 4:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm4'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 5:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm5'").mapToBean(Product.class).collect(Collectors.toList());
                });
        }
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    // lấy ra danh sách product theo loại và phân trang
    public List<Product> getListProdInPage(int kind, int page) {
        List<Product> listProd = getProductByKind(kind);
        List<Product> listResult = new ArrayList<Product>();
        int start = (page - 1) * 15 < 0 ? 0 : (page - 1) * 15;
        int end = page <= listProd.size() / 15 ? page * 15 : listProd.size() - ((page - 1) * 15) + start;
        for (int i = start; i < end; i++) {
            listResult.add(listProd.get(i));
        }
        return listResult;
    }

    // lấy ra các sản phẩm liên quan cho 1 product
    public List<Product> getRelatedProducts(String idMenu) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where p.ID_MENU = '" + idMenu + "' and i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    public List<Product> getListDiscountProd() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where p.DISCOUNT > 0 and i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    // lấy ra số lượng product theo loại để tính toán phân trang
    public int getSize(int kind) {
        return getProductByKind(kind).size();
   }


   //trang sản phẩm yêu thích
    public List<Product> getListLoveProd(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from `like` l JOIN product p  on l.ID_PR = p.ID_PR join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and l.ID_USER = '" + idUser +"'")
                    .mapToBean(Product.class).collect(Collectors.toList());
        });
    }
    //trang lịch sử giao dịch
    public List<Orders> getHistory(String idUser){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT i.URL, p.NAME_PR, p.PRICE, s.AMOUNT, o.TIME_ORDERS FROM orders o JOIN sold_pr s on o.ID_ORDERS= s.ID_ORDERS JOIN product p on s.ID_PR= p.ID_PR JOIN image i on i.ID_PR=p.ID_PR WHERE o.`CONDITION`=2  and i.`CONDITION`=0 and s.`ID-USER`='"+idUser+"'")
                    .mapToBean(Orders.class).collect(Collectors.toList());
        });
    }


    //lấy ra sản phẩm của cart
        public List<Cart> getListCart(String idUser) {
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select c.ID_PR, p.DISCOUNT,p.PRICE,p.NAME_PR,i.URL,c.AMOUNT from cart c join product p on c.ID_PR=p.ID_PR join image i on i.ID_PR=p.ID_PR where  i.`CONDITION`=0 and c.ID_USER='" + idUser + "'").mapToBean(Cart.class).collect(Collectors.toList());
                });
    }

    // hàm tính tổng ở cart
    public int sumCart(List<Cart> l) {
        int result = 0;
        for (Cart c : l) {
            result += c.getPrice()*c.getAmount();
        }
        return result;
    }
//    public int sumAmount(List<Cart> l) {
//        int result = 0;
//        for (Cart c : l) {
//            result +=c.getAmount();
//        }
//        return result;
//    }


}
