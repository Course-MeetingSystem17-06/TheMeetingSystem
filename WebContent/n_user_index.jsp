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
<title>会议管理系统</title>
<link rel="stylesheet" href="styles/common04.css" />
</head>
<%
	String username = (String) session.getAttribute("employeename");
%><!-- 姓名 -->
<body>
	<h1 id="aaa"></h1>
	<div id="container">
		<div id="head">
			<div class="head-wrap">
				<div class="top-light"></div>
				<h1 class="logo"></h1>
				<ul class="main-nav">
					<li class="current" data-src="n_personal_index.jsp"><a
						href="javascript:;">个人中心</a>
					</li>
					<li class="" data-src="n_user_meeting_index.jsp"><a
						href="javascript:;">会议预定</a></li>
				</ul>
				<h1 class="h1name">会议管理系统</h1>
				<div class="toolbar">
					<div class="login-info">
						<div class="welcome">
							<span>欢迎您,<strong><%=username%></strong>
							</span>
						</div>
					</div>
					<div class="tool clearfix">
						<a href="javascript:;" class="quit-btn exit">退出</a>
					</div>
				</div>
			</div>
		</div>
		<div id="bd" style="height: 775px;">
			<div class="wrap">
				<iframe src="n_personal_index.jsp" id="iframe" width="100%"
					height="100%" frameborder="0"></iframe>
			</div>
		</div>
		<div id="ft" class="clearfix">
			<div class="ft-left">
				<span>会议管理系统</span>
			</div>
			<div class="ft-right">
				<span>WUA</span> <em>1.0&nbsp;2017</em>
			</div>
		</div>
	</div>
	<div class="exitDialog">
		<div class="dialog-content">
			<div class="ui-dialog-icon"></div>
			<div class="ui-dialog-text">
				<p class="dialog-content">你确定要退出系统？</p>
				<p class="tips">如果是请点击“确定”，否则点“取消”</p>

				<div class="buttons">
					<input type="button" class="button long2 ok" value="确定" /> <input
						type="button" class="button long2 normal" value="取消" />
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</html>
