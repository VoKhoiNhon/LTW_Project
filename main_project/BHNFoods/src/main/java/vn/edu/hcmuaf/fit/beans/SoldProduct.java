package vn.edu.hcmuaf.fit.beans;

import java.time.LocalDateTime;

public class SoldProduct {
     String idPro;
     String namePr;
     String url;
    String idUser;
    int priceHere;
    int amount;
    LocalDateTime timeSold;
    String idOrders;
    int condition;

    public SoldProduct() {
    }

    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    public SoldProduct(String idPro, String namePr, String url, String idUser, int priceHere, int amount, LocalDateTime timeSold, String idOrders, int condition) {
        this.idPro = idPro;
        this.namePr = namePr;
        this.url = url;
        this.idUser = idUser;
        this.priceHere = priceHere;
        this.amount = amount;
        this.timeSold = timeSold;
        this.idOrders = idOrders;
        this.condition = condition;
    }

    public String getNamePr() {
        return namePr;
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

    public String getIdPro() {
        return idPro;
    }

    public void setIdPro(String idPro) {
        this.idPro = idPro;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public int getPriceHere() {
        return priceHere;
    }

    public void setPriceHere(int priceHere) {
        this.priceHere = priceHere;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public LocalDateTime getTimeSold() {
        return timeSold;
    }

    public void setTimeSold(LocalDateTime timeSold) {
        this.timeSold = timeSold;
    }

    public String getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(String idOrders) {
        this.idOrders = idOrders;
    }
}
