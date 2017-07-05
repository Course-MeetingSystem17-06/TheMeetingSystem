<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css" />
<script type="text/javascript">
	function goToOnePage(meetingname, meetingroomname, meetingbooker,
			meetingbookdatestart, meetingbookdateend, meetingstarttime,
			meetingendtime) {
		var pageNum = document.getElementById("pageNum").value;
		if (pageNum == "") {
			window.location.href = "#";
		} else {
			window.location.href = "ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum="
					+ pageNum;
		}
	}
</script>
</head>
<body>
	<div class="saper-content">
		<div class="subfiled">
			<h2>个人中心 > 我的会议</h2>
		</div>
		<div class="subfiled-content">
			<div class="asaform">
				<c:if test="${requestScope.search eq 1 }">
						<div class="pager-header" style="height: 30px;">
							<div style="float: left" class="header-info">
								共<span class="info-number">${requestScope.countOfMeetings}</span>条结果，
								分成<span class="info-number">${requestScope.countOfPages}</span>页显示，
								当前第<span class="info-number">${requestScope.pageNum}</span>页
							</div>
							<div style="float: right" class="header-nav">
								<input type="button" class="clickbutton" value="首页"
									onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=1'" />
								<c:choose>
									<c:when test="${requestScope.pageNum ne '1'}">
										<input type="button" class="clickbutton" value="上页"
											onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=${requestScope.pageNum-1}'" />
									</c:when>
									<c:otherwise>
										<input disabled="disabled" type="button" class="clickbutton"
											value="上页"
											onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=${requestScope.pageNum-1}'" />
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when
										test="${requestScope.pageNum ne requestScope.countOfPages}">
										<input type="button" class="clickbutton" value="下页"
											onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=${requestScope.pageNum+1}'" />
									</c:when>
									<c:otherwise>
										<input disabled="disabled" type="button" class="clickbutton"
											value="下页"
											onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=${requestScope.pageNum+1}'" />
									</c:otherwise>
								</c:choose>
								<input type="button" class="clickbutton" value="末页"
									onclick="window.location.href='ViewAllAttendMeetingsServlet?code=viewattendmeetings&user=${requestScope.user}&pageNum=${requestScope.countOfPages}'" />
								跳到第<input type="text" id="pageNum" name="pageNum"
									class="nav-number" value=${param.pageNum}>页 <input
									type="button" class="clickbutton" value="跳转"
									onclick="goToOnePage('${param.meetingname}','${param.meetingroomname}','${param.meetingbooker}','${param.meetingbookdatestart}','${param.meetingbookdateend}','${param.meetingstarttime}','${param.meetingendtime}')" />
							</div>
						</div>
					<div class="subfiled-style2">
						<h2>我将参加的会议:</h2>
					</div>
					<table class="listtable">

						<tr class="listheader">
							<th>会议名称</th>
							<th>会议室名称</th>
							<th>会议开始时间</th>
							<th>会议结束时间</th>
							<th>会议预定时间</th>
							<th>预定者</th>
							<th>操作</th>
						</tr>
						<c:forEach var="emp" items="${requestScope.meetingsList}">
							<tr>
								<td>${emp.meetingname}</td>
								<td>${emp.meetingroomname}</td>
								<td><fmt:formatDate value="${emp.meetingstarttime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td><fmt:formatDate value="${emp.meetingendtime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td><fmt:formatDate value="${emp.meetingbookdate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${emp.meetingbooker}</td>
								<td><a class="clickbutton"
									href="UpdateMeetingServlet?code=attend&meetingid=${emp.meetingid}&user=${requestScope.user}">查看详情</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>