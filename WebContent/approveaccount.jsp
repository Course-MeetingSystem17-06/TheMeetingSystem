<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css">
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>人员管理 > 注册审批</h2>
		</div>
		<c:if test="${requestScope.employeesList!=null}">
			<div class="table">
				<div class="table-box">
					<table>
						<thead>
							<tr class="listheader">
								<th>姓名</th>
								<th>账户名</th>
								<th>联系电话</th>
								<th>电子邮件</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:forEach var="emp" items="${requestScope.employeesList}">
							<tr>
								<td>${emp.employeename }</td>
								<td>${emp.username}</td>
								<td>${emp.phone }</td>
								<td>${emp.email }</td>
								<td><input style="margin: 5px;" type="button" class="sapar-btn sapar-btn-recom" value="通过"
									onclick="window.location.href='ApproveServlet?employeeid=${emp.employeeid }&oper=yes'" />
									<input style="margin: 5px;" type="button" class="sapar-btn sapar-btn-recom" value="不通过"
									onclick="window.location.href='ApproveServlet?employeeid=${emp.employeeid }&oper=no'" />
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>