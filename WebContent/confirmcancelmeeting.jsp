
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form_input.css" />
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
		<div class="subfiled">
			<h2>会议预定 > 撤销会议预定</h2>
		</div>
		<form class="fm" id="form1" name="form1"
			action="UpdateMeetingServlet?code=confirmcancel&meetingid=${requestScope.meetingid}&meetingname=${requestScope.meetingname}&user=${requestScope.user}"
			method="post">
			<div class="kv-item clearfix">
				<label>提示信息：</label>
				<div class="kv-item-content">
					<font color="red">${requestScope.msg}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>会议名称：</label>
				<div class="kv-item-content">
					<font>${requestScope.meetingname}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>撤销理由：</label>
				<div class="kv-item-content">
					<textarea id="reason" name="reason" maxlength="200" rows="5"
						cols="60" placeholder="200字以内的文字描述" onChange="getTextarea()">${requestScope.meetingcancelreason}</textarea>
					<input type="hidden" id="reason_value" name="reason_value" />
				</div>
			</div>
			<div class="button">
				<input id="confirm" type="submit" value="确认撤销" class="sapar-btn sapar-btn-recom" />
				<input type="button" value="返回" class="sapar-btn sapar-btn-recom" onclick="back()" />
			</div>
		</form>
	</div>

</body>
</html>