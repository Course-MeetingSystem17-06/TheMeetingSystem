<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<style type="text/css">
</style>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function goToOnePage(meetingname, meetingroomname, meetingbooker, meetingbookdatestart, meetingbookdateend, meetingstarttime, meetingendtime) {
		var pageNum = document.getElementById("pageNum").value;
		if (pageNum == "") {
			window.location.href = "#";
		} else {
			window.location.href = "SearchMeetingsServlet?meetingname="
					+ meetingname + "&meetingroomname=" + meetingroomname
					+ "&meetingbooker=" + meetingbooker
					+ "&meetingbookdatestart=" + meetingbookdatestart
					+ "&meetingbookdateend=" + meetingbookdateend
					+ "&meetingstarttime=" + meetingstarttime
					+ "&meetingendtime=" + meetingendtime + "&pageNum="
					+ pageNum;
		}
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 >搜索会议</div>
		<form method="post" action="SearchMeetingsServlet">
			<fieldset>
				<legend>搜索会议</legend>
				<table class="formtable">
					<tr>
						<td>会议名称：</td>
						<td><input type="text" id="meetingname" name="meetingname"
							maxlength="20" value="${param.meetingname}" /></td>
						<td>会议室名称：</td>
						<td><input type="text" id="meetingroomname"
							name="meetingroomname" maxlength="20"
							value="${param.meetingroomname}" /></td>
						<td>预定者姓名：</td>
						<td><input type="text" id="meetingbooker"
							name="meetingbooker" maxlength="20"
							value="${param.meetingbooker}" /></td>
					</tr>
					<tr>
						<td>预定日期： 从</td>
						<td><input id=meetingbookdatestart
							name="meetingbookdatestart" class="Wdate" type="text"
							onClick="WdatePicker({maxDate:'#F{$dp.$D(\'meetingbookdateend\')}'})"
							value="${param.meetingbookdatestart}" />
						</td>
						<td>到</td>
						<td><input id=meetingbookdateend name="meetingbookdateend"
							class="Wdate" type="text"
							onClick="WdatePicker({minDate:'#F{$dp.$D(\'meetingbookdatestart\')}'})"
							value="${param.meetingbookdateend}" />
						</td>
						<td>会议日期： 从</td>
						<td><input id=meetingstarttime name="meetingstarttime"
							class="Wdate" type="text"
							onClick="WdatePicker({maxDate:'#F{$dp.$D(\'meetingendtime\')}'})"
							value="${param.meetingstarttime}" />
						</td>
						<td>到</td>
						<td><input id=meetingendtime name="meetingendtime"
							class="Wdate" type="text"
							onClick="WdatePicker({minDate:'#F{$dp.$D(\'meetingstarttime\')}'})"
							value="${param.meetingendtime}" />
						</td>
					</tr>
					<tr>
						<td colspan="6" class="command"><input type="submit"
							class="clickbutton" value="查询" /> <input type="reset"
							class="clickbutton" value="重置" /></td>
					</tr>
				</table>
			</fieldset>
		</form>

		<c:if test="${requestScope.search eq 1 }">
			<div>
				<h3 style="text-align: center; color: black">查询结果</h3>
				<div class="pager-header">
					<div class="header-info">
						共<span class="info-number">${requestScope.countOfMeetings}</span>条结果，
						分成<span class="info-number">${requestScope.countOfPages}</span>页显示，
						当前第<span class="info-number">${requestScope.pageNum}</span>页
					</div>
					<div class="header-nav">
						<input type="button" class="clickbutton" value="首页"
							onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=1'" />
						<c:choose>
							<c:when test="${requestScope.pageNum ne '1'}">
								<input type="button" class="clickbutton" value="上页"
									onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum-1}'" />
							</c:when>
							<c:otherwise>
								<input disabled="disabled" type="button" class="clickbutton"
									value="上页"
									onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum-1}'" />
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when
								test="${requestScope.pageNum ne requestScope.countOfPages}">
								<input type="button" class="clickbutton" value="下页"
									onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum+1}'" />
							</c:when>
							<c:otherwise>
								<input disabled="disabled" type="button" class="clickbutton"
									value="下页"
									onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum+1}'" />
							</c:otherwise>
						</c:choose>
						<input type="button" class="clickbutton" value="末页"
							onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.countOfPages}'" />
						跳到第<input type="text" id="pageNum" name="pageNum"
							class="nav-number" value=${param.pageNum}>页 <input
							type="button" class="clickbutton" value="跳转"
							onclick="goToOnePage('${param.meetingname}','${param.meetingroomname}','${param.meetingbooker}','${param.meetingbookdatestart}','${param.meetingbookdateend}','${param.meetingstarttime}','${param.meetingendtime}')" />
					</div>
				</div>
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
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${emp.meetingendtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${emp.meetingbookdate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${emp.meetingbooker}</td>
						<td><a class="clickbutton"
							href="UpdateMeetingServlet?code=detail&meetingid=${emp.meetingid}">查看详情</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<div class="page-footer">
		<hr />
		更多问题，欢迎联系<a href="mailto:webmaster@eeg.com">管理员</a> <img
			src="images/footer.png" alt="CoolMeeting" />
	</div>
</body>
</html>