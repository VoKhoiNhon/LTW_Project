package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

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
            return handle.createQuery("SELECT w.ID_SHIPMENT, w.CODE_WH, w.DATE_IMPORT_SHIPMENT, w.NAME_EMPLOYEE from warehouse w ")
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
}
