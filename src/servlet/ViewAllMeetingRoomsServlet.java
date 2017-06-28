package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MeetingroomDAO;
import vo.Meetingroom;

public class ViewAllMeetingRoomsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		MeetingroomDAO dao = new MeetingroomDAO();
		List<Meetingroom> meetingroomsList = dao.selectAllMeetingroom();
		request.setAttribute("meetingroomsList", meetingroomsList);

		if (code != null && code.equals("viewallmeetingrooms")) {
			request.getRequestDispatcher("showmeetingroom.jsp").forward(request,
					response);
		}
		/*
		 * if (code != null & code.equals("approve")) {
		 * request.getRequestDispatcher("approveaccount.jsp").forward(request,
		 * response); }
		 */
	}
}