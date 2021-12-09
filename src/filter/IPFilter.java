package filter;

/**
 * 过滤IP的过滤器
 */
import model.IPFilterService;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class IPFilter implements Filter {

    protected String fip = "10.106.1.24";// 要过滤的IP
    protected FilterConfig fcon = null;// 过滤器配置对象

    @Override
    public void destroy() {
        System.out.println("FilterIP 过滤器销毁");
        this.fcon = null;
    }

    /**
     * 执行过滤方法
     *
     * @author admin
     * @param request
     *            请求对象
     * @param response
     *            响应对象
     * @param chain
     *            过滤器对象
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        System.out.println("FilterIP 过滤器执行过滤方法");
        response.setContentType("text/html");
        response.setCharacterEncoding("gb2312");
        // 得到请求的IP地址 和要过滤的Ip地址进行对比
        String ip = request.getRemoteAddr();
        IPFilterService ipfs = new IPFilterService();
        if(ip.equals("0:0:0:0:0:0:0:1")){
            ip = "127.0.0.1";
        }
        System.out.println("访问者ip："+ip+ipfs.ip_query(ip));
        request.setAttribute("ip",ip);
        if (ipfs.ip_query(ip)) {
            // 对方就是要过滤的对象 不能访问
            String path = "/pages/BlacklistError.jsp";
            RequestDispatcher desc = request.getRequestDispatcher(path);
            desc.forward(request, response);
        } else {
            // 不是 就将过滤器加到过滤链
            chain.doFilter(request, response);
        }
    }

    @Override//初始化
    public void init(FilterConfig config) throws ServletException {
        System.out.println("FilterIP 过滤器初始化");
        this.fcon = config;
        fip = fcon.getInitParameter("FilteredIP");//[^1]
        if (fip == null) {
            fip = "";
        }
    }

}
