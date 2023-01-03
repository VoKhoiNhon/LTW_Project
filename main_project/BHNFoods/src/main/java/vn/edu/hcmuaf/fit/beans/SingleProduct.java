package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class SingleProduct implements Serializable {

    String namePr;

    int price;
    String idPr;
    Date nsx;
    Date hsd;
    String brand;
    String describe;
    double weight;
    String origin;
    Date dateImportPr;
    int inventory;
    byte conditionPr;
    String url;

    String idMenu;
    String saled;
    int discount;

    public SingleProduct() {
    }

    public SingleProduct(String namePr, int price, String idPr, Date nsx, Date hsd, String brand, String describe, double weight, String origin, Date dateImportPr, int inventory, byte conditionPr, String url, String idMenu,String saled, int discount) {
        this.namePr = namePr;
        this.price = price;
        this.idPr = idPr;
        this.nsx = nsx;
        this.hsd = hsd;
        this.brand = brand;
        this.describe = describe;
        this.weight = weight;
        this.origin = origin;
        this.dateImportPr = dateImportPr;
        this.inventory = inventory;
        this.conditionPr = conditionPr;
        this.url = url;
        this.idMenu = idMenu;
        this.saled=saled;
        this.discount= discount;
    }

    public String getNamePr() {
        return namePr;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setNamePr(String namePr) {
        this.namePr = namePr;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIdPr() {
        return idPr;
    }

    public void setIdPr(String idPr) {
        this.idPr = idPr;
    }

    public Date getNsx() {
        return nsx;
    }

    public void setNsx(Date nsx) {
        this.nsx = nsx;
    }

    public Date getHsd() {
        return hsd;
    }

    public void setHsd(Date hsd) {
        this.hsd = hsd;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public Date getDateImportPr() {
        return dateImportPr;
    }

    public void setDateImportPr(Date dateImportPr) {
        this.dateImportPr = dateImportPr;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public byte getConditionPr() {
        return conditionPr;
    }

    public void setConditionPr(byte conditionPr) {
        this.conditionPr = conditionPr;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(String idMenu) {
        this.idMenu = idMenu;
    }

    public String getSaled() {
        return saled;
    }

    public void setSaled(String saled) {
        this.saled = saled;
    }
}

