package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.util.stream.Collectors;

public class CommentService {

    public CommentService() {
    }

    private static CommentService instance;
    public static CommentService getInstance() {
        if (instance == null) {
            instance = new CommentService();
        }
        return instance;
    }

    public void insertComment(String idUser, String idPr, int score, String text, String date) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO feed_back values ('"+idUser+"','"+idPr+"',"+score+",'"+text+"','"+date+"')").execute();
        });
    }
}
