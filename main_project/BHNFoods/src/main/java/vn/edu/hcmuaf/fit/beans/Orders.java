package vn.edu.hcmuaf.fit.beans;

import java.time.LocalDateTime;

public class Orders {
    private String idOrders;
    private String phone;
    private String address;
    private LocalDateTime timeOrders;
    private LocalDateTime timePickup;
    private  String note;
    private byte condition;
    private Product

    public Orders(String idOrders, String phone, String address, LocalDateTime timeOrders, LocalDateTime timePickup, String note, byte condition) {
        this.idOrders = idOrders;
        this.phone = phone;
        this.address = address;
        this.timeOrders = timeOrders;
        this.timePickup = timePickup;
        this.note = note;
        this.condition = condition;
    }
    public  Orders(){

    }

    public String getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(String idOrders) {
        this.idOrders = idOrders;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getTimeOrders() {
        return timeOrders;
    }

    public void setTimeOrders(LocalDateTime timeOrders) {
        this.timeOrders = timeOrders;
    }

    public LocalDateTime getTimePickup() {
        return timePickup;
    }

    public void setTimePickup(LocalDateTime timePickup) {
        this.timePickup = timePickup;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public byte getCondition() {
        return condition;
    }

    public void setCondition(byte condition) {
        this.condition = condition;
    }
}
