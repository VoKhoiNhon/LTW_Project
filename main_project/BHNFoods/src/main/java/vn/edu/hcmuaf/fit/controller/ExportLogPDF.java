package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.User;
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.sendRedirect("/`");
        }
        if (user.getDecentralization() != Powers.ADMIN )
            response.sendRedirect("/`");
        else {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"file.pdf\"");


        OutputStream outputStream = response.getOutputStream();

        ExportLog.getFilePDF(outputStream);

        outputStream.flush();
        outputStream.close();}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
