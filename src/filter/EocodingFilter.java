package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/26  12:13
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebFilter(filterName = "EocodingFilter")
public class EocodingFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
