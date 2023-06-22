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
            response.sendRedirect("/");
        }
        if (user.getDecentralization() != Powers.ADMIN)
            response.sendRedirect("/");
        else {
            String name = request.getParameter("name");
            System.out.println(name);
            List<User> list = UserService.getInstance().search(name);
            String result = "";
            for (User u : list) {
                result += "  <tr>\n" +
                        "                                                                    <td>\n" +
                        "                                                                        <div class=\"d-flex \">\n" +
                        "                                                                            <img src=\"ImageproductNew/background/images.png\"\n" +
                        "                                                                                 alt=\"\">\n" +
                        "                                                                            <div>\n" +
                        "                                                                                <h6>"+u.getNameUser()+"\n" +
                        "                                                                                </h6>\n" +
                        "                                                                                <p>"+u.checkDecentralization()+"\n" +
                        "                                                                                </p>\n" +
                        "                                                                            </div>\n" +
                        "                                                                        </div>\n" +
                        "                                                                    </td>\n" +
                        "                                                                    <td>\n" +
                        "                                                                        <h6>"+u.getPhone()+"\n" +
                        "                                                                        </h6>\n" +
                        "                                                                        <p>"+u.getEmail()+"\n" +
                        "                                                                        </p>\n" +
                        "                                                                    </td>\n" +
                        "                                                                    <td>\n" +
                        "                                                                    </td>\n" +
                        "                                                                    <td>\n" +
                        "                                                                        <div class=\"\">"+u.getAddress()+"\n" +
                        "                                                                        </div>\n" +
                        "                                                                    </td>\n" +
                        "                                                                    <td>\n" +
                        "                                                                        <div class=\"btn_edit\">\n" +
                        "                                                                            <button onclick=\"clickEdit('"+u.getIdUser()+"','"+u.getNameUser()+"','"+u.getPassw()+"','"+u.getEmail()+"','"+u.getPhone()+"','"+u.getDateSignup()+"','"+u.getAddress()+"')\">\n" +
                        "                                                                                <h4 class=\"card-title card-title-dash\">\n" +
                        "                                                                                    Xem <i\n" +
                        "                                                                                        class=\"fa-regular fa-pen-to-square\"></i>\n" +
                        "                                                                                </h4></button>\n" +
                        "                                                                        </div>\n" +
                        "                                                                    </td>\n" +
                        "                                                                </tr>";
            }
            System.out.println(result);
            response.getWriter().println(result);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
