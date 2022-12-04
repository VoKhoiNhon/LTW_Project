package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.List;

public class Product implements Serializable {
    private String idPro;
    private String idMenu;
    private int discount;
    private  int price;
    private  String namePro;

    public Product(String idPro, String idMenu, int discount, int price, String namePro) {
        this.idPro = idPro;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePro = namePro;
    }

    public String getIdPro() {
        return idPro;
    }

    public String getIdMenu() {
        return idMenu;
    }

    public int getDiscount() {
        return discount;
    }

    public double getPrice() {
        return price;
    }

    public String getNamePro() {
        return namePro;
    }


}
