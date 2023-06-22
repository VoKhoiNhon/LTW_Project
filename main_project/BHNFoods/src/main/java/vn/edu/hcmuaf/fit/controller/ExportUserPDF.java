package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.util.Export;
import vn.edu.hcmuaf.fit.util.ExportLog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "ExportUserPDF", value = "/ExportUserPDF")
public class ExportUserPDF extends HttpServlet {
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

            Export.getFileUserPDF(outputStream);
            outputStream.flush();
            outputStream.close();

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
