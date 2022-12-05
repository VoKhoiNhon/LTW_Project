package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Product implements Serializable {
    private String idPro;
    private String idMenu;
    private int discount;
    private  int price;
    private  String namePr;

    private String url;

    public Product() {
    }

    public Product(String idPro, String idMenu, int discount, int price, String namePr) {
        this.idPro = idPro;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePr = namePr;
    }

    public Product(String idPro, String idMenu, int discount, int price, String namePr, String url) {
        this.idPro = idPro;
        this.idMenu = idMenu;
        this.discount = discount;
        this.price = price;
        this.namePr = namePr;
        this.url = url;
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

    public int getPrice() {
        return price;
    }

    public String getNamePr() {
        return namePr;
    }

    public void setIdPro(String idPro) {
        this.idPro = idPro;
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
