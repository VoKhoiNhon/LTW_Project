package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "PageError", value = "/!")
public class PageError extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("PageNotFound.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}