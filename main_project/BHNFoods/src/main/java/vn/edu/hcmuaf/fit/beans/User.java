package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
    private String idUser;
    private String address;
    private String passw;
    private String nameUser;
    private String phone;
    private String email;
    private Date birthday;
    private Date dateSignup;
    private boolean sex;
    private byte decentralization;
    public User(){}

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
    }

    public byte getDecentralization() {
        return decentralization;
    }

    public void setDecentralization(byte decentralization) {

        this.decentralization = decentralization;
    }
    public String checkDecentralization( ){
        if(this.decentralization==0) return "User";
        return "Admin";
    }

}