package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MeetingService_dada;
import vo.Meeting_dada;

public class SearchMeetingsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MeetingService_dada service = new MeetingService_dada();
		Date meetingbookdatestart = null;
		Date meetingbookdateend = null;
		Date meetingstarttime = null;
		Date meetingendtime = null;
		String meetingname = request.getParameter("meetingname");
		String meetingroomname = request.getParameter("meetingroomname");
		String meetingbooker = request.getParameter("meetingbooker");
		String bookdatestart = request.getParameter("meetingbookdatestart");
		String bookdateend = request.getParameter("meetingbookdateend");
		String starttime = request.getParameter("meetingstarttime");
		String endtime = request.getParameter("meetingendtime");
		if(bookdatestart != null && !bookdatestart.equals("")){
			meetingbookdatestart = Date.valueOf(bookdatestart);
		}
		if(bookdateend != null && !bookdateend.equals("")){
			meetingbookdateend = Date.valueOf(bookdateend);
		}
		if(starttime != null && !starttime.equals("")){
			meetingstarttime = Date.valueOf(starttime);
		}
		if(endtime != null && !endtime.equals("")){
			meetingendtime = Date.valueOf(endtime);
		}

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
		// 获得所有记录数量，先调用DAO中的search方法
		service.searchMeetings(meetingname, meetingroomname, meetingbooker,
				meetingstarttime, meetingendtime, meetingbookdatestart,
				meetingbookdateend);
		int countOfMeetings = service.getCountOfMeetings();
		// 页数
		int countOfPages = service.getCountOfPages();

		List<Meeting_dada> list = service.searchMeetingsOfOnePage(meetingname,
				meetingroomname, meetingbooker, meetingstarttime,
				meetingendtime, meetingbookdatestart, meetingbookdateend,
				start, count);
		request.setAttribute("meetingsList", list);

		// 使用search标记调用了SearchEmployeesServlet,即显示结果表格
		request.setAttribute("search", "1");
		// 存储页数、所有记录的数量、当前页码
		request.setAttribute("countOfPages", countOfPages);
		request.setAttribute("countOfMeetings", countOfMeetings);
		request.setAttribute("pageNum", pageNum);
		request.getRequestDispatcher("searchmeeting.jsp").forward(request,
				response);
	}
}
