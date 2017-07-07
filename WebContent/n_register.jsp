<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="styles/common.css" />
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

	<div class="page-content">
		<div class="content-nav">注册</div>
		<form action="LoginServlet" method="post">
			<fieldset>
				<legend>登录信息</legend>
				<tr>
					<td>提示信息：</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>账号名:</td>
						<td><input id="accountname" name="username" type="text" /></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input id="new" name="pwd" type="password" /></td>
					</tr>
					<tr>
						<td><select id="timelength" name="timelength">
								<option value="0">每次需要登入</option>
								<option value="10">10天内</option>
								<option value="30">30天内</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input type="submit"
							value="登录" class="clickbutton" /> <input type="button"
							value="返回" class="clickbutton" onclick="window.history.back();" />
							<input type="button" value="注册" class="clickbutton"
							onclick="window.location.href='ViewAllDepartmentsServlet?code=regist'" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	</div>

</body>
</html>