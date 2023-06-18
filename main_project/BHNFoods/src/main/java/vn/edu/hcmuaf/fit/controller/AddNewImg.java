package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import static java.lang.System.out;

@WebServlet(name = "AddNewImg", value = "/AddNewImg")
public class AddNewImg extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "D:\\hk1nam3\\LTW\\GitHub\\main_project\\BHNFoods\\src\\main\\webapp\\ImageproductNew\\add";
    //    private static final String UPLOAD_DIRECTORY = "/var/lib/tomcat9/webapps/BHNFoods/ImageproductNew/add";
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
            out.println(1);
            if (filePart.getName().equals("imageFiles")) {
                out.println(2);
                String fileName = filePart.getSubmittedFileName();
                out.println(3);
                Path filePath = Path.of(UPLOAD_DIRECTORY, fileName);
                out.println(4);
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                    out.println(5);
                }
                String fileUrl = "ImageproductNew/add/" + fileName;
                out.println(fileUrl);
                count++;
                ProductService.getInstance().addImg(idprod, brand + count, fileUrl, 1);
            }
        }
    }
}