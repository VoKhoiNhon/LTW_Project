package vn.edu.hcmuaf.fit.beans;

public class SoldProductInMonthOfYear {
    int month;
    int year;
    String ID_PR;
    int total;

    public SoldProductInMonthOfYear() {
    }

    public SoldProductInMonthOfYear(int month, int year, String ID_PR, int total) {
        this.month = month;
        this.year = year;
        this.ID_PR = ID_PR;
        this.total = total;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getID_PR() {
        return ID_PR;
    }

    public void setID_PR(String ID_PR) {
        this.ID_PR = ID_PR;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "{month: " + month + ", year: " + year + ", idProduct: " +  ID_PR + ", total: " + total + "}";
    }
}
