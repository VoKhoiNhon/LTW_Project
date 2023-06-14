package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.util.Export;
import vn.edu.hcmuaf.fit.util.ExportLog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "ExportUserPDF", value = "/ExportUserPDF")
public class ExportUserPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// ...
// Thiết lập thông tin của HTTP response
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"file.pdf\"");

// Ghi dữ liệu file vào OutputStream của HTTP response
        OutputStream outputStream = response.getOutputStream();
// Code ghi dữ liệu file vào outputStream ở đây
        Export.getFileUserPDF(outputStream);
        outputStream.flush();
        outputStream.close();
// ...

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
