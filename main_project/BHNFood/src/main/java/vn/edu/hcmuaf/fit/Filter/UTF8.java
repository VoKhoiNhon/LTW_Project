package vn.edu.hcmuaf.fit.Filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(filterName = "UTF8", value = "/*")
public class UTF8 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        filterChain.doFilter(request,response);
    }
    public void destroy() {
    }


}
