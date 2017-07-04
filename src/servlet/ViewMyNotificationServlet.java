package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MeetingService_dada;
import vo.Meeting_dada;

public class ViewMyNotificationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String code = request.getParameter("code");
		String user = request.getParameter("user");
		request.setAttribute("user", user);
		MeetingService_dada service = new MeetingService_dada();
		// 获取近7天的会议
		List<Meeting_dada> latestmeetingsList = service
				.searchMyLatestMeetings(user);
		request.setAttribute("latestmeetingsList", latestmeetingsList);
		// 获取未来本应参加但取消的会议
		List<Meeting_dada> cancelmeetingsList = service
				.searchMyCancelMeetings(user);
		request.setAttribute("cancelmeetingsList", cancelmeetingsList);
		request.getRequestDispatcher("mynotification.jsp").forward(
				request, response);
	}
}