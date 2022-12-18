package vn.edu.hcmuaf.fit.service;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.User;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

public class UserService {
    private static UserService instance;

    //    private static Map<String,String> users= new HashMap<>();

    private UserService() {
    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    public User checkLogin(String username, String password) {
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT ID_USER,PASSW,NAME_USER, PHONE, EMAIL,DATE_SIGNUP,Decentralization FROM user WHERE EMAIL = ? or PHONE=?")
                        .bind(0, username).bind(1, username)
                        .mapToBean(User.class).stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        if (!user.getPassw().equals((password))
                || !(user.getEmail().equals(username) || (user.getPhone().equals(username)))) {
            return null;
        }
        return user;
    }

    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }


    public List<User> getListUser() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from user")
                    .mapToBean(User.class).collect(Collectors.toList());
        });
    }

    public boolean checkAccountExist(String email, String phone) {
        List<User> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select* from user")
                    .mapToBean(User.class).collect(Collectors.toList());
        });
        for (User u : list) {
            if (email.equals(u.getEmail()) || phone.equals(u.getPhone())) return true;
        }
        return false;

    }

    public void addUser(String name, String email, String phone, String pass) {
        List<User> users = getListUser();
        String importDate = LocalDateTime.now().getYear() + "-" + LocalDateTime.now().getMonthValue() + "-" + LocalDateTime.now().getDayOfMonth();
        int count = users.size();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `user` VALUES( 'user" + (count + 1) + "',NULL,'"
                    + pass + "','" + name + "','" + phone + "','" + email + "'," + "NULL,'" + importDate + "', NULL,0)").execute();

        });

    }

    public void changePass(String email, String phone, String pass) {
        List<User> users = getListUser();
        int count = users.size();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("UPDATE user SET PASSW='" + pass + "'WHERE EMAIL='"
                    + email + "'or PHONE='" + phone + "'").execute();

        });
    }

    public String codeChange() {
        String code = "";
        Random rd = new Random();
        for (int i = 0; i < 6; i++) {
            code += rd.nextInt(10);
        }
        return code;
    }

    public int getNewbie() {
        List<User> l = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from user where Month(DATE_SIGNUP)='" + LocalDateTime.now().getMonthValue() + "'")
                    .mapToBean(User.class).collect(Collectors.toList());
        });
        return l.size();
    }

    public List<User> searchUser(String text) {
        List<User> list = new ArrayList<>();
        for (User u : getListUser()) {
            if (u.getIdUser().toUpperCase().contains(text.toUpperCase()) || u.getNameUser().toUpperCase().contains(text.toUpperCase())|| u.getPhone().toUpperCase().contains(text.toUpperCase())|| u.getEmail().toUpperCase().contains(text.toUpperCase())) {
                list.add(u);
            }
        }
        return list;

    }
    public  void  contact(String iduser, String content){
        JDBIConnector.get().withHandle(handle -> {
           return handle.createUpdate("INSERT INTO contact VALUES('"+iduser+"','"+content+"','"+LocalDateTime.now()+"');").execute();
        });
    }

    public static void main(String[] args) {
        UserService.getInstance().changePass("1111111111", "1111111111", "aaa");
    }
}
