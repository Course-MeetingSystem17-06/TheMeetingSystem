<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" href="styles/login.css" />
<title>会议管理系统</title>
</head>
<body>
	<div id="container">
		<div id="bd">
			<div class="login">
				<div class="login-top">
					<h1 class="logo"></h1>
				</div>
				<form action="LoginServlet" method="post" class="login-input">
					<fieldset>
						<tr>
							<td><font size="2px" color="red">${requestScope.msg}</font></td>
						</tr>
						<table  style="margin-top: -5px" class="formtable">
							<tr>
								<td><p class="user ue-clear">
										<label>用户名</label> <input id="accountname" name="username"
											type="text" />
									</p>
								</td>
							</tr>
							<tr>
								<td><p class="password ue-clear">
										<label>密&nbsp;&nbsp;&nbsp;码</label> <input id="new" name="pwd"
											type="password" />
									</p>
								</td>
							</tr>
						</table>
						<table  style="margin-top: 10px;">
							<tr>
								<td><select class="iselect-wrapper iselect" id="timelength" name="timelength">
										<option value="0">每次需要登入</option>
										<option value="10">10天内</option>
										<option value="30">30天内</option>
								</select>
								</td>
							</tr>
						</table>
						<table style="margin-top: 10px;">
							<tr class="login-btn ue-clear">
								<td><input type="submit" style="margin-left: 30px;border: none;" value="登录"
									class="btn" />
								</td>
								
								<td><input type="button" style="margin-left: 20px;border: none;" value="注册"
									class="btn"
									onclick="window.location.href='ViewAllDepartmentsServlet?code=regist'" />
								</td>
							</tr>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div id="ft">
		CopyRight&nbsp;2016&nbsp;&nbsp;版权所有&nbsp;&nbsp;皖ICP备12345678号
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var height = $(window).height();
	$("#container").height(height);
	$("#bd").css("padding-top", height / 2 - $("#bd").height() / 2);

	$(window).resize(
			function() {
				var height = $(window).height();
				$("#bd").css("padding-top",
						$(window).height() / 2 - $("#bd").height() / 2);
				$("#container").height(height);

			});

	$('#remember').focus(function() {
		$(this).blur();
	});

	$('#remember').click(function(e) {
		checkRemember($(this));
	});

	function checkRemember($this) {
		if (!-[ 1, ]) {
			if ($this.prop("checked")) {
				$this.parent().addClass('checked');
			} else {
				$this.parent().removeClass('checked');
			}
		}
	}
</script>
</html>