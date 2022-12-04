package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Product implements Serializable {
    private String idPro;
    private String idMenu;
    private int discount;
    private  double price;
    private  String namePro;

    public Product(String idPro, String idMenu, int discount, double price, String namePro) {
        this.idPro = idPro;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePro = namePro;
    }
}
