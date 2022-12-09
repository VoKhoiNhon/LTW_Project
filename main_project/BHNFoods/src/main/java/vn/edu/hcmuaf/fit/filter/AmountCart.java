package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "AmountCart")
public class AmountCart implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        String idUser = request.getParameter("idUser");
//        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
//        request.setAttribute("aCart",listCart);
//        chain.doFilter(request, response);
    }
}
