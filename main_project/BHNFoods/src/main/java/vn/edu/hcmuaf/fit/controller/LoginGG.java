package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import com.restfb.json.JsonObject;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.beans.ConstantsGG;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginGG", value = "/LoginGG")
public class LoginGG extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        User user = getUserInfo(accessToken);
        System.out.println(user);

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(ConstantsGG.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", ConstantsGG.GOOGLE_CLIENT_ID)
                        .add("client_secret", ConstantsGG.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", ConstantsGG.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", ConstantsGG.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = ConstantsGG.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        User googlePojo = new Gson().fromJson(response, User.class);
        return googlePojo;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html; charset= utf8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        System.out.println("dsjdhfjhd");
        UserService.getInstance().addUserGG(name, email, null, id);
        System.out.println("123");
        User user = UserService.getInstance().getLastUser();
        response.sendRedirect("http://localhost:8080/BHNFoods/index?idUser=" + user.getIdUser());

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
