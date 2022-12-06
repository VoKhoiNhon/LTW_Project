package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Product implements Serializable {
    private String idPr;
    private String idMenu;
    private int discount;
    private  int price;
    private  String namePr;

    private String url;

    public Product() {
    }

    public Product(String idPr, String idMenu, int discount, int price, String namePr) {
        this.idPr = idPr;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePr = namePr;
    }

    public Product(String idPr, String idMenu, int discount, int price, String namePr, String url) {
        this.idPr = idPr;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePr = namePr;
        this.url = url;
    }

    public String getIdPr() {
        return idPr;
    }

    public String getIdMenu() {
        return idMenu;
    }

    public int getDiscount() {
        return discount;
    }

    public int getPrice() {
        return price;
    }

    public String getNamePr() {
        return namePr;
    }

    public void setIdPr(String idPr) {
        this.idPr = idPr;
    }

    public void setIdMenu(String idMenu) {
        this.idMenu = idMenu;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setNamePr(String namePr) {
        this.namePr = namePr;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
