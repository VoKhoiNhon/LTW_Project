package vn.edu.hcmuaf.fit.service;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.beans.User;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
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

    public void addUser(String name, String email, String phone, String pass)  {
        List<User> users = getListUser();
        int count = users.size();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO `user` VALUES( 'user" + (count + 1) + "',NULL,'"
                    + pass + "','" + name+"','" + phone + "','" + email + "'," + "NULL,'2021-12-02', NULL,0)").execute();

        });

    }
}
