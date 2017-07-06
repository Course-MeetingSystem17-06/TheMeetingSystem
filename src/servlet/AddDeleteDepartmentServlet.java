package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartmentDAO;
import dao.EmployeeDAO;

import service.DepartmentService;

public class AddDeleteDepartmentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��������ı����ʽ��֤���ı�����ȷ
		// ʹ�ù�����������Ҫ
		request.setCharacterEncoding("utf-8");
		// ���codeֵ
		String code = request.getParameter("code");

		DepartmentService service = new DepartmentService();

		if (code != null && code.equals("add")) {
			service.addDepartment(request.getParameter("departmentname"));
		}

		if (code != null && code.equals("edit")){
			String departmentname = new String(request.getParameter("editdepartmentname").getBytes("iso-8859-1"), "utf-8");  
			String olddepartmentname = service.selectById(Integer.parseInt(request.getParameter("departmentid")));
			olddepartmentname = new String(olddepartmentname.getBytes("utf-8"), "utf-8");
			
			EmployeeDAO dao = new EmployeeDAO();
			dao.updatedepartment(olddepartmentname, departmentname);
			service.editDepartment(Integer.parseInt(request.getParameter("departmentid")),departmentname);
		}
		
		
		if (code != null && code.equals("delete")) {
			service.deleteDepartment(Integer.parseInt(request.getParameter("departmentid")));
		}
		request.getRequestDispatcher("ViewAllDepartmentsServlet?code=viewalldepartments").forward(request, response);
	}

}
