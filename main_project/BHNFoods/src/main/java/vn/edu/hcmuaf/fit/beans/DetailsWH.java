package vn.edu.hcmuaf.fit.beans;

import java.util.Date;

public class DetailsWH {
    String ID_SHIPMENT;
    String NAME_PR;
    String NAME_MENU;
    String ID_PR;
    Date DATE_IMPORT_SHIPMENT;
    int PRICE_IMPORT;
    int AMOUNT_PR;
    int WEIGHT_PR;
    String CODE_WH;
    String ID_MENU;
    public DetailsWH(){

    }

    public String getCODE_WH() {
        return CODE_WH;
    }

    public void setCODE_WH(String CODE_WH) {
        this.CODE_WH = CODE_WH;
    }

    public Date getDATE_IMPORT_SHIPMENT() {
        return DATE_IMPORT_SHIPMENT;
    }

    public void setDATE_IMPORT_SHIPMENT(Date DATE_IMPORT_SHIPMENT) {
        this.DATE_IMPORT_SHIPMENT = DATE_IMPORT_SHIPMENT;
    }

    public String getID_MENU() {
        return ID_MENU;
    }

    public void setID_MENU(String ID_MENU) {
        this.ID_MENU = ID_MENU;
    }

    public DetailsWH(String ID_SHIPMENT, String NAME_PR, String NAME_MENU, String ID_PR, Date DATE_IMPORT_SHIPMENT, int PRICE_IMPORT, int AMOUNT_PR, int WEIGHT_PR, String CODE_WH, String ID_MENU) {
        this.ID_SHIPMENT = ID_SHIPMENT;
        this.NAME_PR = NAME_PR;
        this.NAME_MENU = NAME_MENU;
        this.ID_PR = ID_PR;
        this.DATE_IMPORT_SHIPMENT = DATE_IMPORT_SHIPMENT;
        this.PRICE_IMPORT = PRICE_IMPORT;
        this.AMOUNT_PR = AMOUNT_PR;
        this.WEIGHT_PR = WEIGHT_PR;
        this.CODE_WH = CODE_WH;
        this.ID_MENU = ID_MENU;
    }

    public String getNAME_PR() {
        return NAME_PR;
    }

    public void setNAME_PR(String NAME_PR) {
        this.NAME_PR = NAME_PR;
    }

    public String getNAME_MENU() {
        return NAME_MENU;
    }

    public void setNAME_MENU(String NAME_MENU) {
        this.NAME_MENU = NAME_MENU;
    }

    public String getID_SHIPMENT() {
        return ID_SHIPMENT;
    }

    public void setID_SHIPMENT(String ID_SHIPMENT) {
        this.ID_SHIPMENT = ID_SHIPMENT;
    }

    public String getID_PR() {
        return ID_PR;
    }

    public void setID_PR(String ID_PR) {
        this.ID_PR = ID_PR;
    }

    public int getPRICE_IMPORT() {
        return PRICE_IMPORT;
    }

    public void setPRICE_IMPORT(int PRICE_IMPORT) {
        this.PRICE_IMPORT = PRICE_IMPORT;
    }

    public int getAMOUNT_PR() {
        return AMOUNT_PR;
    }

    public void setAMOUNT_PR(int AMOUNT_PR) {
        this.AMOUNT_PR = AMOUNT_PR;
    }

    public int getWEIGHT_PR() {
        return WEIGHT_PR;
    }

    public void setWEIGHT_PR(int WEIGHT_PR) {
        this.WEIGHT_PR = WEIGHT_PR;
    }
}
