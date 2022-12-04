package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String idUser;
    private  String address;
    private  String password;
    private String nameUser;
    private  int phone;
    private String email;
    private Date birthday;
    private Date dateSignup;
    private int sex;
    private int permission;

    public User(String idUser, String address, String password, String nameUser, int phone, String email, Date birthday, Date dateSignup, int sex, int permission) {
        this.idUser = idUser;
        this.address = address;
        this.password = password;
        this.nameUser = nameUser;
        this.phone = phone;
        this.email = email;
        this.birthday = birthday;
        this.dateSignup = dateSignup;
        this.sex = sex;
        this.permission = permission;
    }

    public String getIdUser() {
        return idUser;
    }

    public String getAddress() {
        return address;
    }

    public String getPassword() {
        return password;
    }

    public String getNameUser() {
        return nameUser;
    }

    public int getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public Date getDateSignup() {
        return dateSignup;
    }

    public int getSex() {
        return sex;
    }

    public int getPermission() {
        return permission;
    }
}
