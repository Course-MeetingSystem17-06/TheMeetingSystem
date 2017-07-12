<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css" />
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>个人中心 > 最新通知</h2>
		</div>
		<div style="margin-bottom: 7px;" class="subfiled-style2">
			<h2>未来7天我要参加的会议:</h2>
		</div>
		<div class="table">
			<div class="table-box">
				<table>
					<thead>
						<tr class="listheader">
							<th>会议名称</th>
							<th>会议室</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach var="emp" items="${requestScope.latestmeetingsList}">
						<tr>
							<td class="red bold">${emp.meetingname}</td>
							<td>${emp.meetingroomname}</td>
							<td class="orange bold"><fmt:formatDate
									value="${emp.meetingstarttime}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><fmt:formatDate value="${emp.meetingendtime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><a class="clickbutton"
								href="UpdateMeetingServlet?code=notification&meetingid=${emp.meetingid}&user=${requestScope.user}">查看详情</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div style="margin-bottom: 7px; margin-top: 10px;"
			class="subfiled-style2">
			<h2>已取消的会议:</h2>
		</div>
		<div class="table">
			<div class="table-box">
				<table>
					<thead>
						<tr class="listheader">
							<th>会议名称</th>
							<th>会议室</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>取消原因</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach var="emp" items="${requestScope.cancelmeetingsList}">
						<tr>
							<td class="red bold">${emp.meetingname}</td>
							<td>${emp.meetingroomname}</td>
							<td class="orange bold"><fmt:formatDate
									value="${emp.meetingstarttime}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><fmt:formatDate value="${emp.meetingendtime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>${emp.meetingcancelreason}</td>
							<td><a class="clickbutton"
								href="UpdateMeetingServlet?code=notification&meetingid=${emp.meetingid}&user=${requestScope.user}">查看详情</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>