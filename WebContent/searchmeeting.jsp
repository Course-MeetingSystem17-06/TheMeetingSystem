<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form.css" />
<style type="text/css">
</style>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function goToOnePage(meetingname, meetingroomname, meetingbooker,
			meetingbookdatestart, meetingbookdateend, meetingstarttime,
			meetingendtime) {
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
	<div class="saper-content">
		<div class="subfiled">
			<h2>会议预定 >搜索会议</h2>
		</div>
		<div class="subfiled-content">
			<form method="post" action="SearchMeetingsServlet">
				<div class="kv-item">
					<label>会议名称：</label>
					<div class="kv-item-content">
						<input type="text" id="meetingname" name="meetingname"
							maxlength="20" value="${param.meetingname}" />
					</div>
				</div>
				<div class="kv-item">
					<label>会议室名称：</label>
					<div class="kv-item-content">
						<input type="text" id="meetingroomname" name="meetingroomname"
							maxlength="20" value="${param.meetingroomname}" />
					</div>
				</div>
				<div class="kv-item">
					<label>预定者姓名：</label>
					<div class="kv-item-content">
						<input type="text" id="meetingbooker" name="meetingbooker"
							maxlength="20" value="${param.meetingbooker}" />
					</div>
				</div>
				<div class="kv-item">
					<label>预定日期：</label>
					<div class="kv-item-content time-select-wrap">
						<div class="time-select">
							<input id=meetingbookdatestart name="meetingbookdatestart"
								type="text"
								onClick="WdatePicker({maxDate:'#F{$dp.$D(\'meetingbookdateend\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								value="${param.meetingbookdatestart}" /><i class="date-icon"></i>
						</div>
						<span class="line">到</span>
						<div class="time-select">
							<input id=meetingbookdateend name="meetingbookdateend"
								type="text"
								onClick="WdatePicker({minDate:'#F{$dp.$D(\'meetingbookdatestart\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								value="${param.meetingbookdateend}" /><i class="date-icon"></i>
						</div>
					</div>
				</div>
				<div class="kv-item">
					<label>会议日期：</label>
					<div class="kv-item-content time-select-wrap">
						<div class="time-select">
							<input id=meetingstarttime name="meetingstarttime" type="text"
								onClick="WdatePicker({maxDate:'#F{$dp.$D(\'meetingendtime\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								value="${param.meetingstarttime}" /><i class="date-icon"></i>
						</div>
						<span class="line">到</span>
						<div class="time-select">
							<input id=meetingendtime name="meetingendtime" type="text"
								onClick="WdatePicker({minDate:'#F{$dp.$D(\'meetingstarttime\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								value="${param.meetingendtime}" /><i class="date-icon"></i>
						</div>
					</div>
				</div>
				<div style="float: left; margin-left: 20px;">
					<input type="submit" class="sapar-btn sapar-btn-recom" value="查询" />
					<input type="reset" class="sapar-btn sapar-btn-recom" value="重置" />
				</div>
			</form>
			<div style="margin-top: 80px;" class="subfiled-style2">
				<h2>查询结果</h2>
			</div>
			<c:if test="${requestScope.search eq 1 }">

				<div>
					<div class="subfiled-content">
						<div class="asaform">
							<div class="pager-header">
								<div style="float: left" class="header-info">
									共<span class="info-number">${requestScope.countOfMeetings}</span>条结果，
									分成<span class="info-number">${requestScope.countOfPages}</span>页显示，
									当前第<span class="info-number">${requestScope.pageNum}</span>页
								</div>
								<div style="float: right" class="header-nav">
									<input type="button" class="sapar-btn sapar-btn-recom"
										value="首页"
										onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=1'" />
									<c:choose>
										<c:when test="${requestScope.pageNum ne '1'}">
											<input type="button" class="sapar-btn sapar-btn-recom"
												value="上页"
												onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum-1}'" />
										</c:when>
										<c:otherwise>
											<input disabled="disabled" type="button"
												class="sapar-btn sapar-btn-recom" value="上页"
												onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum-1}'" />
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when
											test="${requestScope.pageNum ne requestScope.countOfPages}">
											<input type="button" class="sapar-btn sapar-btn-recom"
												value="下页"
												onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum+1}'" />
										</c:when>
										<c:otherwise>
											<input disabled="disabled" type="button"
												class="sapar-btn sapar-btn-recom" value="下页"
												onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.pageNum+1}'" />
										</c:otherwise>
									</c:choose>
									<input type="button" class="sapar-btn sapar-btn-recom"
										value="末页"
										onclick="window.location.href='SearchMeetingsServlet?meetingname=${param.meetingname}&meetingroomname=${param.meetingroomname}&meetingbooker=${param.meetingbooker}&meetingbookdatestart=${param.meetingbookdatestart}&meetingbookdateend=${param.meetingbookdateend}&meetingstarttime=${param.meetingstarttime}&meetingendtime=${param.meetingendtime}&pageNum=${requestScope.countOfPages}'" />
									跳到第<input type="text" id="pageNum" name="pageNum" class="jump"
										value=${param.pageNum}>页 <input type="button"
										class="sapar-btn sapar-btn-recom" value="跳转"
										onclick="goToOnePage('${param.meetingname}','${param.meetingroomname}','${param.meetingbooker}','${param.meetingbookdatestart}','${param.meetingbookdateend}','${param.meetingstarttime}','${param.meetingendtime}')" />
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
									<th>会议名称</th>
									<th>会议室名称</th>
									<th>会议开始时间</th>
									<th>会议结束时间</th>
									<th>会议预定时间</th>
									<th>预定者</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:forEach var="emp" items="${requestScope.meetingsList}">
								<tr>
									<td class="red bold">${emp.meetingname}</td>
									<td>${emp.meetingroomname}</td>
									<td class="orange bold"><fmt:formatDate
											value="${emp.meetingstarttime}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td><fmt:formatDate value="${emp.meetingendtime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td><fmt:formatDate value="${emp.meetingbookdate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>${emp.meetingbooker}</td>
									<td><a class="clickbutton"
										href="UpdateMeetingServlet?code=detail&meetingid=${emp.meetingid}">查看详情</a>
									</td>
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