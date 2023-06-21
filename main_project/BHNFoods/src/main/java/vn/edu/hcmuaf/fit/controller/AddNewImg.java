package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.RandomOTP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import static java.lang.System.out;

@WebServlet(name = "AddNewImg", value = "/AddNewImg")
public class AddNewImg extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "D:\\hk1nam3\\LTW\\GitHub\\main_project\\BHNFoods\\src\\main\\webapp\\ImageproductNew\\add";
    private static final String UPLOAD_DIRECTORY_Tomcat = "D:\\hk1nam3\\LTW\\GitHub\\main_project\\BHNFoods\\target\\BHNFoods\\ImageproductNew\\add";
//        private static final String UPLOAD_DIRECTORY = "/var/lib/tomcat9/webapps/BHNFoods/ImageproductNew/add";
    private static final long serialVersionUID = 1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int count = 0;
        String idprod = request.getParameter("id");
        String brand = request.getParameter("brand");
        for (Part filePart : request.getParts()) {

            if (filePart.getName().equals("imageFiles")) {

                String fileName = filePart.getSubmittedFileName();
                Path filePath1 = Path.of(UPLOAD_DIRECTORY_Tomcat, fileName);

                Path filePath = Path.of(UPLOAD_DIRECTORY, fileName);

                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                    Files.copy(fileContent, filePath1, StandardCopyOption.REPLACE_EXISTING);

                }
                String fileUrl = "ImageproductNew/add/" + fileName;

                count++;
                ProductService.getInstance().addImg(idprod, RandomOTP.generateRandomString() + count, fileUrl, 1);
                String fileUrlEncoded = URLEncoder.encode(fileUrl, StandardCharsets.UTF_8);

                request.setAttribute("fileUrlEncoded", fileUrlEncoded);
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("auth");
                DB.me().insert(new Log(Log.INFO,user.getIdUser(), "/AddNewImg",  "add Img for : "+idprod, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
            }
        }
        request.getRequestDispatcher("/ShowProductToUpdate?id=" + idprod).forward(request,response);
    }
}