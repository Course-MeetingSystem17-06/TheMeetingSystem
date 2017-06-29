package servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;

import vo.Employee;

public class SelectEmployeesOfDeptServlet_647 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("content-type", "text/xml;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		EmployeeDAO dao = new EmployeeDAO();
		String b = URLDecoder.decode(request.getParameter("departmentid"),
				"UTF-8");

		System.out.println("lalalal"+b);

		List<Employee> e = dao.selectByDepartment(b);
		String[] json = null;
		PrintWriter   out=response.getWriter();  
		response.setContentType("text/xml;charset=utf-8");
		response.setHeader("Cache-Control", "no-Cache");
		out.println("<?xml   version='1.0'   encoding='"+"utf-8"+"'?>");
		out.println("<employees>");
		for(int i=0;i<e.size();i++){
			
			out.println("<option>");
			out.println("<value>"+e.get(i).getUsername()+"</value>");
			out.println("<text>"+e.get(i).getEmployeename()+"</text>");
			out.println("</option>");
			
		}
		out.println("</employees>");
		out.flush();
        out.close();

	}
}
