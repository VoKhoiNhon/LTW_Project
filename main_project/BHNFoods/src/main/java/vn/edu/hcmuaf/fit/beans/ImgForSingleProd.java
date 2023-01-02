package vn.edu.hcmuaf.fit.beans;

public class ImgForSingleProd {
    String idPr;
    String idImg;

    String url;
    String condition;

    public ImgForSingleProd() {
    }

    public ImgForSingleProd(String idPr, String idImg, String url, String condition) {
        this.idPr = idPr;
        this.idImg = idImg;
        this.url = url;
        this.condition = condition;
    }

    public String getIdPr() {
        return idPr;
    }

    public void setIdPr(String idPr) {
        this.idPr = idPr;
    }

    public String getIdImg() {
        return idImg;
    }

    public void setIdImg(String idImg) {
        this.idImg = idImg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
