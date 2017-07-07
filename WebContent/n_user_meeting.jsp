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

<title>会议预定</title>
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
						<li class="room"><div class="nav-header">
								<a href="ViewAllMeetingRoomsServlet?code=viewallmeetingrooms"
									target="main"><span>查看会议室</span><i class="icon"></i> </a>
							</div>
						</li>
						<li class="book">
							<div class="nav-header">
								<a href="ViewAllServlet?code=bookmeeting&user=<%=username%>"
									target="main"><span>预定会议</span><i class="icon"></i> </a>
							</div></li>
						<li class="search">
							<div class="nav-header">
								<a href="SearchMeetingsServlet" target="main"><span>搜索会议</span><i
									class="icon"></i> </a>
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
