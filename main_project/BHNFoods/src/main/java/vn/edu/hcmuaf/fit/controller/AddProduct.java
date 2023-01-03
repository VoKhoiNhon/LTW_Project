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
import java.net.URL;
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
//    static URL location = AddProduct.class.getProtectionDomain()
//            .getCodeSource().getLocation();
//
//    private static final String UPLOAD_DIRECTORY = location.getFile() +"\\src\\main\\webapp\\ImageproductNew\\add";
//    private static final long serialVersionUID = 1;
//
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("sdfnjsdk");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        if (ServletFileUpload.isMultipartContent(request)) {
//            try {
//                int count = 0, i=3;
//                String path;
//                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//                for (FileItem item : multiparts) {
//                    if (!item.isFormField()) {
//                        String nameImg = new File(item.getName()).getName();
//                        out.println(UPLOAD_DIRECTORY+ File.separator + nameImg);
//                        item.write(new File( UPLOAD_DIRECTORY+ File.separator + nameImg));

//                        String menu = request.getParameter("menu");
//                        int discount = Integer.parseInt(request.getParameter("discount"));
//                        int price = Integer.parseInt(request.getParameter("price"));
//                        String name = request.getParameter("name");
//                        String nsx = request.getParameter("nsx");
//
//                        String hsd = request.getParameter("hsd");
//
//                        String brand = request.getParameter("brand");
//                        String mota = request.getParameter("mota");
//                        double weight = Double.parseDouble(request.getParameter("weight"));
//                        String origin = request.getParameter("origin");
//                        int inventory = Integer.parseInt(request.getParameter("inventory"));
//                        int index = ProductService.getInstance().getListProduct().size();
//                        ProductService.getInstance().addProd(index + 1, menu, discount, price, name);
//                        ProductService.getInstance().addCT_Prod(index + 1, nsx, hsd, brand, mota, weight, origin, inventory);
//                        ProductService.getInstance().addImg(index + 1, menu +i++ , path, count);
//                        out.println("aaaa");
//                        count = 1;
//                    }
//                }
//                request.setAttribute("message", "File uploaded successfully.");
//            } catch (Exception ex) {
//                request.setAttribute("message", "File upload failed due to : " + ex);
//            }
//        } else {
//            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
//        }
//
//        response.sendRedirect("http://localhost:8080/BHNFoods/AdminManagePr?kind=0&page=1");
    }

}
