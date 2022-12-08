package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
    private String idUser;
<<<<<<< HEAD
    private String address;
    private String passw;
    private String nameUser;
    private String phone;
=======
    private  String address;
    private  String passw;
    private String nameUser;
    private  String phone;
>>>>>>> 729c9be95ad90f92c2bc19682d6e46c0d4c0992c
    private String email;
    private Date birthday;
    private Date dateSignup;
    private boolean sex;
    private byte decentralization;
<<<<<<< HEAD
    public User(){}

=======

    public User() {
    }

>>>>>>> 729c9be95ad90f92c2bc19682d6e46c0d4c0992c
    public User(String idUser, String address, String passw, String nameUser, String phone, String email, Date birthday, Date dateSignup, boolean sex, byte decentralization) {
        this.idUser = idUser;
        this.address = address;
        this.passw = passw;
        this.nameUser = nameUser;
        this.phone = phone;
        this.email = email;
        this.birthday = birthday;
        this.dateSignup = dateSignup;
        this.sex = sex;
        this.decentralization = decentralization;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getDateSignup() {
        return dateSignup;
    }

    public void setDateSignup(Date dateSignup) {
        this.dateSignup = dateSignup;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
<<<<<<< HEAD
=======
    }

    public byte getDecentralization() {
        return decentralization;
    }

    public void setDecentralization(byte decentralization) {
        this.decentralization = decentralization;
>>>>>>> 729c9be95ad90f92c2bc19682d6e46c0d4c0992c
    }

    public byte getDecentralization() {
        return decentralization;
    }

    public void setDecentralization(byte decentralization) {
        this.decentralization = decentralization;
    }
}