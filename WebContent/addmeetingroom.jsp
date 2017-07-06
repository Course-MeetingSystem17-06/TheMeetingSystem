<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function getRemark() {
		var message = document.getElementById("roomremark").value;
		document.getElementById("roomremark_value").value = message;
	}
	//使用ajax方法访问，验证账户名是否存在
	function validate(val, target) {
		$
				.ajax({
					type : "POST",
					url : "ValidateMeetingroomServlet",
					data : {
						data : val, 
						data1 : target
					},
					success : function(message) {
						if(target == "roomnumber")
						var validateMessage = $("#validateMessagenum");
						else var validateMessage = $("#validateMessagename");
						var data = JSON.parse(message);
						if (data.flag) {
							if (val == "") {
								validateMessage.html("");
								return;
							}
							validateMessage.html(data.msg);
							validateMessage.css({
								color : "green"
							});
							checknull(val, target);

						} else {
							validateMessage.html("<font name=error>" + data.msg
									+ "</font>");
							validateMessage.css({
								color : "red"
							});
							checknull(val,target);

						}
					}
				});

	}



	function checknull(val, target) {
		target += "_mes";
		document.getElementById(target).className = 1;
		if (val == "") {
			document.getElementById(target).innerHTML = "<font name=error color=red>输入不能为空</font>";
		} else {
			document.getElementById(target).innerHTML = "";
		}
		finalcheck();
	}

	function LimitTextArea(field) {
		maxlimit = 200;
		if (field.value.length > maxlimit) {
			field.value = field.value.substring(0, maxlimit);
			alert("字数不得多于200！");
		}
	}

	function finalcheck() {
		var i = 0;
		var all = document.getElementsByClassName(0);
		if (all.length != 0) {
			document.getElementById('add_button').disabled = true;
			return;
		}
		var error = document.getElementsByName('error');

		if (error.length != 0) {
			document.getElementById('add_button').disabled = true;
			return;
		}
		document.getElementById('add_button').disabled = false;
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 添加会议室</div>
		<form name="form1" action="AddMeetingroomServlet" method="post">
			<fieldset>
				<legend>会议室信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td><font color="red">*</font>门牌号:</td>
						<td><input id="roomnumber" name="roomnumber" type="text"
							placeholder="例如：201" maxlength="10" 
							onchange="validate(this.value,this.id)" />
							<div id="validateMessagenum"></div>
							<div id="roomnumber_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font>会议室名称:</td>
						<td><input id="roomname" name="roomname" type="text"
							placeholder="例如：第一会议室" maxlength="20"
							onchange="validate(this.value,this.id)" />
							<div id="validateMessagename"></div>
							<div id="roomname_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font>最多容纳人数：</td>
						<td><input id="roommax" name="roommax" type="text"
							placeholder="填写一个正整数" onchange="checknull(this.value,this.id)" />
							<div id="roommax_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font>当前状态：</td>
						<td><label for="status"> <input value="1"
								type="radio" id="status" name="status" checked="checked" /> 启用
								<input value="0" type="radio" id="status" name="status" /> 停用 </label></td>
					</tr>
					<tr>
						<td>备注：</td>
						<td><textarea id="roomremark" neme="roomremark"
								maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述"
								oninput="LimitTextArea(this)" onchange="getRemark()"></textarea><input
							type="hidden" id="roomremark_value" name="roomremark_value" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input id="add_button"
							type="submit" value="添加" class="clickbutton" disabled="disabled" />
							<input type="reset" value="重置" class="clickbutton" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>