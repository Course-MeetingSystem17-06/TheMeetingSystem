package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MeetingroomDAO;
import service.MeetingroomService;
import vo.Meetingroom;

public class UpdateMeetingRoomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String code = request.getParameter("code");
		String roomid = request.getParameter("roomid");

		if (code != null && code.equals("detail")) {
			MeetingroomDAO dao = new MeetingroomDAO();
			Meetingroom meetingroom = dao.selectById(roomid);
			request.setAttribute("roomid", roomid);
			request.setAttribute("roomname", meetingroom.getRoomname());
			request.setAttribute("roomnumber", meetingroom.getRoomnumber());
			request.setAttribute("roommax", meetingroom.getRoomnumber());
			request.setAttribute("roomstate", meetingroom.getRoomstate());
			request.setAttribute("roomremark", meetingroom.getRoomremark());
			request.getRequestDispatcher("meetingroomdetail.jsp").forward(
					request, response);
		}

		if (code != null && code.equals("update")) {
			// 获取添加会议室页面填写的请求参数
			String roomnumber = request.getParameter("roomnumber");
			String roomname = request.getParameter("roomname");
			String roommax = request.getParameter("roommax");
			String roomstate = request.getParameter("status");
			String roomremark = request.getParameter("roomremark_value");
			if (roomstate.equals("-1")) {
				MeetingroomDAO dao = new MeetingroomDAO();
				dao.delete(roomnumber);
				request.getRequestDispatcher(
						"ViewAllMeetingRoomsServlet?code=viewallmeetingrooms").forward(request, response);
			} else {
				Meetingroom meetingroom = new Meetingroom(roomnumber, roomname,
						roommax, roomstate, roomremark);
				meetingroom.setRoomid(Integer.parseInt(roomid));
				MeetingroomService service = new MeetingroomService();
				int flag = service.update(meetingroom);

				if (flag == 1) {
					request.setAttribute("msg", "修改成功。");
					request.getRequestDispatcher(
							"UpdateMeetingRoomServlet?code=detail&roomid="
									+ roomid).forward(request, response);

				} else {
					request.setAttribute("msg", "门牌号重复，请确认后重新提交。");
					request.getRequestDispatcher(
							"UpdateMeetingRoomServlet?code=detail&roomid="
									+ roomid).forward(request, response);
				}
			}
		}
	}
}