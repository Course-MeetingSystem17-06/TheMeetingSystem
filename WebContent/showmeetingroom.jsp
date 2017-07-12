<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css" />
<script type="text/javascript">
	/* 	function getRemark() {
	 var message = document.getElementById("roomremark").value;
	 document.getElementById("roomremark_value").value = message;
	 } */
</script>
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>会议预定 > 查看会议室</h2>
		</div>
		<div class="table">
			<div class="table-box">
				<table>
					<thead>
						<tr class="listheader">
							<th>门牌编号</th>
							<th>会议室名称</th>
							<th>容纳人数</th>
							<th>当前状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach var="emp" items="${requestScope.meetingroomsList}">
						<tr>
							<td class="red bold">${emp.roomnumber}</td>
							<td>${emp.roomname }</td>
							<td class="orange bold">${emp.roommax }</td>
							<td>${emp.roomstate }</td>
							<td><a class="clickbutton"
								href="UpdateMeetingRoomServlet?code=detail&roomid=${emp.roomid}">查看详情</a>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>