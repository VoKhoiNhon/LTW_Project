package vn.edu.hcmuaf.fit.beans;

public class Social {
    String CONDITION;
    String ID_USER;
    String ID_ACCOUNT;

    public Social() {

    }

    public Social(String CONDITION, String ID_USER, String ID_ACCOUNT) {
        this.CONDITION = CONDITION;
        this.ID_USER = ID_USER;
        this.ID_ACCOUNT = ID_ACCOUNT;
    }

    public String getCONDITION() {
        return CONDITION;
    }

    public void setCONDITION(String CONDITION) {
        this.CONDITION = CONDITION;
    }

    public String getID_USER() {
        return ID_USER;
    }

    public void setID_USER(String ID_USER) {
        this.ID_USER = ID_USER;
    }

    public String getID_ACCOUNT() {
        return ID_ACCOUNT;
    }

    public void setID_ACCOUNT(String ID_ACCOUNT) {
        this.ID_ACCOUNT = ID_ACCOUNT;
    }
}
