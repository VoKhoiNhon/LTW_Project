package vn.edu.hcmuaf.fit.beans;

public class Like {
    String idPr;
    String idUser;

    public Like() {
    }

    public Like(String idPr, String idUser) {
        this.idPr = idPr;
        this.idUser = idUser;
    }

    public String getIdPr() {
        return idPr;
    }

    public void setIdPr(String idPr) {
        this.idPr = idPr;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }
}
