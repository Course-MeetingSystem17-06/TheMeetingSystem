<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common.css" />
<style type="text/css">
</style>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
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
	function check() {
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
		checknull($("#secondpassword").val(), "secondpassword");
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
	<div class="page-header">
		<div class="header-banner">
			<img src="images/header.png" alt="CoolMeeting" />
		</div>
		<div class="header-title">欢迎访问Cool-Meeting会议管理系统</div>
	</div>
	<div class="page-content">
		<div class="content-nav">人员管理 > 员工注册</div>
		<form name="form1" action="RegistServlet" method="post">
			<fieldset>
				<legend>员工信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable">
					<tr>
						<td><font color="#FF0000">* </font>姓名：</td>

						<td><input type="text" id="employeename" name="employeename"
							maxlength="20" value="${param.employeename}" placeholder="请输入姓名"
							onkeyup="checknull(this.value,this.id)" />
							<div id="employeename_mes" class=0></div></td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>账户名：</td>
						<td><input type="text" id="username" name="username"
							maxlength="20" value="${param.username}" placeholder="请输入登陆用帐户名"
							onkeyup="validate()" />
							<div id="validateMessage"></div>
							<div id="username_mes" class=0></div></td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>密码：</td>
						<td><input type="password" id="firstpassword" name="password"
							maxlength="20" placeholder="请输入密码" onkeyup="check()">
							<div id="firstpassword_mes" class=0></div></td>
					</tr>
					<tr>
						<td id="passwordf"><font size="2px" color="#666666">密码格式为6位以上的数字字母组合</font>
						</td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>确认密码：</td>
						<td><input type="password" id="secondpassword"
							placeholder="请再次输入密码" name="password" maxlength="20"
							onkeyup="check()" />
							<div id="confirminfo" display=none></div>
							<div id="pconfirminfo"></div>
							<div id="secondpassword_mes" class=0></div></td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>联系电话：</td>
						<td><input type="text" id="phone" name="phone" maxlength="20"
							placeholder="请输入联系电话" value="${param.phone}"
							onkeyup="checknull(this.value,this.id)" />
							<div id="phone_mes" class=0></div></td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>电子邮件：</td>
						<td><input type="text" id="email" name="email" maxlength="20"
							placeholder="请输入电子邮箱地址" value="${param.email}"
							onkeyup="checknull(this.value,this.id)" />
							<div id="email_mes" class=0></div></td>
					</tr>
					<tr>
						<td><font color="#FF0000">* </font>所在部门：</td>

						<td><select name="deptid">
								<c:forEach var="department"
									items="${requestScope.departmentsList}">
									<c:if test="${department.departmentid== param.deptid}">
										<option value="${department.departmentname}" selected>${department.departmentname}</option>
									</c:if>
									<c:if test="${department.departmentid!= param.deptid}">
										<option value="${department.departmentname}">${department.departmentname}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td colspan="6" class="command"><input type="submit"
							class="clickbutton" value="注册" id="register_button"
							disabled="disabled" /> <input type="reset" class="clickbutton"
							value="重置" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div class="page-footer">
		<hr />
		更多问题，欢迎联系<a href="mailto:webmaster@eeg.com">管理员</a> <img
			src="images/footer.png" alt="CoolMeeting" />
	</div>
</body>
</html>