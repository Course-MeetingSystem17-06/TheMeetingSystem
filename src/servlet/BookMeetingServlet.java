package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmployeeService;
import vo.Department;
import vo.Employee;
import vo.Meeting_dada;
import vo.Meetingroom;
import dao.DepartmentDAO;
import dao.EmployeeDAO;
import dao.MeetingDAO_dada;
import dao.MeetingEmployeeDAO;
import dao.MeetingroomDAO;

public class BookMeetingServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求的编码格式保证中文编码正确
		request.setCharacterEncoding("utf-8");
		int id = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		// 或许注册页面填写的请求参数
		String meetingname = request.getParameter("meetingname");
		String pnumber = request.getParameter("meetingpnumber");
		String user = request.getParameter("user");
		String[] options = request.getParameterValues("selSelectedEmployees");
		Date starttime = null;
		try {
			starttime = df.parse(request.getParameter("starttime"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endtime = null;
		try {
			endtime = df.parse(request.getParameter("endtime"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String meetingroomid = request.getParameter("meetingroomid");
		String meetingillustrate = request.getParameter("meetingillustrate");

		Date booktime = null;
		try {
			booktime = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// new Date()为获取当前系统时间
		java.sql.Timestamp bt = new Timestamp(booktime.getTime());
		Date bookmeetingtime = bt;


		java.sql.Timestamp bt1 = new Timestamp(starttime.getTime());
		Date meetingstarttime = bt1;

		java.sql.Timestamp bt2 = new Timestamp(endtime.getTime());
		Date meetingendtime = bt2;

		Meeting_dada meeting = new Meeting_dada(meetingname, meetingroomid,
				pnumber, meetingstarttime, meetingendtime, meetingillustrate,
				user, "1", bookmeetingtime);
		MeetingDAO_dada dao = new MeetingDAO_dada();
		dao.insert(meeting);
		id = dao.selectmeetingid();
		DepartmentDAO departmentdao = new DepartmentDAO();
		List<Department> DepartmentsList = departmentdao.selectAll();
		request.setAttribute("departmentsList", DepartmentsList);
		MeetingroomDAO meetingroomdao = new MeetingroomDAO();
		List<Meetingroom> meetingroomsList = meetingroomdao
				.selectAllMeetingroom();
		request.setAttribute("meetingroomsList", meetingroomsList);
		request.setAttribute("user", user);
		request.getRequestDispatcher("bookmeeting.jsp").forward(request,
				response);
		
		EmployeeDAO employeedao = new EmployeeDAO();
		for ( int i = 0; i < options.length; i++) {
			String username = options[i];//username
			Employee e = employeedao.selectByUsername(username);
			int employeeid = e.getEmployeeid();
			
			MeetingEmployeeDAO meetingemployeedao = new MeetingEmployeeDAO();
			
			meetingemployeedao.insert(employeeid,id);
		}
		
		

	}
}
