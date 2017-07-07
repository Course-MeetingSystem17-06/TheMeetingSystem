package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartmentDAO;
import vo.Department;

public class ViewAllDepartmentsServlet extends HttpServlet {

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
		
		DepartmentDAO dao=new DepartmentDAO();
		
		List<Department> DepartmentsList=dao.selectAll();
		request.setAttribute("departmentsList", DepartmentsList);
		//System.out.println("111");
		String code=request.getParameter("code");
		
		if(code!=null&&code.equals("regist")){
			request.getRequestDispatcher("n_register.jsp").forward(request, response);
		}
		if(code!=null&&code.equals("viewalldepartments")){
			request.getRequestDispatcher("departments.jsp").forward(request, response);
			}

	}

}
