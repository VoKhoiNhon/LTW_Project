package vn.edu.hcmuaf.fit.beans;

import java.time.LocalDateTime;

public class Orders {
    private String url;
    private String namePr;
    private int priceHere;
    private int amount;
    private String note;
    private String Name;
    private String address;
    private String phone;
    private String iduser;
    private LocalDateTime timeOrders;
    private byte condition;
    private String idOrders;

    public Orders() {

    }

    public Orders(String url, String namePr, int priceHere, int amount, String note, String name, String address, String phone, String iduser, LocalDateTime timeOrders, byte condition, String idOrders) {
        this.url = url;
        this.namePr = namePr;
        this.priceHere = priceHere;
        this.amount = amount;
        this.note = note;
        Name = name;
        this.address = address;
        this.phone = phone;
        this.iduser = iduser;
        this.timeOrders = timeOrders;
        this.condition = condition;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIduser() {
        return iduser;
    }

    public void setIduser(String iduser) {
        this.iduser = iduser;
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

    public String getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(String idOrders) {
        this.idOrders = idOrders;
    }
}