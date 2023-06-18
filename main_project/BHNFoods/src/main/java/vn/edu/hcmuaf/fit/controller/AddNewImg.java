package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.RandomOTP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import static java.lang.System.out;

@WebServlet(name = "AddNewImg", value = "/AddNewImg")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AddNewImg extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "D:\\hk1nam3\\LTW\\GitHub\\main_project\\BHNFoods\\src\\main\\webapp\\ImageproductNew\\add";
        private static final String UPLOAD_DIRECTORY_Tomcat = "D:\\hk1nam3\\LTW\\apache-tomcat-9.0.68\\apache-tomcat-9.0.68\\webapps\\ImageproductNew\\add";
    //    private static final String UPLOAD_DIRECTORY = "/var/lib/tomcat9/webapps/BHNFoods/ImageproductNew/add";
    private static final long serialVersionUID = 1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int count = 0;
        String idprod = request.getParameter("id");
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
                out.println(fileUrl);
                count++;
                ProductService.getInstance().addImg(idprod, RandomOTP.generateRandomString() + count, fileUrl, 1);
            }
        }
        response.sendRedirect("/BHNFoods/ShowProductToUpdate?id=" + idprod);
    }
}