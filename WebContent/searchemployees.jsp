<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css" />
<style type="text/css">
</style>

<script type="text/javascript">
	function goToOnePage(employeename, username, status) {
		var pageNum = document.getElementById("pageNum").value;
		if (pageNum == "") {
			window.location.href = "#";
		} else {
			window.location.href = "SearchEmployeesServlet?employeename="
					+ employeename + "&username=" + username + "&status="
					+ status + "&pageNum=" + pageNum;
		}
	}
</script>
</head>
<body>
	<div class="saper-content">
		<div class="subfiled">
			<h2>人员管理 > 搜索员工</h2>
		</div>
		<div class="subfiled-content">
			<form method="post" action="SearchEmployeesServlet">
				<div class="kv-item">
					<label>姓名：</label>
					<div class="kv-item-content">
						<input type="text" id="employeename" name="employeename"
							value="${param.employeename}" maxlength="20" />
					</div>
				</div>
				<div class="kv-item">
					<label>账号名：</label>

					<div class="kv-item-content">
						<input type="text" id="username" name="username"
							value="${param.username}" maxlength="20" />
					</div>
				</div>
				<div class="kv-item">
					<label>状态：</label>

					<div class="kv-item-content choose">
						<c:if test="${param.status eq null or param.status eq '' or param.status eq 3}">
							<input type="radio" id="status" name="status" value="1" />
							<span>已批准</span>
							<input type="radio" id="status" name="status" value="0" />
							<span>待审批</span>
							<input type="radio" id="status" name="status" value="2" />
							<span>已关闭</span>
							<input type="radio" id="status" name="status" value="3" checked>
							<span>所有</span>
						</c:if>
						<c:if test="${param.status eq '1'}">
							<input type="radio" id="status" name="status" value="1" checked />
							<span>已批准</span>
							<input type="radio" id="status" name="status" value="0" />
							<span>待审批</span>
							<input type="radio" id="status" name="status" value="2" />
							<span>已关闭</span>
							<input type="radio" id="status" name="status" value="3" />
							<span>所有</span>
						</c:if>
						<c:if test="${param.status eq '0'}">
							<input type="radio" id="status" name="status" value="1" />
							<span>已批准</span>
							<input type="radio" id="status" name="status" value="0" checked />
							<span>待审批</span>
							<input type="radio" id="status" name="status" value="2" />
							<span>已关闭</span>
							<input type="radio" id="status" name="status" value="3" />
							<span>所有</span>
						</c:if>
						<c:if test="${param.status eq '2'}">
							<input type="radio" id="status" name="status" value="1" />
							<span>已批准</span>
							<input type="radio" id="status" name="status" value="0" />
							<span>待审批</span>
							<input type="radio" id="status" name="status" value="2" checked />
							<span>已关闭</span>
							<input type="radio" id="status" name="status" value="3" />
							<span>所有</span>
						</c:if>
					</div>
				</div>
				<input type="submit" class="sapar-btn sapar-btn-recom" value="查询" />
				<input type="reset" class="sapar-btn sapar-btn-recom" value="重置" />
			</form>

			<c:if test="${requestScope.search eq 1 }">
				<div class="subfiled-style2">
					<h2>查询结果</h2>
				</div>
				<div>
					<div class="subfiled-content">
						<div class="asaform">
							<div class="pager-header">
								<div style="float: left" class="header-info">
									共<span class="info-number">${requestScope.countOfEmployees}</span>条结果，
									分成<span class="info-number">${requestScope.countOfPages}</span>页显示，
									当前第<span class="info-number">${requestScope.pageNum}</span>页
								</div>
								<div style="float: right" class="header-nav">
									<input type="button" class="sapar-btn sapar-btn-recom"
										value="首页"
										onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=1'" />
									<c:choose>
										<c:when test="${requestScope.pageNum ne '1'}">
											<input type="button" class="sapar-btn sapar-btn-recom"
												value="上页"
												onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.pageNum-1}'" />
										</c:when>
										<c:otherwise>
											<input disabled="disabled" type="button"
												class="sapar-btn sapar-btn-recom" value="上页"
												onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.pageNum-1}'" />
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when
											test="${requestScope.pageNum ne requestScope.countOfPages}">
											<input type="button" class="sapar-btn sapar-btn-recom"
												value="下页"
												onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.pageNum+1}'" />
										</c:when>
										<c:otherwise>
											<input disabled="disabled" type="button"
												class="sapar-btn sapar-btn-recom" value="下页"
												onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.pageNum+1}'" />
										</c:otherwise>
									</c:choose>
									<input type="button" class="sapar-btn sapar-btn-recom"
										value="末页"
										onclick="window.location.href='SearchEmployeesServlet?employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.countOfPages}'" />
									跳到第<input type="text" id="pageNum" name="pageNum" class="jump"
										value=${param.pageNum}>页 <input type="button"
										class="sapar-btn sapar-btn-recom" value="跳转"
										onclick="goToOnePage('${param.employeename}','${param.username}','${param.status}')" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="table">
					<div class="table-box">
						<table>
							<thead>
								<tr class="listheader">
									<th>姓名</th>
									<th>账号名</th>
									<th>联系电话</th>
									<th>电子邮件</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:forEach var="emp" items="${requestScope.employeesList}">
								<tr>
									<td class="orange bold">${emp.employeename}</td>
									<td class="red bold">${emp.username}</td>
									<td>${emp.phone}</td>
									<td>${emp.email}</td>
									<c:if test="${emp.status eq '2' }">
										<td>账号已关闭</td>
									</c:if>
									<c:if test="${emp.status ne '2' }">
										<td><a class="clickbutton"
											href="ApproveServlet?employeeid=${emp.employeeid}&employeename=${param.employeename}&username=${param.username}&status=${param.status}&pageNum=${requestScope.pageNum}&oper=close">关闭账号</a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>