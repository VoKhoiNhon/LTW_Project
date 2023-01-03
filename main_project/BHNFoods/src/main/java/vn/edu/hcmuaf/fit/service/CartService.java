package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CartService {

    public CartService() {
    }

    private static CartService instance;
    public static CartService getInstance() {
        if (instance == null) {
            instance = new CartService();
        }
        return instance;
    }

    public boolean checkExist(String idUser, String idProd) {
        List<Cart> cart = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select c.ID_PR, p.DISCOUNT,p.PRICE,p.NAME_PR,i.URL,c.AMOUNT from cart c join product p on c.ID_PR=p.ID_PR join image i on i.ID_PR=p.ID_PR where  i.`CONDITION`=0 and c.ID_USER= '"+idUser+"' and c.ID_PR = '" + idProd + "'").mapToBean(Cart.class).list();
        });
        if (cart.size() > 0) return true;
        return false;
    }

    public void insertToCart(String idUser, String idProd, int amount) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO cart values ('"+idUser+"','"+idProd+"',"+amount+")").execute();
        });
    }

    public void updateToCart(String idUser, String idProd, int amount) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE cart set AMOUNT = AMOUNT + "+amount+" WHERE ID_PR = '"+idProd+"' and ID_USER = '"+idUser+"'").execute();
        });
    }

    public void deleteFromCart(String idProd, String idUser) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM cart WHERE ID_PR = '"+idProd+"' and ID_USER = '"+idUser+"'").execute();
        });
    }

    public void updateAmountToCart(String id, String idUser, int amount) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE cart SET AMOUNT = "+amount+" WHERE ID_USER = '"+ idUser +"' and ID_PR = '"+id+"'").execute();
        });
    }
    public List<Cart> getProdFormCart(String idUser, String idProd) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select c.ID_PR, p.DISCOUNT,p.PRICE,p.NAME_PR,i.URL,c.AMOUNT from cart c join product p on c.ID_PR=p.ID_PR join image i on i.ID_PR=p.ID_PR where  i.`CONDITION`=0 and c.ID_USER= '"+idUser+"' and c.ID_PR = '" + idProd + "'").mapToBean(Cart.class).list();
        });
    }

    public void test() {
      JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO sold_pr VALUES ('prod8', 'user1', '2022-11-27 15:35:29', 1, 'orders1', 20000);").execute();
        });
    }
    public static void main(String[] args) {
//        System.out.println(CartService.getInstance().getProdFormCart("user1", "prod2"));
        for (int i = 0; i < 2; i++) {
            CartService.getInstance().test();
        }
    }
}

