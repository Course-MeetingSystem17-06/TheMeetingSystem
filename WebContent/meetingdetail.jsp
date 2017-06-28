
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
	function back() {
		window.location.href = "SearchMeetingsServlet";
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 修改会议预定</div>
		<form name="form1"
			action="UpdateMeetingServlet?code=update&meetingid=${requestScope.meetingid}"
			method="post">
			<fieldset>
				<legend>会议信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>会议名称:</td>
						<td><font>${requestScope.name}</font>
						</td>
					</tr>
					<tr>
						<td>预计参加人数:</td>
						<td><font>${requestScope.participatenumber}</font>
						</td>
					</tr>
					<tr>
						<td>预计开始时间:</td>
						<td><font>${requestScope.starttime}</font>
						</td>
					</tr>
					<tr>
						<td>预计结束时间:</td>
						<td><font>${requestScope.endtime}</font>
						</td>
					</tr>
					<tr>
						<td>备注：</td>
						<td><textarea id="illustrate" name="illustrate"
								maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述"">${requestScope.illustrate}</textarea></td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input type="submit"
							value="确认修改" class="clickbutton" /> <input type=button
							value="返回" class="clickbutton" onclick="back()" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>