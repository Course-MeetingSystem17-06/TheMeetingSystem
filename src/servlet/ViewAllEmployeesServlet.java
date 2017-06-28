package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import vo.Employee;

public class ViewAllEmployeesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String department = request.getParameter("department");

		EmployeeDAO dao = new EmployeeDAO();
		List<Employee> employeesList = dao.selectAllEmployee();
		List<Employee> employees = dao.selectBydepartment(department);
		request.setAttribute("employeesList", employeesList);

		if (code != null & code.equals("approve")) {
			request.getRequestDispatcher("approveaccount.jsp").forward(request, response);
		}
	}
}