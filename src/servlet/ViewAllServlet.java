package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Department;
import vo.Meetingroom;
import dao.DepartmentDAO;
import dao.MeetingroomDAO;

public class ViewAllServlet extends HttpServlet {
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
		//部门
		DepartmentDAO departmentdao = new DepartmentDAO();		
		List<Department> DepartmentsList = departmentdao.selectAll();
		request.setAttribute("departmentsList", DepartmentsList);
		// System.out.println("111");
		String code = request.getParameter("code");
		String user = new String(request.getParameter("user").getBytes("iso-8859-1"), "utf-8");  
		//会议室
		MeetingroomDAO meetingroomdao = new MeetingroomDAO();
		List<Meetingroom> meetingroomsList = meetingroomdao.selectavailableMeetingroom();
		request.setAttribute("meetingroomsList", meetingroomsList);
		if (code != null && code.equals("bookmeeting")) {
			request.setAttribute("user", user);
			request.getRequestDispatcher("bookmeeting.jsp").forward(request,
					response);
		}

	}

}
