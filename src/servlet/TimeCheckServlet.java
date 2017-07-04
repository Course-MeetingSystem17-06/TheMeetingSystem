package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MeetingDAO_dada;

public class TimeCheckServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		// 判断所选时间不在已选时间范围内
		int a = 0, b = 0;
		boolean flag = true;
		String message = "";
		MeetingDAO_dada dao1 = new MeetingDAO_dada();
		// 获取时间
		Date starttime1 = null;
		Date endtime1 = null;
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String deptid = request.getParameter("deptid");

		try {
			starttime1 = df.parse(start);
			endtime1 = df.parse(end);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Timestamp bt3 = new Timestamp(starttime1.getTime());
		java.sql.Timestamp bt4 = new Timestamp(endtime1.getTime());
		Date meetingstarttime1 = bt3;
		Date meetingendtime1 = bt4;
		// 调用函数判断冲突
		try {
			a = dao1.timeconflictexam(meetingstarttime1, deptid);
			b = dao1.timeconflictexam(meetingendtime1, deptid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (a == 0&&b == 0) {
			message = "正确";

		} 
		else if(a == 1&&b == 0) {
			flag = false;
			message = "开始时间与已有时间冲突，请重新输入";
			System.out.println("冲突");
		}
		else if(a == 0&&b == 1) {
			flag = false;
			message = "结束时间与已有时间冲突，请重新输入";
			System.out.println("冲突");
		}
		else if(a == 1&&b == 1) {
			flag = false;
			message = "开始结束时间与已有时间冲突，请重新输入";
			System.out.println("冲突");
		}

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String json = "{\"msg\":\"" + message + "\",\"flag\":" + flag + "}";
		out.print(json);
	}
}