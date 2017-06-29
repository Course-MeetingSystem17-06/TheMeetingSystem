package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MeetingService_dada;
import vo.Meeting_dada;

public class ViewMyBookedMeetingsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String booker = request.getParameter("user");
		MeetingService_dada service = new MeetingService_dada();
		List<Meeting_dada> meetingsList = service.searchMyBookedMeetings(booker);
		request.setAttribute("meetingsList", meetingsList);

		if (code != null && code.equals("viewMyBookedmeetings")) {
			request.getRequestDispatcher("showmybookedmeetings.jsp").forward(request,
					response);
		}
		/*
		 * if (code != null & code.equals("approve")) {
		 * request.getRequestDispatcher("approveaccount.jsp").forward(request,
		 * response); }
		 */
	}
}