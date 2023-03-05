package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.LoveProdService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToLoveProd", value = "/addToLoveProd")
public class AddToLoveProd extends HttpServlet {
    String src ="love Product";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        int condition = Integer.parseInt(request.getParameter("condition"));
        if(condition == 0) {
            LoveProdService.getInstance().deleteFromLike(idUser,idProd);
            if (idUser == null) {
                DB.me().insert(new Log(Log.INFO, null, this.src, "remove lovePr : " +idProd, 0));
            } else DB.me().insert(new Log(Log.INFO, idUser, this.src,  "remove lovePr: "+idProd, 0));
        }else {
            LoveProdService.getInstance().insertToLike(idUser,idProd);
            if (idUser == null) {
                DB.me().insert(new Log(Log.INFO, null, this.src, "add lovePr : " +idProd, 0));
            } else DB.me().insert(new Log(Log.INFO, idUser, this.src,  "add lovePr: "+idProd, 0));
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
