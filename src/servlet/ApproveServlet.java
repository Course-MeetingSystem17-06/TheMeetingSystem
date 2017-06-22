package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;

public class ApproveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int employeeid = Integer.parseInt(request.getParameter("employeeid"));
		String oper = request.getParameter("oper");
//		opration为yes通过,状态satus设置为1,审核通过
//		opration为no不通过,状态satus设置为2,审核不通过
		EmployeeDAO dao = new EmployeeDAO();
		if(oper!=null&&oper.equals("yes")){
			dao.updateStatus(employeeid,"1");
		}
		
		if(oper!=null&&oper.equals("no")){
			dao.updateStatus(employeeid,"2");
		}
		request.getRequestDispatcher("ViewAllEmployeesServlet?code=approve").forward(request, response);
		
	}
}