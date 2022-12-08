package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;

import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    private static ProductService instance;

    private ProductService(){

    }
    public static ProductService getInstance(){
        if (instance == null){
            instance = new ProductService();
        }
        return  instance;
    }
   public static List<Product> getAll(){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });

   }

    public static void main(String[] args) {
//        List<User> list = (List<User>) User();
//        for (User p: list) {
//            System.out.println(p.getNameUser());
//        }
        System.out.println(ProductService.getAll());

    }
}
