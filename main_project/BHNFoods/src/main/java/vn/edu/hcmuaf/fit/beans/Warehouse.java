package vn.edu.hcmuaf.fit.beans;

import java.util.Date;

public class Warehouse {
    String id_shipment;
    String code_wh;
    Date date_import_shipment;
    String name_employee;

    public  Warehouse(){

    }

    public Warehouse(String id_shipment, String code_wh, Date date_import_shipment, String name_employee) {
        this.id_shipment = id_shipment;
        this.code_wh = code_wh;
        this.date_import_shipment = date_import_shipment;
        this.name_employee = name_employee;
    }

    public String getId_shipment() {
        return id_shipment;
    }

    public void setId_shipment(String id_shipment) {
        this.id_shipment = id_shipment;
    }

    public String getCode_wh() {
        return code_wh;
    }

    public void setCode_wh(String code_wh) {
        this.code_wh = code_wh;
    }

    public Date getDate_import_shipment() {
        return date_import_shipment;
    }

    public void setDate_import_shipment(Date date_import_shipment) {
        this.date_import_shipment = date_import_shipment;
    }

    public String getName_employee() {
        return name_employee;
    }

    public void setName_employee(String name_employee) {
        this.name_employee = name_employee;
    }
}
