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

<title>个人中心</title>
</head>

<body>
	<div id="container">
		<div id="bd">
			<div class="wrap clearfix">
				<div class="sidebar">
					<h2 class="sidebar-header">
						<p>功能导航</p>
					</h2>
					<ul class="nav">
						<li class="notification current"><div class="nav-header">
								<a href="ViewAllEmployeesServlet?code=approve" target="main"><span>最新通知!!</span><i
									class="icon"></i> </a>
							</div>
						</li>
						<li class="reserve"><div class="nav-header">
								<a href="javascript:;" data-src="my_info.html" class="clearfix"><span>我的预定</span><i
									class="icon"></i> </a>
							</div>
						</li>
						<li class="my-meeting">
							<div class="nav-header">
								<a href="javascript:;" class="clearfix"><span>我的会议</span><i
									class="icon"></i> </a>
							</div></li>

					</ul>
				</div>
				<div class="content">
					<!-- <div class="topbar clearfix">
						<ul class="user-msg clearfix">
							<li><img src="../images/583321.png" alt="">预存款金额<span>0.00元</span>[<a
									href="javascript:;">充值</a>] 
							</li>
							<li><img src="../images/583349.png" alt="">短信<span>0</span>条[<a
									href="javascript:;">购买</a>] 
							</li>
							<li><img src="../images/583450.png" alt="">行程单<span>0</span>份[<a
									href="javascript:;">购买</a>] 
							</li>
							<li><img src="../images/583468.png" alt="">保险[<a
									href="javascript:;">购买</a>] 
							</li>
							<li><img src="../images/15435.png" alt="">天气预报 
							</li>
							<li><img src="../images/514958.png" alt="">[<a
									href="javascript:;">联系客户经理</a>] 
							</li>
						</ul>
						<div class="contact clearfix">
							<a class="wx" href="javascript:;"><img src="../images/wx.png"
								alt="">微信公众号 
							</a> <a class="qq" href="javascript:;"><img
								src="../images/QQ.png" alt="">QQ客户 
							</a>
						</div>
					</div> -->
					<!-- <iframe src="system_index.html" id="iframe" width="100%"
						height="100%" frameborder="0"></iframe> -->
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<script type="text/javascript" src="js/index_inner.js"></script>

</html>
