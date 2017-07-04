<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">个人中心 > 最新通知</div>
		<table class="listtable">
			<caption>未来7天我要参加的会议:</caption>
			<tr class="listheader">
				<th>会议名称</th>
				<th>会议室</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>操作</th>
			</tr>
			<c:forEach var="emp" items="${requestScope.latestmeetingsList}">
				<tr>
					<td>${emp.meetingname}</td>
					<td>${emp.meetingroomname}</td>
					<td><fmt:formatDate value="${emp.meetingstarttime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${emp.meetingendtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a class="clickbutton"
						href="UpdateMeetingServlet?code=notification&meetingid=${emp.meetingid}&user=${requestScope.user}">查看详情</a></td>
				</tr>
			</c:forEach>
		</table>
		<table class="listtable">
			<caption>已取消的会议:</caption>
			<tr class="listheader">
				<th>会议名称</th>
				<th>会议室</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>取消原因</th>
				<th>操作</th>
			</tr>
			<c:forEach var="emp" items="${requestScope.cancelmeetingsList}">
				<tr>
					<td>${emp.meetingname}</td>
					<td>${emp.meetingroomname}</td>
					<td>${emp.meetingstarttime}</td>
					<td>${emp.meetingendtime}</td>
					<td>${emp.meetingcancelreason}</td>
					<td><a class="clickbutton"
						href="UpdateMeetingServlet?code=notification&meetingid=${emp.meetingid}&user=${requestScope.user}">查看详情</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>