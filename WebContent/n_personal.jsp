<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="styles/sidebar.css" />

<title>人员管理</title>
</head>

<body>
	<%
		String username = (String) session.getAttribute("employeename");
	%><!-- 姓名 -->
	<%
		String user = (String) session.getAttribute("username");
	%><!-- 用户名 -->
	<div id="container">
		<div id="bd">
			<div class="wrap clearfix">
				<div class="sidebar">
					<h2 class="sidebar-header">
						<p>功能导航</p>
					</h2>
					<ul class="nav">
						<li class="notification current"><div class="nav-header">
								<a href="ViewMyNotificationServlet?user=<%=username%>"
									target="main"><span>最新通知</span><i class="icon"></i> </a>
							</div>
						</li>
						<li class="reserve"><div class="nav-header">
								<a
									href="ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&user=<%=username%>"
									target="main"><span>我的预定</span><i class="icon"></i> </a>
							</div>
						</li>
						<li class="mymeeting">
							<div class="nav-header">
								<a
									href="ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=<%=user%>"
									target="main"><span>我的会议</span><i class="icon"></i> </a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<script type="text/javascript" src="js/index_inner.js"></script>

</html>
