<%@ page language="java"
	import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css">
</head>
<body>
	<div class="page-content">
		<div class="content-nav">人员管理 > 注册审批</div>

		<form action="AddDeleteDepartmentServlet" method="post">
			<fieldset>
				<legend>添加部门</legend>
				部门名称： <input type="text" name="departmentname" maxlength="20" /> <input
					type="hidden" name="code" value="add"> <input type="submit"
					class="clickbutton" value="添加" />
			</fieldset>
		</form>
		<c:if test="${requestScope.departmentsList!=null}">
			<table class="listtable">
				<caption>所有部门：</caption>
				<tr class="listheader">
					<th>部门编号</th>
					<th>部门名称</th>
					<th>操作</th>
				</tr>
				<c:forEach var="emp" items="${requestScope.departmentsList}">
					<tr>
						<td>${emp.departmentid }</td>
						<td>${emp.departmentname }</td>
						<td><a class="clickbutton"
							href="AddDeleteDepartmentServlet?code=delete&departmentid=${emp.departmentid}">删除</a>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>