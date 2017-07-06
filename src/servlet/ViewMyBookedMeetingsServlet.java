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
		MeetingService_dada service = new MeetingService_dada();
//		List<Meeting_dada> meetingsList = service.searchMyBookedMeetings(booker);
//		request.setAttribute("meetingsList", meetingsList);
		/*
		 * if (code != null & code.equals("approve")) {
		 * request.getRequestDispatcher("approveaccount.jsp").forward(request,
		 * response); }
		 */
			// 当前页码
			String pageNumStr = request.getParameter("pageNum");
			int pageNum = 0;
			if (pageNumStr == null || pageNumStr.equals("")) {
				pageNum = 1;
			} else {
				pageNum = Integer.parseInt(pageNumStr);
			}

			// 每页的记录数量
			int pageSize = service.getPageSize();
			// 起始记录索引
			int start = (pageNum - 1) * pageSize;
			// 查询的数量
			int count = pageSize;
			if(code != null && code.equals("viewMyBookedmeetings")){
				String meetingbooker = request.getParameter("meetingbooker");
				request.setAttribute("meetingbooker", meetingbooker);
				
				// 获得所有记录数量，先调用DAO中的search方法
				service.searchMyBookedMeetings(meetingbooker);
				int countOfMeetings = service.getCountOfMeetings();
				// 页数
				int countOfPages = service.getCountOfPages();
				List<Meeting_dada> list1 = service.searchMyBookedMeetingsOfOnePage(meetingbooker, start, count);
				request.setAttribute("meetingsList", list1);

				// 使用search标记调用了SearchEmployeesServlet,即显示结果表格
				request.setAttribute("search", "1");
				// 存储页数、所有记录的数量、当前页码
				request.setAttribute("countOfPages", countOfPages);
				request.setAttribute("countOfMeetings", countOfMeetings);
				request.setAttribute("pageNum", pageNum);

				request.getRequestDispatcher("showmybookedmeetings.jsp").forward(
						request, response);
			}
	}
}