package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.Product;

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
            return handle.createQuery("SELECT * FROM product").mapToBean(Product.class).collect(Collectors.toList());
        });

   }
    public static void main(String[] args) {
        List<Product> list = (List<Product>) getAll();
        for (Product p: list) {
            System.out.println(p.getNamePr());
        }
    }
}
