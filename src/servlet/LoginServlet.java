package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmployeeService;

public class LoginServlet extends HttpServlet {
	
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		获得JSP页面的请求参数
		String username=request.getParameter("username");
		String password=request.getParameter("pwd");
//		调用Service层的业务逻辑方法	
		EmployeeService service=new EmployeeService();
		int flag=service.login(username, password);
		
//		根据业务逻辑方法不同返回值，跳转到不同页面，同时传递不同的提示信息属性
		if(flag==1){
//			获得会话对象
			HttpSession session=request.getSession();
//			把登录成功的员工姓名保存到会话中
			session.setAttribute("employeename", service.getLoginedEmployee().getEmployeename());	
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			if(flag==0){
				request.setAttribute("msg", "正在审核，请耐心等待。");
			}
			
			if(flag==2){
				request.setAttribute("msg", "审核未通过，请核实后重新注册。");
			}
			
			if(flag==3){
				request.setAttribute("msg", "用户名或密码错误，请重试。");
			}
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
	}

}