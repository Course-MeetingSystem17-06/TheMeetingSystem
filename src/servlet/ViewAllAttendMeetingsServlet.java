package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import dao.MeetingDAO_dada;
import vo.Employee;
import vo.Meeting_dada;

public class ViewAllAttendMeetingsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String user = request.getParameter("user");
		request.setAttribute("user", user);
		EmployeeDAO edao = new EmployeeDAO();
		Employee employee = edao.selectByUsername(user);
		int id = employee.getEmployeeid();
		MeetingDAO_dada dao = new MeetingDAO_dada();
		List<Meeting_dada> meetingsList = dao.selectAttendMeetings(id);
		request.setAttribute("meetingsList", meetingsList);

		if (code != null && code.equals("viewattendmeetings")) {
			request.getRequestDispatcher("myattendmeetings.jsp").forward(request,
					response);
		}
		/*
		 * if (code != null & code.equals("approve")) {
		 * request.getRequestDispatcher("approveaccount.jsp").forward(request,
		 * response); }
		 */
	}
}