package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.LogSercive;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListLog", value = "/ListLog")
public class ListLog extends HttpServlet {
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
            List<Log> listlog = LogSercive.getInstance().listLog();
            request.setAttribute("listlog", listlog);
            request.getRequestDispatcher("log.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
