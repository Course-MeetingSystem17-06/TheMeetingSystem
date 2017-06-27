package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import service.EmployeeService;

public class LoginServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获得JSP页面的请求参数
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		String username1 = null;
		String password1 = null;
		String code=request.getParameter("code");

		// 获得JSP页面的时间信息
		String timelength = request.getParameter("timelength");
		int days = 0;
		if (timelength != null) {
			days = Integer.parseInt(timelength);
		}
		if (days != 0) {
			Cookie usernamecookie = new Cookie("username", username);
			Cookie passwordcookie = new Cookie("pwd", password);
			usernamecookie.setMaxAge(days * 24 * 3600);
			passwordcookie.setMaxAge(days * 24 * 3600);
			response.addCookie(usernamecookie);
			response.addCookie(passwordcookie);
		}
		if(code!=null&&code.equals("exit")){
			 Cookie[] cookies = request.getCookies();
		      try
		      {
		           for(int i=0;i<cookies.length;i++)  
		           {
		        	   if(cookies[i].getName().equals("username") || cookies[i].getName().equals("password")){
		        		      cookies[i].setValue(null);
		        		      cookies[i].setMaxAge(0);
		        		      response.addCookie(cookies[i]);
		        		 }
		           }
		      }catch(Exception ex)
		      {
		           System.out.println("清空Cookies发生异常！");
		      } 
		     
		    
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 调用Service层的业务逻辑方法
		EmployeeService service = new EmployeeService();
		int flag = service.login(username, password);

		// 根据业务逻辑方法不同返回值，跳转到不同页面，同时传递不同的提示信息属性
		if (flag == 1) {
			// 获得会话对象
			HttpSession session = request.getSession();
			// 把登录成功的员工姓名保存到会话中
			session.setAttribute("employeename", service.getLoginedEmployee()
					.getEmployeename());

			// 根据角色跳转到不同页面
			// 1、管理员 2、普通员工
			String role = service.getLoginedEmployee().getRole();
			if (role.equals("1")) {
				request.getRequestDispatcher("adminindex.jsp").forward(request,
						response);
			}
			if (role.equals("2")) {
				request.getRequestDispatcher("employeeindex.jsp").forward(
						request, response);
			}
		} else {
			if (flag == 0) {
				request.setAttribute("msg", "正在审核，请耐心等待。");
			}

			if (flag == 2) {
				request.setAttribute("msg", "审核未通过，请核实后重新注册。");
			}

			if (flag == 3) {
				request.setAttribute("msg", "用户名或密码错误，请重试。");
			}
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
		}
	}

}