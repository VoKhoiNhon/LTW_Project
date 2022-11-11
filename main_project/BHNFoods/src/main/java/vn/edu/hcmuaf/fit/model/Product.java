package vn.edu.hcmuaf.fit.model;

public class Product {
    String name;
    int price;
    String src;

    public Product(String name, int price, String src) {
        this.name = name;
        this.price = price;
        this.src = src;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getSrc() {
        return src;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}