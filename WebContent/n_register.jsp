<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/register.css" />
<script type="text/javascript">
	String.prototype.Trim = function() {
		return this.replace(/(^\s*)|(\s*$)/g, "");
	};

	//使用ajax方法访问，验证账户名是否存在
	function validate() {
		checknull($("#username").val(), "username");
		$.ajax({
			type : "POST",
			url : "ValidateUsernameServlet",
			data : {
				username : $("#username").val()
			},
			success : function(message) {
				var validateMessage = $("#validateMessage");
				var data = JSON.parse(message);
				if (data.flag) {
					if ($("#username").val() == ""
							|| $("#username").val().Trim() == "") {
						validateMessage.html("");
						return;
					}
					validateMessage.html(data.msg);
					validateMessage.css({
						color : "green"
					});
					checknull($("#username").val(), "username");

				} else {
					validateMessage.html("<font name=error>" + data.msg
							+ "</font>");
					validateMessage.css({
						color : "red"
					});
					checknull($("#username").val(), "username");
				}
			}
		});
	}

	//验证密码
	function check(id) {
		var password = form1.firstpassword.value;
		var number = 0, alpha = 0;
		var len = password.length;
		if (len != 0) {
			for ( var i = 0; i < len; i++) {
				if ((password[i] >= 'a' && password[i] <= 'z')
						|| (password[i] >= 'A' && password[i] <= 'Z')) {
					alpha++;
				} else if (password[i] >= '0' && password[i] <= '9') {
					number++;
				}
			}
		}
		if (form1.firstpassword.value != form1.secondpassword.value) {
			confirminfo.innerHTML = "<font name=error color=red>两次输入的密码不相符</font>";
		} else if (len != (number + alpha)) {
			confirminfo.innerHTML = "<font name=error color=red>含有非法字符，密码只能包含数字和字母</font>";
		} else if (number == 0) {
			confirminfo.innerHTML = "<font name=error color=red>不含数字，请输入数字字母组合</font>";
		} else if (alpha == 0) {
			confirminfo.innerHTML = "<font name=error color=red>不含字母，请输入字母数字组合</font>";
		} else {
			confirminfo.innerHTML = "<font color=green>两次输入的密码相符</font>";
		}
		if(id=="secondpassword"){
			checknull($("#secondpassword").val(), "secondpassword");
		}
		if(id=="firstpassword"){
			checknull($("#firstpassword").val(), "firstpassword");
		}
	}

	function checknull(val, target) {
		target += "_mes";
		document.getElementById(target).className = 1;
		var val_trim = val.Trim();
		if (val == "" || val_trim == "") {
			document.getElementById(target).innerHTML = "<font name=error color=red>输入不能为空</font>";
		} else {
			document.getElementById(target).innerHTML = "";
		}
		finalcheck();
	}

	function finalcheck() {
		var i = 0;
		var all = document.getElementsByClassName(0);
		if (all.length != 0) {
			document.getElementById('register_button').disabled = true;
			return;
		}
		var error = document.getElementsByName('error');

		if (error.length != 0) {
			document.getElementById('register_button').disabled = true;
			return;
		}
		document.getElementById('register_button').disabled = false;
	}
</script>
</head>
<body>
	<div id="container">
		<div id="bd">
			<div class="login">
				<!-- 				<div class="login-top">
					<h1 class="logo"></h1>
				</div> -->
				<form action="RegistServlet" method="post" class="login-input"
					name="form1">
					<fieldset>
						<tr>
							<td><font size="2px" color="red">${requestScope.msg}</font>
							</td>
						</tr>
						<table style="margin-top: -5px" class="formtable">
							<tr>
								<td><p class="user ue-clear">
										<label>姓名：</label> <input type="text" id="employeename"
											name="employeename" maxlength="20"
											value="${param.employeename}" placeholder="请输入姓名"
											onkeyup="checknull(this.value,this.id)" />
									<div id="employeename_mes" class=0></div>
								</td>
							</tr>
							<tr>
								<td><p class="password ue-clear">
										<label>账户名：</label><input type="text" id="username"
											name="username" maxlength="20" value="${param.username}"
											placeholder="请输入登陆用帐户名" onkeyup="validate()" />
									<div id="validateMessage"></div>
									<div id="username_mes" class=0></div></td>
							</tr>
							<tr>
								<td><p class="password ue-clear">
										<label>密码：</label><input type="password" id="firstpassword"
											name="password" maxlength="20" placeholder="请输入密码"
											onkeyup="check(this.id)">
									<div id="firstpassword_mes" class=0></div>
								</td>
							</tr>
							<tr>
								<td id="passwordf"><font size="2px" color="#666666">密码格式为6位以上的数字字母组合</font>
								</td>
							</tr>
							<tr>
								<td><p class="password ue-clear">
										<label>确认密码：</label><input type="password" id="secondpassword"
											placeholder="请再次输入密码" name="password" maxlength="20"
											onkeyup="check(this.id)" />
									<div id="confirminfo" display=none></div>
									<div id="pconfirminfo"></div>
									<div id="secondpassword_mes" class=0></div>
								</td>
							</tr>

							<tr>
								<td><p class="password ue-clear">
										<label>联系电话：</label> <input type="text" id="phone"
											name="phone" maxlength="20" placeholder="请输入联系电话"
											value="${param.phone}"
											onkeyup="checknull(this.value,this.id)" />
									<div id="phone_mes" class=0></div>
								</td>
							</tr>
							<tr>
								<td><p class="password ue-clear">
										<label>电子邮件：</label> <input type="text" id="email"
											name="email" maxlength="20" placeholder="请输入电子邮箱地址"
											value="${param.email}"
											onkeyup="checknull(this.value,this.id)" />
									<div id="email_mes" class=0></div></td>
							</tr>


							<tr>
								<td><p class="password ue-clear">
										<label>所在部门：</label> <select
											style="width: 210px; height: 30px;" name="deptid">
											<c:forEach var="department"
												items="${requestScope.departmentsList}">
												<c:if test="${department.departmentid== param.deptid}">
													<option value="${department.departmentname}" selected>${department.departmentname}</option>
												</c:if>
												<c:if test="${department.departmentid!= param.deptid}">
													<option value="${department.departmentname}">${department.departmentname}</option>
												</c:if>
											</c:forEach>
										</select>
								</td>
							</tr>



						</table>
						<table style="margin-top: 10px;">
							<tr>
								<td><select class="iselect-wrapper iselect" id="timelength"
									name="timelength">
										<option value="0">每次需要登入</option>
										<option value="10">10天内</option>
										<option value="30">30天内</option>
								</select></td>
							</tr>
						</table>
						<table style="margin-top: 20px;">
							<tr class="login-btn ue-clear">
								<td><input type="submit"
									style="border: none;" class="btn" value="注册"
									id="register_button" disabled="disabled" /></td>
								<td><input type="reset"
									style="margin-left: 20px; border: none;" class="btn" value="重置" />
								</td>
								<td><input type="button"
									style="margin-left: 20px; border: none;" class="btn" value="返回" onclick="window.location.href='n_login.jsp'"/>
								</td>

							</tr>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div id="ft">
		CopyRight&nbsp;2016&nbsp;&nbsp;版权所有&nbsp;&nbsp;皖ICP备12345678号</div>
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