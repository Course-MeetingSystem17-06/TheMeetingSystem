<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">个人中心 > 我的预定</div>
		<table class="listtable">
			<caption>我预定的会议:</caption>
			<tr class="listheader">
				<th>会议名称</th>
				<th>会议室名称</th>
				<th>会议开始时间</th>
				<th>会议结束时间</th>
				<th>会议预定时间</th>
				<th>操作</th>
			</tr>
			<c:forEach var="emp" items="${requestScope.meetingsList}">
				<tr>
					<td>${emp.meetingname}</td>
					<td>${emp.meetingroomname}</td>
					<td>${emp.meetingstarttime}</td>
					<td>${emp.meetingendtime}</td>
					<td>${emp.meetingbookdate}</td>
					<td><a class="clickbutton"
						href="UpdateMeetingServlet?code=mybooked&meetingid=${emp.meetingid}&user=${emp.meetingbooker}">查看/撤销</a>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>