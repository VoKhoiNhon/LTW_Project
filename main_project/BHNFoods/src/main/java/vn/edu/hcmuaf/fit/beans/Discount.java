package vn.edu.hcmuaf.fit.beans;

public class Discount {
    String idCode;
    int soluong;
    String code;
    int number;
    boolean type;
    int minimum;

    public Discount() {
    }

    public Discount(String idCode, int soluong, String code, int number, boolean type, int minimum) {
        this.idCode = idCode;
        this.soluong = soluong;
        this.code = code;
        this.number = number;
        this.type = type;
        this.minimum = minimum;
    }

    public String getIdCode() {
        return idCode;
    }

    public int getSoluong() {
        return soluong;
    }

    public String getCode() {
        return code;
    }

    public int getNumber() {
        return number;
    }

    public boolean isType() {
        return type;
    }

    public int getMinimum() {
        return minimum;
    }

    public void setIdCode(String idCode) {
        this.idCode = idCode;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public void setMinimum(int minimum) {
        this.minimum = minimum;
    }
}
