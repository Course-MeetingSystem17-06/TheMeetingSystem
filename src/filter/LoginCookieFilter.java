package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * 在配置文件里进行配置才能使用过滤器。 LoginCookieFilter过滤的是login.jsp,当我们之后再去访问login.jsp的时候，
 * 其实是先把请求和响应交给了LoginCookieFilter
 * LoginCookieFilter做什么？就看看有没有cookie。如果有，就不用输入账户名和密码，
 * 直接取出cookie里的账户和密码跳转到loginservlet。 怎么把cookie存进来呢？是在LoginServlet里来处理的。
 * 
 */
public class LoginCookieFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;

		String username = null;
		String password = null;

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					username = cookie.getValue();
				}

				if (cookie.getName().equals("pwd")) {
					password = cookie.getValue();
				}
			}
		}

		if (username == null || password == null) {
			arg2.doFilter(arg0, arg1);
		} else {
			request.getRequestDispatcher("LoginServlet?username=" + username + "&pwd=" + password).forward(arg0, arg1);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
