package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MeetingDAO_dada;
import service.MeetingService_dada;
import vo.Meeting_dada;

public class UpdateMeetingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String code = request.getParameter("code");
		String meetingid = request.getParameter("meetingid");

		if (code != null && code.equals("detail")) {
			MeetingDAO_dada dao = new MeetingDAO_dada();
			Meeting_dada meeting = dao.selectById(meetingid);
			request.setAttribute("meetingid", meetingid);
			request.setAttribute("name", meeting.getMeetingname());
			request.setAttribute("participatenumber",
					meeting.getMeetingparticipatenumber());
			request.setAttribute("starttime", meeting.getMeetingstarttime());
			request.setAttribute("endtime", meeting.getMeetingendtime());
			request.setAttribute("illustrate", meeting.getMeetingillustrate());
			request.getRequestDispatcher("meetingdetail.jsp").forward(
					request, response);
		}

		if (code != null && code.equals("update")) {
			// 获取添加会议室页面填写的请求参数
			String illustrate = request.getParameter("illustrate");
			MeetingService_dada service = new MeetingService_dada();
			service.updateillustrate(meetingid, illustrate);
			request.setAttribute("msg", "修改成功。");
			request.getRequestDispatcher(
					"UpdateMeetingServlet?code=detail&meetingid=" + meetingid)
					.forward(request, response);

		}
	}
}