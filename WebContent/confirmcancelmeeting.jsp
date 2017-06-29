
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
	window.onload = function() {
		var result = "${requestScope.result}";
		if (result == 1) {
			document.getElementById("confirm").disabled = "disabled";
		}
	};
	function back() {
		window.location.href = "ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&user=${requestScope.user}";
	}
	function getTextarea() {
		var message = document.getElementById("reason").value;
		document.getElementById("reason_value").value = message;
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 撤销会议预定</div>
		<form id="form1" name="form1"
			action="UpdateMeetingServlet?code=confirmcancel&meetingid=${requestScope.meetingid}&meetingname=${requestScope.meetingname}"
			method="post">
			<fieldset>
				<legend>撤销预定</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>会议名称:</td>
						<td><font>${requestScope.meetingname}</font>
						</td>
					</tr>
					<tr>
						<td>撤销理由：</td>
						<td><textarea id="reason" name="reason" maxlength="200"
								rows="5" cols="60" placeholder="200字以内的文字描述" onChange="getTextarea()">${requestScope.meetingcancelreason}</textarea><input
							type="hidden" id="reason_value" name="reason_value" />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input id="confirm"
							type="submit" value="确认撤销" class="clickbutton" /> <input
							type="button" value="返回" class="clickbutton" onclick="back()" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>