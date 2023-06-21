package vn.edu.hcmuaf.fit.beans;

import vn.edu.hcmuaf.fit.service.ProductService;

import java.util.List;

public class BoxSizeAndWeight {
    String[] listProductId;

    int width = 10;

    int height = 10;

    int length = 10;

    double weight; // kg

    public BoxSizeAndWeight(String[] listProductId) {
        this.listProductId = listProductId;
        calculateBoxSize();
    }

    public BoxSizeAndWeight() {
    }

    private void calculateWeight() {
        for (String id: listProductId) {
            weight += ProductService.getInstance().getSingleProduct(id).get(0).getWeight();
        }
    }

    private void calculateBoxSize() {
        calculateWeight();
        if(weight > 10) {
            width = 40;
            height = 40;
            length= 40;
        } else if(weight > 5) {
            width = 30;
            height = 30;
            length= 30;
        } else if(weight > 2) {
            width = 20;
            height = 20;
            length= 20;
        }
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }
}
