
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
	function back() {
		var type = "${requestScope.pagetype}";
		var user = "${requestScope.user}";
		if (type == "mybooked") {
			window.location.href = "ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&user="
					+ user;
		} else if (type == "notification") {
			window.location.href = "ViewMyNotificationServlet?user=" + user;
		} else {
			window.location.href = "SearchMeetingsServlet";
		}
	}
	function cancel() {
		document.getElementById("form1").action = "UpdateMeetingServlet?code=cancel&meetingid=${requestScope.meetingid}&meetingname=${requestScope.name}";
	}
	function update() {
		document.getElementById("form1").action = "UpdateMeetingServlet?code=update&meetingid=${requestScope.meetingid}";
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 修改会议预定</div>
		<form id="form1" 　name="form1" action="" method="post">
			<fieldset>
				<legend>会议信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font>
					</td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>会议名称:</td>
						<td><font id="a111">${requestScope.name}</font></td>
					</tr>
					<tr>
						<td>预计参加人数:</td>
						<td><font>${requestScope.participatenumber}</font></td>
					</tr>
					<tr>
						<td>预计开始时间:</td>
						<td><font>${requestScope.starttime}</font></td>
					</tr>
					<tr>
						<td>预计结束时间:</td>
						<td><font>${requestScope.endtime}</font></td>
					</tr>
					<tr>
						<td>备注：</td>
						<td><textarea id="illustrate" name="illustrate"
								maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述"">${requestScope.illustrate}</textarea>
						</td>
					</tr>
					<tr>
						<td>参会人员：</td>
						<td>
							<table class="listtable">
								<caption></caption>
								<tr class="listheader">
									<th>姓名</th>
									<th>联系电话</th>
									<th>电子邮件</th>
								</tr>
								<c:forEach var="emp"
									items="${requestScope.meetingemployeesList}">
									<tr>
										<td>${emp.employeename}</td>
										<td>${emp.phone}</td>
										<td>${emp.email}</td>
									</tr>
								</c:forEach>
							</table></td>
					</tr>
					<tr>
						<td colspan="2" class="command"><c:if
								test="${requestScope.pagetype eq 'mybooked'}">
								<input type="submit" value="撤销会议" class="clickbutton"
									onclick="cancel()" />
								<input type="submit" value="确认修改" class="clickbutton"
									onclick="update()" />
							</c:if><input type="button" value="返回" class="clickbutton"
							onclick="back()" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>