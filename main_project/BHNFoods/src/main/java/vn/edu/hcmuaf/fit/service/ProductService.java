package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.Product;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

public class ProductService {
    public static final int GAO = 1;
    public static final int NEP = 2;
    public static final int HAT = 3;
    public static final int BOT = 4;
    public static final int RAU_CU = 5;
    private static ProductService instance;

    private ProductService() {

    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    // Lấy ra sản phẩm theo id
    public List<SingleProduct> getSingleProduct(String idPro) {
        String sql = "SELECT p.NAME_PR, p.PRICE, c.ID_PR, c.NSX, c.HSD, c.BRAND, c.`DESCRIBE`, c.WEIGHT, c.ORIGIN, w.DATE_IMPORT_SHIPMENT as DATE_IMPORT_PR, c.INVENTORY, c.CONDITION_PR, i.URL, p.ID_MENU, p.DISCOUNT " +
                "FROM ct_pr c " +
                "JOIN image i ON i.ID_PR = c.ID_PR " +
                "JOIN product p ON p.ID_PR = c.ID_PR " +
                "JOIN detail_wh detailWh ON c.ID_PR = detailWh.ID_PR " +
                "JOIN warehouse w ON detailWh.ID_SHIPMENT = w.ID_SHIPMENT " +
                "WHERE i.`CONDITION` = 0 AND c.ID_PR = :idPro";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("idPro", idPro)
                    .mapToBean(SingleProduct.class)
                    .list();
        });
    }

    // lấy tất cả hình liên quan đến product theo id
    public List<ImgForSingleProd> getListImgForSingleProduct(String idPro) {
        String sql = "SELECT URL FROM image WHERE image.ID_PR = :idPro";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("idPro", idPro)
                    .mapToBean(ImgForSingleProd.class)
                    .collect(Collectors.toList());
        });
    }
    public void deleteIMG(String URL) {
        String sql = "DELETE FROM image WHERE URL = :url";
        JDBIConnector.get().useHandle(handle -> {
            handle.createUpdate(sql)
                    .bind("url", URL)
                    .execute();
        });
    }

    // Lấy ra phản hồi về sản phẩm theo id
    public List<Feedback> getFeedBack(String idPro) {
        String sql = "SELECT f.ID_USER, u.NAME_USER, f.SCORESTAR, f.TEXT, f.DATE " +
                "FROM feed_back f " +
                "JOIN user u ON u.`ID_USER` = f.ID_USER " +
                "WHERE f.ID_PR = :idPro";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("idPro", idPro)
                    .mapToBean(Feedback.class)
                    .collect(Collectors.toList());
        });
    }


    public List<Feedback> getFeedBackInPage(String idProd, int page) {
        if (page < 1) {
            page = 1;
        }
        List<Feedback> feedbackList = new ArrayList<Feedback>();
        List<Feedback> allFeedbacks = getFeedBack(idProd);
        int n = allFeedbacks.size() - (page - 1) * 3 >= 3 ? 3 : allFeedbacks.size() % 3;
        for (int i = (page - 1) * 3; i < (page - 1) * 3 + n; i++) {
            feedbackList.add(allFeedbacks.get(i));
        }
        return feedbackList;
    }


    // lấy ra danh sách sản phẩm theo loại, nếu không có loại thì lấy tất cả
    public static List<Product> getProductByKind(int kind) {
        switch (kind) {
            case 1:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm1'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 2:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm2'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 3:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm3'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 4:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm4'").mapToBean(Product.class).collect(Collectors.toList());
                });
            case 5:
                return JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm5'").mapToBean(Product.class).collect(Collectors.toList());
                });
        }
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    // lấy ra danh sách product theo loại và phân trang
    public List<Product> getListProdInPage(int kind, int page) {
        List<Product> listProd = getProductByKind(kind);
        if (listProd == null || listProd.isEmpty()) {
            // xử lý trường hợp `kind` không hợp lệ
            return new ArrayList<Product>();
        }
        List<Product> listResult = new ArrayList<Product>();
        int maxPages = (listProd.size() - 1) / 15 + 1; // tính số lượng trang tối đa có thể có
        int start = (page - 1) * 15;
        int end = Math.min(page * 15, listProd.size());
        for (int i = start; i < end; i++) {
            listResult.add(listProd.get(i));
        }
        return listResult;
    }

    public List<Product> getListProdInPage(List<Product> list, int page) {
        List<Product> listResult = new ArrayList<Product>();
        int maxPages = (list.size() - 1) / 15 + 1;
        int start = (page - 1) * 15;
        int end = Math.min(page * 15, list.size());
        for (int i = start; i < end; i++) {
            listResult.add(list.get(i));
        }
        return listResult;
    }


    // lấy ra các sản phẩm liên quan cho 1 product
    public List<Product> getRelatedProducts(String idMenu) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where p.ID_MENU = '" + idMenu + "' and i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    public List<Product> getListDiscountProd() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR where p.DISCOUNT > 0 and i.`CONDITION` = 0").mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    // lấy ra số lượng product theo loại để tính toán phân trang
    public int getSize(int kind) {
        return getProductByKind(kind).size();
    }


    //trang sản phẩm yêu thích
    public List<Product> getListLoveProd(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from `like` l JOIN product p  on l.ID_PR = p.ID_PR join image i on p.ID_PR = i.ID_PR where i.`CONDITION` = 0 and l.ID_USER = '" + idUser + "'")
                    .mapToBean(Product.class).collect(Collectors.toList());
        });
    }


    //danh sach nhap san pham theo ngay
    //trang lịch sử giao dịch

    //danh sach nhap san pham theo ngay
    public List<SingleProduct> getListPrDateImport(int i) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select  p.NAME_PR, w.DATE_IMPORT_SHIPMENT as DATE_IMPORT_PR from ct_pr c join product p on c.ID_PR=p.ID_PR join detail_wh d on d.ID_PR=p.ID_PR join warehouse w on w.ID_SHIPMENT= d.ID_SHIPMENT  ORDER BY w.DATE_IMPORT_SHIPMENT DESC LIMIT " + i)
                    .mapToBean(SingleProduct.class).collect(Collectors.toList());
        });
    }

    // trang lịch sử đơn hàng
    public List<SoldProduct> getHistory(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT s.ID_PR, p.NAME_PR, i.URL, s.ID_USER, s.PRICE_HERE, s.AMOUNT, s.`TIME_SOLD`, s.ID_ORDERS, o.`CONDITION` FROM sold_pr s join product p on p.ID_PR = s.ID_PR JOIN image i on i.ID_PR = s.ID_PR JOIN orders o on o.ID_ORDERS = s.ID_ORDERS where (o.`CONDITION` = 2 or o.`CONDITION` = 3) and i.`CONDITION` = 0 and s.ID_USER = '" + idUser + "'")
                    .mapToBean(SoldProduct.class).collect(Collectors.toList());
        });
    }

    //trang quan ly don hang
    public List<Orders> getManagerOrders(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT i.URL, p.NAME_PR, s.PRICE_HERE, s.AMOUNT, o.TIME_ORDERS, o.`CONDITION` FROM orders o JOIN sold_pr s on o.ID_ORDERS= s.ID_ORDERS JOIN product p on s.ID_PR= p.ID_PR JOIN image i on i.ID_PR=p.ID_PR WHERE (o.`CONDITION`=0 or o.`CONDITION`=1) and i.`CONDITION`=0 and s.`ID_USER`='" + idUser + "'")
                    .mapToBean(Orders.class).collect(Collectors.toList());
        });
    }

    //trang quan ly don hang
    public List<Orders> getManageOrders(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT i.URL, p.NAME_PR, s.PRICE_HERE, s.AMOUNT, o.TIME_ORDERS, o.`CONDITION`, o.ID_ORDERS FROM orders o JOIN sold_pr s on o.ID_ORDERS= s.ID_ORDERS JOIN product p on s.ID_PR= p.ID_PR JOIN image i on i.ID_PR=p.ID_PR  WHERE (o.`CONDITION`=0 or o.`CONDITION`=1) and i.`CONDITION`=0 and s.`ID_USER`= '" + idUser + "'")
                    .mapToBean(Orders.class).collect(Collectors.toList());
        });
    }

    // map quản lý đơn hàng
    public Map<String, List<Orders>> getMapOrder(List<Orders> ordersList) {
        Map<String, List<Orders>> mapResult = new HashMap<String, List<Orders>>();

        for (Orders o : ordersList) {
            if (mapResult.containsKey(o.getIdOrders())) {
                mapResult.get(o.getIdOrders()).add(o);
            } else {
                List<Orders> listOrder = new ArrayList<Orders>();
                listOrder.add(o);
                mapResult.put(o.getIdOrders(), listOrder);
            }
        }

        return mapResult;
    }

    // mao lịch suwr giao dịch
    public Map<String, List<SoldProduct>> getMapHistoryOrders(List<SoldProduct> soldProductList) {
        Map<String, List<SoldProduct>> mapResult = new HashMap<String, List<SoldProduct>>();

        for (SoldProduct s : soldProductList) {
            if (mapResult.containsKey(s.getIdOrders())) {
                mapResult.get(s.getIdOrders()).add(s);
            } else {
                List<SoldProduct> listSold = new ArrayList<SoldProduct>();
                listSold.add(s);
                mapResult.put(s.getIdOrders(), listSold);
            }
        }
        return mapResult;
    }

    // tính tiền hàng trong Lịch sử giao dịch
    public Map<String, Integer> sumHistoryOrder(Map<String, List<SoldProduct>> map) {
        Map<String, Integer> mapResult = new HashMap<String, Integer>();
        int sum = 0;
        for (Map.Entry<String, List<SoldProduct>> entry : map.entrySet()) {
            for (SoldProduct s : entry.getValue()) {
                sum += s.getAmount() * s.getPriceHere();
            }
            mapResult.put(entry.getKey(), sum);
        }
        return mapResult;
    }

    public Map<String, Integer> sumOrder(Map<String, List<Orders>> map) {
        Map<String, Integer> mapResult = new HashMap<String, Integer>();
        for (Map.Entry<String, List<Orders>> entry : map.entrySet()) {
            int sum = 0;
            for (Orders o : entry.getValue()) {
                sum += o.getAmount() * o.getPriceHere();
            }
            mapResult.put(entry.getKey(), sum);
        }
        return mapResult;
    }

    //lấy ra sản phẩm của cart
    public List<Cart> getListCart(String idUser) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select c.ID_PR, p.DISCOUNT,p.PRICE,p.NAME_PR,i.URL,c.AMOUNT from cart c join product p on c.ID_PR=p.ID_PR join image i on i.ID_PR=p.ID_PR where  i.`CONDITION`=0 and c.ID_USER='" + idUser + "'").mapToBean(Cart.class).collect(Collectors.toList());
        });
    }

    // hàm tính tổng ở cart
    public int sumCart(List<Cart> l) {
        int result = 0;
        for (Cart c : l) {
            result += c.getPrice() * c.getAmount();
        }
        return result;
    }

    // format thời gian ngày tháng năm giờ phút
    public String formatTime(LocalDateTime dateTime) {
        return dateTime.getDayOfMonth() + "-" + dateTime.getMonthValue() + "-" + dateTime.getYear() + " " + dateTime.getHour() + ":" + dateTime.getMinute();
    }

    public static List<Product> getListPrNameSearch(String search) {
        List<Product> list = new ArrayList<Product>();
        List<Product> pr = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR").mapToBean(Product.class).collect(Collectors.toList());
        });
        for (Product p : pr) {
            if (p.getNamePr().toUpperCase().contains(search.toUpperCase()) || p.getIdPr().toUpperCase().contains(search.toUpperCase()) || p.getIdMenu().toUpperCase().contains(search.toUpperCase())) {
                list.add(p);
            }
        }
        return list;
    }

    public static List<Product> getListProductByName(String name) {
        String sql = "SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL from product p join image i on p.ID_PR = i.ID_PR WHERE p.NAME_PR like CONCAT('%', :name, '%')";
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("name", name)
                        .mapToBean(Product.class).list()

        );
    }

    public static List<SingleProduct> getListSingleProductByKind(int kind) {

        switch (kind) {
            case 1:
                List<SingleProduct> l1 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm1' GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                List<SingleProduct> l2 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE`, c.HSD,c.CONDITION_PR as saled  from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_MENU = 'm1' and p.ID_PR not in (select s.ID_PR from sold_pr s )  GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                for (SingleProduct s2 : l2) {
                    s2.setSaled("0");
                    l1.add(s2);
                }
                return l1;
            case 2:
                List<SingleProduct> l3 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm2'GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                List<SingleProduct> l4 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,c.CONDITION_PR as saled  from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_MENU = 'm2'and p.ID_PR not in (select s.ID_PR from sold_pr s )GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                for (SingleProduct s2 : l4) {
                    s2.setSaled("0");
                    l3.add(s2);
                }
                return l3;
            case 3:
                List<SingleProduct> l5 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY, c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE`, c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm3'GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                List<SingleProduct> l6 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,c.CONDITION_PR as saled  from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_MENU = 'm3'and p.ID_PR not in (select s.ID_PR from sold_pr s )GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                for (SingleProduct s2 : l6) {
                    s2.setSaled("0");
                    l5.add(s2);
                }
                return l5;
            case 4:
                List<SingleProduct> l7 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY, c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm4'GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                List<SingleProduct> l8 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,c.CONDITION_PR as saled  from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_MENU = 'm4' and p.ID_PR not in (select s.ID_PR from sold_pr s )GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                for (SingleProduct s2 : l8) {
                    s2.setSaled("0");
                    l7.add(s2);
                }
                return l7;
            case 5:
                List<SingleProduct> l9 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0 and p.ID_MENU = 'm5'GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                List<SingleProduct> l10 = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,c.CONDITION_PR as saled   from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_MENU = 'm5'and p.ID_PR  not in (select s.ID_PR from sold_pr s )GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
                });
                for (SingleProduct s2 : l10) {
                    s2.setSaled("0");
                    l9.add(s2);
                }
                return l9;
        }
        List<SingleProduct> l1 = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY, c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD,sum(s.AMOUNT)as saled from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR JOIN sold_pr s on s.ID_PR= p.ID_PR where i.`CONDITION` = 0  GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
        });
        List<SingleProduct> l2 = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL,c.INVENTORY ,c.NSX,c.BRAND,c.ORIGIN, c.WEIGHT, c.`DESCRIBE` , c.HSD ,c.CONDITION_PR as saled  from product p join image i on p.ID_PR = i.ID_PR JOIN ct_pr c ON c.ID_PR=p.ID_PR  where i.`CONDITION` = 0 and p.ID_PR not in (select s.ID_PR from sold_pr s )  GROUP BY p.ID_PR").mapToBean(SingleProduct.class).collect(Collectors.toList());
        });
        for (SingleProduct s2 : l2) {
            s2.setSaled("0");
            l1.add(s2);
        }
        return l1;
    }

    // lấy ra danh sách product theo loại và phân trang
    public List<SingleProduct> getListSingleProdInPage(int kind, int page) {
        List<SingleProduct> listProd = getListSingleProductByKind(kind);
        List<SingleProduct> listResult = new ArrayList<SingleProduct>();
        int start = (page - 1) * 15 < 0 ? 0 : (page - 1) * 15;
        int end = page <= listProd.size() / 15 ? page * 15 : listProd.size() - ((page - 1) * 15) + start;
        for (int i = start; i < end; i++) {
            listResult.add(listProd.get(i));
        }
        return listResult;

    }


    //
    public static List<Product> getListProduct() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT ID_PR,ID_MENU,DISCOUNT,PRICE,NAME_PR FROM product")
                    .mapToBean(Product.class).collect(Collectors.toList());
        });
    }

    public List<SingleProduct> getListProductHostSale() {
        String sql = "SELECT p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, MAX(i.URL) as URL, c.INVENTORY, c.NSX, c.BRAND, c.ORIGIN, c.WEIGHT, c.`DESCRIBE`, c.HSD, SUM(s.AMOUNT) as saled \n" +
                "FROM product p \n" +
                "JOIN image i ON p.ID_PR = i.ID_PR \n" +
                "JOIN ct_pr c ON c.ID_PR = p.ID_PR \n" +
                "JOIN sold_pr s ON s.ID_PR = p.ID_PR \n" +
                "WHERE i.`CONDITION` = 0 \n" +
                "GROUP BY p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, c.INVENTORY, c.NSX, c.BRAND, c.ORIGIN, c.WEIGHT, c.`DESCRIBE`, c.HSD \n" +
                "ORDER BY saled DESC;";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(sql)
                    .mapToBean(SingleProduct.class).collect(Collectors.toList());
        });
    }

    // thêm sp của bản product
    public static void addProd(int index, String menu, int discount, int price, String name) {

         JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `product` VALUES ('prod"+index+"','"+menu+"',"+discount+","+ price+ ", '"+name+"')").execute();
        });
    }
    // thêm sp của bản ct_pr
    public static void addCT_Prod(int index, String nsx, String hsd, String brand, String mota, double weight, String origin, int inventory){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `ct_pr` VALUES ('prod" + index + "','" + nsx + "','" + hsd + "','" + brand + "','" + mota + "'," + weight + ",'" + origin + "','" + LocalDate.now() + "'," + inventory + ", 0)").execute();
        });
    }


    public boolean checkAddPro() {
        return true;
    }


    public int getTurnover(int month, int year) {
        List<Turnover> l = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select sum(s.PRICE_HERE) as turnover   from orders o join sold_pr s on o.ID_ORDERS=s.ID_ORDERS where year(o.TIME_PICKUP)='" + year + "' and  month(o.TIME_PICKUP)= '" + month + "'").mapToBean(Turnover.class).collect(Collectors.toList());
        });
        return l.get(0).getTurnover();
    }
    public  int getAllTurnover() {
        List<Turnover> l= JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select sum(s.PRICE_HERE) as turnover   from orders o join sold_pr s on o.ID_ORDERS=s.ID_ORDERS ").mapToBean(Turnover.class).collect(Collectors.toList());
        });
        return l.get(0).getTurnover();
    }
public int getNowMonth(){
       return  LocalDateTime.now().getMonthValue();
}
public int getNowYer(){
    return  LocalDateTime.now().getYear();


    }

    public int getSalerPR() {
        List<Turnover> l = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select sum(s.AMOUNT) as turnover   from orders o join sold_pr s on o.ID_ORDERS=s.ID_ORDERS where year(o.TIME_PICKUP)='" + LocalDateTime.now().getYear() + "' and  month(o.TIME_PICKUP)= '" + LocalDateTime.now().getMonthValue() + "'").mapToBean(Turnover.class).collect(Collectors.toList());
        });
        return l.get(0).getTurnover();
    }

    public int getStopPr() {
        List<Turnover> l = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select sum(c.CONDITION_PR) as turnover   from ct_pr c where c.CONDITION_PR=1 ").mapToBean(Turnover.class).collect(Collectors.toList());
        });
        return l.get(0).getTurnover();
    }

    public int sumAmount(List<Cart> l) {
        int result = 0;
        for (Cart c : l) {
            result += c.getAmount();
        }
        return result;

    }

    public static List<SingleProduct> getListPrNameSearchADmin(String search) {
        List<SingleProduct> list = new ArrayList<>();
        List<SingleProduct> pr = getListSingleProductByKind(0);
        for (SingleProduct p : pr) {
            if (p.getNamePr().toUpperCase().contains(search.toUpperCase()) || p.getIdPr().toUpperCase().contains(search.toUpperCase()) || p.getBrand().toUpperCase().contains(search.toUpperCase()) || p.getIdMenu().toUpperCase().contains(search.toUpperCase()) || p.getOrigin().toUpperCase().contains(search.toUpperCase())) {
                list.add(p);
            }
        }
        return list;
    }

    //xóa sản phẩm product
    public static void deletePr(String id) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM product WHERE ID_PR='" + id + "'").execute();
        });
    }

    //xóa sản phẩm ct_pr
    public static void deleteCt_pr(String id) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM ct_pr WHERE ID_PR='" + id + "'").execute();
        });
    }

    // update sp bảng product
    public static void updateProduct(String idpr, String menu, int discount, int price, String name) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE  product set  ID_MENU= '" + menu + "', DISCOUNT=" + discount + ", PRICE=" + price + ", NAME_PR='" + name + "' WHERE ID_PR='" + idpr + "'").execute();
        });
    }

    // update sp bảng ct_sp
    public static void updateCt_pr(String idpr, String nsx, String hsd, String brand, String mota, double weight, String origin, int inventory, int condition) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE  ct_pr set NSX='" + nsx + "',HSD='" + hsd + "',BRAND ='" + brand + "',`DESCRIBE`='" + mota + "',WEIGHT=" + weight + ",ORIGIN='" + origin + "',INVENTORY=" + inventory + ",CONDITION_PR=" + condition + " WHERE ID_PR='" + idpr + "';").execute();
        });
    }


    //xem liên hệ của user ở trang admin
    public List<Contact> viewContact(String idcontact) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT c.ID_CONTACT, c.ID_USER,c.NAMEUSER, c.EMAIL, c.PHONE, c.CONTENT, c.`DATETIME`, c.CONDITION FROM  contact c  WHERE c.ID_CONTACT='" + idcontact + "';")
                    .mapToBean(Contact.class).collect(Collectors.toList());
        });
    }

    // đánh dấu đã xem hay chưa
    public static void seenContact(String idcontact, int condition) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE contact set contact.CONDITION=" + condition + " WHERE contact.ID_CONTACT='" + idcontact + "';").execute();
        });
    }

    //số phản hồi chưa xem
    public int sumContact() {
     int result = 0;
     List<Contact> contactList = UserService.getInstance().getListContact();
        for (Contact c: contactList) {
            if(c.getCondition() == 1) result +=1;
        }
        return result;
    }

    
    public void addImg(String idPr, String idImg, String url, int condition) {
        String sql = "INSERT INTO image VALUES (:idPr , :idImg, :url, :condition)";
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate(sql)
                    .bind("idPr", idPr)
                    .bind("idImg", idImg)
                    .bind("url", url)
                    .bind("condition", condition)
                    .execute();
        });
    }


    public void updateInventoryCT_PR(String idProd, int sl) {
        String sql = "UPDATE ct_pr set INVENTORY = (INVENTORY + :sl) where ID_PR = :idProd";
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate(sql)
                    .bind("sl", sl)
                    .bind("idProd", idProd)
                    .execute();
        });
    }

    public Integer getInventoryCT_PR(String idProd) {
        String query = "SELECT inventory FROM ct_pr WHERE ID_PR = :idProd";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(query)
                    .bind("idProd", idProd)
                    .mapTo(Integer.class)
                    .findOne()
                    .orElse(0);
        });
    }

    public List<Contact> viewNameContact() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT u.ID_USER,u.NAME_USER, u.EMAIL, u.PHONE, c.CONTENT, c.`DATETIME` FROM `user` u join contact c ON u.ID_USER= c.ID_USER")
                    .mapToBean(Contact.class).collect(Collectors.toList());
        });
    }

    public static List<Orders> listOrdersAdmin() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT s.ID_USER, s.ID_ORDERS, i.URL, p.NAME_PR, s.PRICE_HERE, s.AMOUNT, o.`NAME`, o.PHONE, o.ADDRESS, o.NOTE, o.TIME_ORDERS, o.`CONDITION` FROM orders o JOIN sold_pr s on o.ID_ORDERS= s.ID_ORDERS JOIN product p on p.ID_PR= s.ID_PR join image i ON i.ID_PR= p.ID_PR WHERE o.`CONDITION`=1 or o.`CONDITION`=0")
                    .mapToBean(Orders.class).collect(Collectors.toList());
        });
    }
    public static List<Orders> gethistoryOrdersAdmin() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT s.ID_USER, s.ID_ORDERS, i.URL, p.NAME_PR, s.PRICE_HERE, s.AMOUNT, o.`NAME`, o.PHONE, o.ADDRESS, o.NOTE, o.TIME_ORDERS, o.`CONDITION` FROM orders o JOIN sold_pr s on o.ID_ORDERS= s.ID_ORDERS JOIN product p on p.ID_PR= s.ID_PR join image i ON i.ID_PR= p.ID_PR WHERE o.`CONDITION`=2 or o.`CONDITION`=3")
                    .mapToBean(Orders.class).collect(Collectors.toList());
        });
    }

    public void UpdateConditionOrders(int condition, String idOrders) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE orders o set o.`CONDITION`=" + condition + " WHERE o.ID_ORDERS='" + idOrders + "'").execute();
        });
    }

    public void  updateUser( String idUser, int decentralization){
        JDBIConnector.get().withHandle(handle -> {
            return   handle.createUpdate("UPDATE `user` u set u.Decentralization= "+decentralization+"  WHERE u.ID_USER='"+idUser+"'").execute();
        });

    }
    public List<String> getAllIdProduct() {
        String query = "SELECT ID_PR FROM ct_pr WHERE CONDITION_PR = 0";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(query)
                    .mapTo(String.class)
                    .list();
        });
    }

    public Product getProductById(String idProduct) {
        String sql = "select p.ID_PR, p.ID_MENU, p.DISCOUNT, p.PRICE, p.NAME_PR, i.URL FROM product p JOIN image i on p.ID_PR = i.ID_PR WHERE i.`CONDITION` = 0 and p.ID_PR = :idProduct";
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("idProduct", idProduct)
                    .mapToBean(Product.class)
                    .one();
        });
    }
    public static void main(String[] args) {
        System.out.println(ProductService.getInstance().getSingleProduct("prod1"));
        System.out.println(ProductService.getInstance().getListPrDateImport(2));
    }
}



