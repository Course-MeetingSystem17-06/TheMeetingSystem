
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form_input.css" />
<script type="text/javascript">
	function back() {
		var type = "${requestScope.pagetype}";
		var user = "${requestScope.user}";
		if (type == "mybooked") {
			window.location.href = "ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&user="
					+ user;
		} else if (type == "notification") {
			window.location.href = "ViewMyNotificationServlet?user=" + user;
		} else if (type == "attend") {
			window.location.href = "ViewAllAttendMeetingsServlet?code=viewattendmeetings&user="
					+ user;
		} else {
			window.location.href = "SearchMeetingsServlet";
		}
	}
	function cancel() {
		document.getElementById("form1").action = "UpdateMeetingServlet?code=cancel&meetingid=${requestScope.meetingid}&meetingname=${requestScope.name}&user=${requestScope.user}";
	}
	function update() {
		document.getElementById("form1").action = "UpdateMeetingServlet?code=update&meetingid=${requestScope.meetingid}&user=${requestScope.user}";
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>会议预定 > 修改会议预定</h2>
		</div>
		<form class="fm" id="form1" name="form1" action="" method="post">
			<div class="kv-item clearfix">
				<label>提示信息：</label>
				<div class="kv-item-content">
					<font color="red">${requestScope.msg}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>会议名称：</label>
				<div class="kv-item-content">
					<font id="a111">${requestScope.name}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>预计参加人数：</label>
				<div class="kv-item-content">
					<font>${requestScope.participatenumber}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>预计开始时间：</label>
				<div class="kv-item-content">
					<font><fmt:formatDate value="${requestScope.starttime}"
							pattern="yyyy-MM-dd HH:mm:ss" /> </font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>预计结束时间：</label>
				<div class="kv-item-content">
					<font><fmt:formatDate value="${requestScope.endtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /> </font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>备注：</label>
				<div class="kv-item-content">
					<textarea id="illustrate" name="illustrate" maxlength="200"
						rows="5" cols="60" placeholder="200字以内的文字描述"">${requestScope.illustrate}</textarea>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label>参会人员：</label>
				<div class="kv-item-content">
					<div class="table">
						<div class="table-box">
							<table>
								<thead>
									<tr class="listheader">
										<th>姓名</th>
										<th>联系电话</th>
										<th>电子邮件</th>
									</tr>
								</thead>
								<c:forEach var="emp"
									items="${requestScope.meetingemployeesList}">
									<tr>
										<td>${emp.employeename}</td>
										<td>${emp.phone}</td>
										<td>${emp.email}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="button">
						<c:if test="${requestScope.pagetype eq 'mybooked'}">
							<input type="submit" value="撤销会议"
								class="sapar-btn sapar-btn-recom" onclick="cancel()" />
							<input type="submit" value="确认修改"
								class="sapar-btn sapar-btn-recom" onclick="update()" />
						</c:if>
						<input type="button" value="返回" class="sapar-btn sapar-btn-recom"
							onclick="back()" />
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>