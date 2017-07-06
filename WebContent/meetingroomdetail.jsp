
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var message = document.getElementById("roomremark_value").value;
		document.getElementById("roomremark").value = message;

		var state = "${requestScope.roomstate}";//!!!
		if (state == 1) {
			document.getElementById("roomstate_1").checked = "checked";
		}
		if (state == 0) {
			document.getElementById("roomstate_0").checked = "checked";
		}
		if (state == -1) {
			document.getElementById("roomstate_d").checked = "checked";
		}
	};
	
	function back(){
		window.location.href="ViewAllMeetingRoomsServlet?code=viewallmeetingrooms";
	}
	
	function validate(val, target) {
		checknull(val,target);
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
		//finalcheck();
	}
	
	function finalcheck() {
		var i = 0;
		var all = document.getElementsByClassName(0);
		if (all.length != 0) {
			document.getElementById('change_button').disabled = true;
			return;
		}
		var error = document.getElementsByName('error');

		if (error.length != 0) {
			document.getElementById('change_button').disabled = true;
			return;
		}
		document.getElementById('change_button').disabled = false;
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 修改会议室信息</div>
		<form name="form1"
			action="UpdateMeetingRoomServlet?code=update&roomid=${requestScope.roomid}"
			method="post">
			<fieldset>
				<legend>会议室信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>门牌号:</td>
						<td><input id="roomnumber" name="roomnumber" type="text"
							placeholder="例如：201" maxlength="10"
							value="${requestScope.roomnumber}" onchange="validate(this.value,this.id)" />
							<div id="validateMessagenum"></div>
							<div id="roomnumber_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td>会议室名称:</td>
						<td><input id="roomname" name="roomname" type="text"
							placeholder="例如：第一会议室" maxlength="20"
							value="${requestScope.roomname}"onchange="validate(this.value,this.id)" />
							<div id="validateMessagename"></div>
							<div id="roomname_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td>最多容纳人数：</td>
						<td><input id="roommax" name="roommax" type="text"
							placeholder="填写一个正整数" value="${requestScope.roommax}" onchange="checknull(this.value,this.id)" />
							<div id="validateMessagenum"></div>
							<div id="roommax_mes" class=0></div>
						</td>
					</tr>
					<tr>
						<td>当前状态：</td>
						<td><label for="status"><input type="radio"
								id="roomstate_1" name="status" value="1" />启用 <input
								type="radio" id="roomstate_0" name="status" value="0" />停用 <input
								type="radio" id="roomstate_d" name="status" value="-1" />删除</label>
						</td>
					</tr>
					<tr>
						<td>备注：</td>
						<td><textarea id="roomremark" neme="roomremark"
								maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述""></textarea><input
							type="hidden" id="roomremark_value" name="roomremark_value"
							value="${requestScope.roomremark}" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input type="submit" id="change_button"
							value="确认修改" class="clickbutton" /> <input type=button
							value="返回" class="clickbutton" onclick="back()"/>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>