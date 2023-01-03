package vn.edu.hcmuaf.fit.beans;

import java.sql.Date;

public class Feedback {
    String idUser;
    String nameUser;
    int scoreStar;
    String text;
    Date date;

    public Feedback() {
    }

    public Feedback(String idUser, String nameUser, int scoreStar, String text, Date date) {
        this.idUser = idUser;
        this.nameUser = nameUser;
        this.scoreStar = scoreStar;
        this.text = text;
        this.date = date;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public int getScoreStar() {
        return scoreStar;
    }

    public void setScoreStar(int scoreStar) {
        this.scoreStar = scoreStar;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
