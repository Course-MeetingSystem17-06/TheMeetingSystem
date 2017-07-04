package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import vo.Meetingroom;
import dao.MeetingroomDAO;

public class ValidateMeetingroomServlet extends HttpServlet {
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Meetingroom e = new Meetingroom();
		boolean flag = true;
		String message = "";
		MeetingroomDAO dao = new MeetingroomDAO();
		if("target"=="roomnumber") e = dao.selectBynum(request.getParameter("data"));	
		else e = dao.selectByname(request.getParameter("data"));
		if (e == null) {
			message = "正确";

		} else{
			flag = false;
			message = "已被注册，请重新输入";
		}
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String json = "{\"msg\":\"" + message + "\",\"flag\":" + flag + "}";
		out.print(json);

	}
}
