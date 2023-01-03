package vn.edu.hcmuaf.fit.beans;

import java.time.LocalDateTime;

public class Contact {
    String iduser;
    String nameUser;
    String email;
    String phone;
    String content;
    LocalDateTime dateTime;

    public Contact(){

    }

    public Contact(String iduser, String nameUser, String email, String phone, String content, LocalDateTime dateTime) {
        this.iduser = iduser;
        this.nameUser = nameUser;
        this.email = email;
        this.phone = phone;
        this.content = content;
        this.dateTime = dateTime;
    }

    public String getIduser() {
        return iduser;
    }

    public void setIduser(String iduser) {
        this.iduser = iduser;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "iduser='" + iduser + '\'' +
                ", nameUser='" + nameUser + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                ", dateTime=" + dateTime +
                '}';
    }
}
