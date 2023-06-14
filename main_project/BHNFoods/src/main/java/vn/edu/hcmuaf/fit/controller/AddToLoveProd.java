package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.LoveProdService;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToLoveProd", value = "/addToLoveProd")
public class AddToLoveProd extends HttpServlet {
    String src ="love Product";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if(user == null) { // user chua dang nhap
            if(session.getAttribute("loveProductInSession") == null) { // nếu chưa thich sản phẩm nào
                List<String> listIdProduct = new ArrayList<>();
                listIdProduct.add(idProd);
                session.setAttribute("loveProductInSession", listIdProduct);
            } else { // đã thích ít nhất 1 sản phẩm
                List<String> listLiked = (List<String>) session.getAttribute("loveProductInSession");
                if(listLiked.contains(idProd)) {
                    listLiked.remove(idProd);
                    session.setAttribute("loveProductInSession", listLiked);
                } else {
                    listLiked.add(idProd);
                    session.setAttribute("loveProductInSession", listLiked);
                }

            }
            System.out.println(session.getAttribute("loveProductInSession").toString());
        }
        else { // user đã đăng nhập
            String idUser = user.getIdUser();
            if(LoveProdService.getInstance().checkLiked(idUser, idProd)) {
                LoveProdService.getInstance().deleteFromLike(idUser,idProd);
                DB.me().insert(new Log(Log.INFO, idUser, this.src,  "remove lovePr: "+idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
            }else {
                LoveProdService.getInstance().insertToLike(idUser,idProd);
                DB.me().insert(new Log(Log.INFO, idUser, this.src,  "add lovePr: "+idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
