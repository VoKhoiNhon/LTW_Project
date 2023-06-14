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

    //lấy thông tin của tk gg
    private String id;
    private  String name;


    public boolean isSex() {
        return sex;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public User(String idUser, String address, String passw, String nameUser, String phone, String email, Date birthday, Date dateSignup, boolean sex, byte decentralization, String id, String name) {
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
        this.id = id;
        this.name = name;
    }

    public User(){}

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

    public boolean getSex() {
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
        if(this.decentralization==2) return "Admin";
        return "Employee";
    }
    public String printCtAccount(String vl){
        if (this.birthday==null || this.phone==null|| this.email==null  || this.address==null ) {
            return "";
        }
        return vl;
    }

    public String toString() {

//        return "User " + "id=" + idUser + ", email=" + email +  ", name=" + nameUser;
        return 		"User [id=" + this.id + ", email=" + this.email  + ", name="
                + this.name  + "]";

    }



}