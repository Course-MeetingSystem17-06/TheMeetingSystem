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
<body>
<h1 id="aaa"></h1>
	<div id="container">
		<div id="head">
			<div class="head-wrap">
				<div class="top-light"></div>
				<h1 class="logo"></h1>
				<ul class="main-nav">
					<li class="current" data-src="personal.jsp"><a
						href="javascript:;">个人中心</a></li>
					<li data-src="static/ticket/index.html"><a href="javascript:;">人员管理</a>
					</li>
					<li data-src="static/msg/index.html"><a href="javascript:;">会议预定</a>
					</li>
				</ul>

				<div class="toolbar">
					<div class="login-info">
						<div class="welcome">
							<span>欢迎您,</span><a href="javascript:;" class="user-name">Admin</a>
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
				<iframe src="personal_index.jsp" id="iframe" width="100%" height="100%"
					frameborder="0"></iframe>
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

	<!-- <div class="ui-dialog-panel"
		style="position: fixed; left: 469.5px; top: 323.5px; display: none;">
		<div class="ui-dialog">
			<div class="ui-dialog-hd" style="cursor: move;">
				<h6>
					<span class="dialog-hd-lc"></span>确认退出系统吗?<span
						class="dialog-hd-rc"></span>
				</h6>
				<a href="javascript:;" class="ui-dialog-close ue-state-default"><i></i>
				</a>
			</div>
			<div class="exitDialog ui-dialog-content"
				style="display: block; width: 400px; height: 200px;">
				<div class="dialog-content">
					<div class="ui-dialog-icon"></div>
					<div class="ui-dialog-text">
						<p class="dialog-content">你确定要退出系统？</p>
						<p class="tips">如果是请点击“确定”，否则点“取消”</p>

						<div class="buttons">
							<input type="button" class="button long2 ok" value="确定">
							<input type="button" class="button long2 normal" value="取消">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->



</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<script type="text/javascript" src="js/index.js"></script>


<!-- 
<frameset rows="150,*,93" cols="*" framespacing="0" frameborder="no"
	border="0">
	<frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize"
		id="topFrame" marginwidth="0" marginheight="0" frameborder="0" />
	<frameset cols="260,*" id="frame">
		<frame src="adminleft.jsp" name="leftFrame" noresize="noresize"
			marginwidth="110px" marginheight="0" frameborder="0" scrolling="auto"
			target="main" />
		<frame src="01.html" name="main" marginwidth="50px"
			marginheight="40px" frameborder="0" scrolling="auto" target="_self" />
	</frameset>
	<frame src="02.html" name="bottomFrame" scrolling="No"
		noresize="noresize" id="bottomFrame" marginwidth="0" marginheight="0" />
</frameset>
<noframes></noframes> -->
</html>
