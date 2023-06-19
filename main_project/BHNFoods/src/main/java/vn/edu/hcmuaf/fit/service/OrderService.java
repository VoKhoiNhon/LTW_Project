package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.IdOrder;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class OrderService {
    public OrderService() {
    }

    private static OrderService instance;
    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }
    public void addToOrder(String idOrder,String name, String phone, String address, String timOrder, String timePickup, String note, int condition) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO orders VALUES('"+idOrder+"','"+name+"','"+phone+"','"+address+"','"+timOrder+"','"+timePickup+"','"+note+"',"+condition+")" ).execute();
        });
    }
    public String generateIdOrder() {
        int num;
        List<IdOrder> idOrders = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id_Orders from orders").mapToBean(IdOrder.class).collect(Collectors.toList());
        });
        num = idOrders.size() + 1;

        return "orders" + num;
    }
    public String[] getListIDPrInOrder(String idOrder) {
        String query = "SELECT ID_PR FROM sold_pr  WHERE ID_ORDERS = '"+idOrder+"'";
        List<String> list= JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(query)
                    .mapTo(String.class)
                    .list();
        });
        String[] array = list.toArray(new String[0]);
        return array;

    }


    public String formatDateTimeNow() {
        LocalDateTime date = LocalDateTime.now();
        return date.getYear() + "-" + date.getMonthValue() + "-" + date.getDayOfMonth() + " " + date.getHour() + ":" + date.getMinute() + ":" + date.getSecond();
    }

    public String formatDateTime(int i) {
        List<Integer> thang31Ngay = new ArrayList<>();
        List<Integer> thang30Ngay = new ArrayList<>();
        thang31Ngay.add(1);
        thang31Ngay.add(3);
        thang31Ngay.add(5);
        thang31Ngay.add(7);
        thang31Ngay.add(8);
        thang31Ngay.add(10);
        thang31Ngay.add(12);
        thang30Ngay.add(4);
        thang30Ngay.add(6);
        thang30Ngay.add(9);
        thang30Ngay.add(11);
        LocalDateTime date = LocalDateTime.now();
        int ngay = date.getDayOfMonth();
        int thang = date.getMonthValue();
        int nam = date.getYear();
        if(thang31Ngay.contains(thang)) {
            if(ngay + i > 31) {
                ngay = i - (31 - ngay);
                if(thang + 1 > 12) {
                    thang = 1;
                    nam +=1;
                } else thang +=1;
            } else ngay += i;
        } else if(thang30Ngay.contains(thang)){
            if(ngay + i > 30) {
                ngay = i - (31 - ngay);
                if(thang + 1 > 12) {
                    thang = 1;
                    nam +=1;
                } else thang +=1;
            } else ngay += i;
        } else if(thang == 2 && isNamNhuan(nam)) {
            if(ngay + i > 29) {
                ngay = i - (29 - ngay);
                if(thang + 1 > 12) {
                    thang = 1;
                    nam +=1;
                } else thang +=1;
            } else ngay += i;
        } else {
            if(ngay + i > 28) {
                ngay = i - (28 - ngay);
                if(thang + 1 > 12) {
                    thang = 1;
                    nam +=1;
                } else thang +=1;
            } else ngay += i;
        }

        return nam + "-" + thang + "-" + ngay;
    }

    public boolean isNamNhuan(int year) {
        boolean namNhuan = false;
        if(year % 4 == 0){
            if(year % 100 == 0){
                if(year % 400 == 0){
                    namNhuan = true;
                }
            } else {
                namNhuan = true;
            }
        }
        return namNhuan;
    }
public int getWeightOrder(String idOrder){

    String query = "SELECT SUM(c.WEIGHT*1000) FROM sold_pr s, ct_pr c  WHERE s.ID_PR=c.ID_PR AND ID_ORDERS = '"+idOrder+"'";
    List<Integer> list= JDBIConnector.get().withHandle(handle -> {
        return handle.createQuery(query)
                .mapTo(Integer.class)
                .list();
    });
    return list.get(0);

}

    public static void main(String[] args) {
        System.out.println( OrderService.getInstance().getWeightOrder("orders1"));
    }
    public void changeConditionOrder(String idOrder, int condition) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE orders SET `CONDITION` = "+condition+" WHERE ID_ORDERS = '"+idOrder+"'" ).execute();
        });
    }
}
