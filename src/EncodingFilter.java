import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/10/31  13:09
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebFilter(filterName = "EncodingFilter")
public class EncodingFilter implements Filter {

   // private static final long serialVersionUID=1L;

    public void destroy() {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {}

}
