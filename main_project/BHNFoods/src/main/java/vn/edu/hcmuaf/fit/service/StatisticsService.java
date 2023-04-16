package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.SoldProduct;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.*;

public class StatisticsService {
    private static StatisticsService instance;


    private StatisticsService() {
    }

    public static StatisticsService getInstance() {
        if (instance == null) {
            instance = new StatisticsService();
        }
        return instance;
    }

    // Lấy ra danh sách browserName và số lần truy cập của nó VD: key: MicrosoftEdge, value: 30;
    public Map<String, Integer> getQuantityBrowser() {
        Map<String, Integer> map = new HashMap<>();
        List<String> listBrowser;
        String sql = "select browserName from log";
        listBrowser = JDBIConnector.get().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(String.class)
                        .list()
        );
        for (String s: listBrowser) {
            if(!map.containsKey(s)) map.put(s, 1);
            else map.put(s, map.get(s) + 1);
        }
        return map;
    }

    // Lấy sô lượt xem của sản phẩm VD: Key:prod1, value 34;
    public Map<String, Integer> getQuantityProduct() {
        Map<String, Integer> map = new HashMap<>();
        List<String> listProduct;
        String sql = "select content FROM log where src = 'Single Product'";
        listProduct = JDBIConnector.get().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(String.class)
                        .list()
        );
        for (String s: listProduct) {
            s = s.replace("View : ", "");
            if(!map.containsKey(s)) map.put(s, 1);
            else map.put(s, map.get(s) + 1);
        }
        return map;
    }

    // Lấy ra user đã xem sản phẩm nào VD: {key: user1, value {prod1, prod2,...}}, {key: user2, value {prod1, prod2,...}}
    public Map<String, Set<String>> getlistViewProductByUser() {
        Map<String, Set<String>> map = new HashMap<>();
        String sql = "select `user`, content from log WHERE src = 'Single Product' and `user` IS NOT NULL";
        List<Log> listViewroduct;
        listViewroduct = JDBIConnector.get().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Log.class)
                        .list()
        );
        for (Log lv: listViewroduct) {
            Set<String> set;
            String idProduct = lv.getContent().replace("View : ", "");
            if(!map.containsKey(lv.getUser())) {
                set = new HashSet<String>();
            }
            else {
                set = map.get(lv.getUser());
            }
            set.add(idProduct);
            map.put(lv.getUser(),set);
        }
        return map;

    }

    // Lấy ra danh sách khách hàng, nhân viên, admin VD: {employee=[vn.edu.hcmuaf.fit.beans.User@421e361, vn.edu.hcmuaf.fit.beans.User@59d4cd39], customer=[vn.edu.hcmuaf.fit.beans.User@389c4eb1]}
    public Map<String, List<User>> getQuantityAllAccount() {
        Map<String, List<User>> map = new HashMap<>();
        String sql = "SELECT ID_USER, NAME_USER, SEX,BIRTHDAY, PHONE, EMAIL, ADDRESS, Decentralization FROM `user`";
        JDBIConnector.get().useHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(User.class)
                        .forEach(u -> {
                            int decentralization = u.getDecentralization();
                            String key;
                            if (decentralization == 2) {
                                key = "admin";
                            } else if (decentralization == 1) {
                                key = "employee";
                            } else {
                                key = "customer";
                            }
                            map.computeIfAbsent(key, k -> new ArrayList<>()).add(u);
                        })
        );
        return map;
    }

    // Lấy ra tổng số tiền đã mua hàng của từng user VD: {user1=560000, user2=4333332, user3=0}
    public Map<String, Integer> getTotalMoneyUserBought() {
        Map<String, Integer> map = new HashMap<>();
        List<User> listUser = UserService.getInstance().getListUser();
        int sum = 0;
        String key;
        for (User u: listUser) {
            key = u.getIdUser();
            List<SoldProduct> soldProductList = ProductService.getInstance().getHistory(u.getIdUser());
            for (SoldProduct s: soldProductList) {
                sum += s.getPriceHere();
            }
            map.put(key, sum);
        }
        return map;
    }


    public static void main(String[] args) {
        Map<String, Integer> map = getInstance().getTotalMoneyUserBought();
        System.out.println(map);
    }
}
