package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.util.ExportLog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "ExportLogPDF", value = "/ExportLogPDF")
public class ExportLogPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// ...
// Thiết lập thông tin của HTTP response
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"file.pdf\"");

// Ghi dữ liệu file vào OutputStream của HTTP response
        OutputStream outputStream = response.getOutputStream();
// Code ghi dữ liệu file vào outputStream ở đây
        ExportLog.getFilePDF(outputStream);
// ...
        outputStream.flush();
        outputStream.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
