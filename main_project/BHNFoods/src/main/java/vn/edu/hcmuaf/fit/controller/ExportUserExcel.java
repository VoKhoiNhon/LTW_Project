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

@WebServlet(name = "ExportUserExcel", value = "/ExportUserExcel")
public class ExportUserExcel extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"file.xlsx\"");
        OutputStream outputStream = response.getOutputStream();
     Export.getFileUserExcel(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}