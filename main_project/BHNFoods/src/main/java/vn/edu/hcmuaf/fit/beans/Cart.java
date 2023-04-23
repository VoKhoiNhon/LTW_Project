package vn.edu.hcmuaf.fit.beans;

public class Cart {
    private String idPr;
    private int discount;
    private int price;
    private String namePr;
    private String url;
    private int amount;

    public Cart() {
    }

    public Cart(String idPr, int discount, int price, String namePr, String url, int amount) {
        this.idPr = idPr;
        this.discount = discount;
        this.price = price;
        this.namePr = namePr;
        this.url = url;
        this.amount = amount;
    }

    public String getIdPr() {
        return idPr;
    }

    public void setIdPr(String idPr) {
        this.idPr = idPr;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}



