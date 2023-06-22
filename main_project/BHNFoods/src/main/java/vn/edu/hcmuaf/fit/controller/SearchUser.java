package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.service.WarehouseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchUser", value = "/SearchUser")
public class SearchUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.sendRedirect("/`");
        }
        if (user.getDecentralization() != Powers.EMPLOYEE)
            response.sendRedirect("/`");
        else {
            String name = request.getParameter("name");
            List<vn.edu.hcmuaf.fit.beans.User> list = UserService.getInstance().search(name);
            String result = "";
            for (User w : list) {


                result += "";
            }
            response.getWriter().println(result);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("searchUser");
        List<User> username = UserService.getInstance().searchUser(search);

        if(username.size()!=0){
            request.setAttribute("listSearchUser", username);
            request.getRequestDispatcher("searchManageUser.jsp").forward(request,response);
        }else{
            request.setAttribute("err", "không tìm thấy User nào có tên như vậy");
            request.getRequestDispatcher("searchManageUser.jsp").forward(request,response);
        }

    }
}
