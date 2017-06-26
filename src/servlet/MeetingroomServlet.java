package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MeetingroomService;
import vo.Meetingroom;
import dao.MeetingroomDAO;

;

/**
 * Servlet implementation class MeetingroomServlet
 */
public class MeetingroomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MeetingroomServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置请求的编码格式保证中文编码正确
		request.setCharacterEncoding("utf-8");

		// 获取添加会议室页面填写的请求参数
		String roomnumber = request.getParameter("roomnumber");
		String roomname = request.getParameter("roomname");
		String roommax = request.getParameter("roommax");
		String roomstate = request.getParameter("roomstate");
		String roomremark = request.getParameter("roomremark");

		Meetingroom meetingroom = new Meetingroom(roomnumber, roomname,
				roommax, roomstate, roomremark);
		MeetingroomService service = new MeetingroomService();
		int flag = service.regist(meetingroom);

		if (flag == 1) {
			request.setAttribute("msg", "添加成功。");
			request.getRequestDispatcher("addmeetingroom.jsp").forward(request,
					response);

		} else {
			request.setAttribute("msg", "门牌号重复，请确认后重新添加会议室。");
			MeetingroomDAO dao = new MeetingroomDAO();
			request.getRequestDispatcher("addmeetingroom.jsp").forward(request,
					response);
			/*
			 * List<Department> departmentsList=dao.selectAll();
			 * request.setAttribute("departmentsList", departmentsList);
			 * request.getRequestDispatcher("register.jsp").forward(request,
			 * response);
			 */
		}
	}
}
