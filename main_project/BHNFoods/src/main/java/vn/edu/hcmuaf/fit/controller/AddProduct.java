package vn.edu.hcmuaf.fit.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "AddProduct", value = "/AddProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AddProduct extends HttpServlet {
    InputStream inputStream = null;

    private static final String UPLOAD_DIRECTORY = "D:\\hk1nam3\\LTW\\GitHub\\main_project\\BHNFoods\\src\\main\\webapp\\ImageproductNew\\add";
//    private static final String UPLOAD_DIRECTORY = "/var/lib/tomcat9/webapps/BHNFoods/ImageproductNew/add";
    private static final long serialVersionUID = 1;
    int index = ProductService.getInstance().getListProduct().size();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menu = request.getParameter("menu");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int price = Integer.parseInt(request.getParameter("price"));
        String name = request.getParameter("name");
        String nsx = request.getParameter("nsx");

        String hsd = request.getParameter("hsd");

        String brand = request.getParameter("brand");
        String mota = request.getParameter("mota");
        double weight = Double.parseDouble(request.getParameter("weight"));
        String origin = request.getParameter("origin");
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        int count = 0;
        ProductService.getInstance().addProd(index + 1, menu, discount, price, name);
//        ProductService.getInstance().addCT_Prod(index + 1, nsx, hsd, brand, mota, weight, origin, inventory, "wh1");
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
                ProductService.getInstance().addImg("prod"+index + 1, menu + brand +count,fileUrl,1);
            }
        }



        response.sendRedirect("/BHNFoods/AdminManagePr?kind=0&page=1");
    }


}