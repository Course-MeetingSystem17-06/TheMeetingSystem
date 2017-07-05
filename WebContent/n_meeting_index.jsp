<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>会议预定</title>
</head>
	<frameset cols="182,*" id="frame">
		<frame src="n_meeting.jsp" name="leftFrame" noresize="noresize"
			marginwidth="0px" marginheight="0" frameborder="0" scrolling="auto"
			/>
		<frame src="addmeetingroom.jsp" name="main" marginwidth="0px"
			marginheight="40px" frameborder="0" scrolling="auto" />
	</frameset>
<noframes></noframes>
</html>
