package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminManageUser", value = "/AdminManageUser")
public class AdminManageUser extends HttpServlet {
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
            List<User> list = UserService.getInstance().getListUser();
            request.setAttribute("listUser", list);
            request.getRequestDispatcher("manage_user.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
