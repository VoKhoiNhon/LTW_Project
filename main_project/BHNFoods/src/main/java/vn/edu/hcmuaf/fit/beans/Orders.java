package vn.edu.hcmuaf.fit.beans;

import java.time.LocalDateTime;

public class Orders {
    private String url;
    private String namePr;
    private int priceHere;
    private int amount;
    private LocalDateTime timeOrders;
    private byte condition;
    private String idOrders;

    public Orders() {

    }

    public Orders(String url, String namePr, int priceHere, int amount, LocalDateTime timeOrders, byte condition, String idOrders) {
        this.url = url;
        this.namePr = namePr;
        this.priceHere = priceHere;
        this.amount = amount;
        this.timeOrders = timeOrders;
        this.condition = condition;
        this.idOrders = idOrders;
    }

    public String getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(String idOrders) {
        this.idOrders = idOrders;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNamePr() {
        return namePr;
    }

    public void setNamePr(String namePr) {
        this.namePr = namePr;
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

    public LocalDateTime getTimeOrders() {
        return timeOrders;
    }

    public void setTimeOrders(LocalDateTime timeOrders) {
        this.timeOrders = timeOrders;
    }

    public byte getCondition() {
        return condition;
    }

    public void setCondition(byte condition) {
        this.condition = condition;
    }
}

