package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import javax.xml.crypto.Data;
import java.awt.*;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class WarehouseService {
    public WarehouseService() {
    }

    private static WarehouseService instance;
    public static WarehouseService getInstance() {
        if (instance == null) {
            instance = new WarehouseService();
        }
        return instance;
    }
    public  List<Warehouse> getListWH(){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT w.ID_SHIPMENT, w.CODE_WH, w.DATE_IMPORT_SHIPMENT, w.NAME_EMPLOYEE from warehouse w  ORDER BY w.DATE_IMPORT_SHIPMENT DESC")
                    .mapToBean(Warehouse.class).collect(Collectors.toList());

        });

    }

//  list chi tiết warehouse bang warehouse
    public List<DetailsWH> getDetail_WH(String id_shipment) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT d.ID_SHIPMENT,p.NAME_PR, d.PRICE_IMPORT, d.AMOUNT_PR, d.WEIGHT_PR, m.NAME_MENU FROM detail_wh d  join product p on p.ID_PR= d.ID_PR JOIN menu m on m.ID_MENU=p.ID_MENU WHERE d.ID_SHIPMENT=:id_shipment")
                    .bind("id_shipment", id_shipment).mapToBean(DetailsWH.class).collect(Collectors.toList());
        });
    }
    public Warehouse getWareHouseById(String id_shipment){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT w.ID_SHIPMENT, w.CODE_WH, w.DATE_IMPORT_SHIPMENT, w.NAME_EMPLOYEE from warehouse w where  w.ID_SHIPMENT=:id_shipment ")
                    .bind("id_shipment",id_shipment)
                    .mapToBean(Warehouse.class).one();

        });
    }

    public static void addWarehouse(int index, String codewh , String date, String employee) {

        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `warehouse` VALUES ('wh"+ index +"', '"+codewh+"', '"+date+"', '"+employee+"');").execute();
        });
    }

    public static void addDetailWh(int index, String idpr , int price, int amount, int weight) {

        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `detail_wh` VALUES ('wh"+ index +"', '"+idpr+"',"+price+" , "+amount+", "+weight+");").execute();

        });
    }
    public List<Product> getProductByIdMenu(String idmenu){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, m.ID_MENU, p.NAME_PR, m.NAME_MENU FROM menu m join product p on p.ID_MENU= m.ID_MENU WHERE p.ID_MENU=:idmenu;")
                    .bind("idmenu",idmenu)
                    .mapToBean(Product.class).collect(Collectors.toList());

        });
    }

}
