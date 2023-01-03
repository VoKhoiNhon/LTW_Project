package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.LoveProdService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveFromLove", value = "/removeFromLove")
public class RemoveFromLove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("idUser");
        LoveProdService.getInstance().deleteFromLike(idUser, idProd);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
