<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<script type="text/javascript">
function goToOnePage(meetingname, meetingroomname, meetingbooker,
		meetingbookdatestart, meetingbookdateend, meetingstarttime,
		meetingendtime) {
	var pageNum = document.getElementById("pageNum").value;
	if (pageNum == "") {
		window.location.href = "#";
	} else {
		window.location.href = "ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum="
				+ pageNum;
	}
}

</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">个人中心 > 我的预定</div>



		<c:if test="${requestScope.search eq 1 }">
			<div>
				<div class="pager-header">
					<div class="header-info">
						共<span class="info-number">${requestScope.countOfMeetings}</span>条结果，
						分成<span class="info-number">${requestScope.countOfPages}</span>页显示，
						当前第<span class="info-number">${requestScope.pageNum}</span>页
					</div>
					<div class="header-nav">
						<input type="button" class="clickbutton" value="首页"
							onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=1'" />
						<c:choose>
							<c:when test="${requestScope.pageNum ne '1'}">
								<input type="button" class="clickbutton" value="上页"
									onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=${requestScope.pageNum-1}'" />
							</c:when>
							<c:otherwise>
								<input disabled="disabled" type="button" class="clickbutton"
									value="上页"
									onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=${requestScope.pageNum-1}'" />
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when
								test="${requestScope.pageNum ne requestScope.countOfPages}">
								<input type="button" class="clickbutton" value="下页"
									onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=${requestScope.pageNum+1}'" />
							</c:when>
							<c:otherwise>
								<input disabled="disabled" type="button" class="clickbutton"
									value="下页"
									onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=${requestScope.pageNum+1}'" />
							</c:otherwise>
						</c:choose>
						<input type="button" class="clickbutton" value="末页"
							onclick="window.location.href='ViewMyBookedMeetingsServlet?code=viewMyBookedmeetings&meetingbooker=${requestScope.meetingbooker}&pageNum=${requestScope.countOfPages}'" />
						跳到第<input type="text" id="pageNum" name="pageNum"
							class="nav-number" value=${param.pageNum}>页 <input
							type="button" class="clickbutton" value="跳转"
							 />
					</div>
				</div>
			</div>




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
						<td><fmt:formatDate value="${emp.meetingstarttime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${emp.meetingendtime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${emp.meetingbookdate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><a class="clickbutton"
							href="UpdateMeetingServlet?code=mybooked&meetingid=${emp.meetingid}&user=${emp.meetingbooker}">查看/撤销</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>
<!-- onclick="goToOnePage('${param.meetingname}','${param.meetingroomname}','${param.meetingbooker}','${param.meetingbookdatestart}','${param.meetingbookdateend}','${param.meetingstarttime}','${param.meetingendtime}')" -->