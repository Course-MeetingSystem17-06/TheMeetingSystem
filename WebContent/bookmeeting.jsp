<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/form_input.css" />
<style type="text/css">
#divfrom {
	float: left;
	width: 150px;
}

#divto {
	float: left;
	width: 150px;
}

#divoperator {
	float: left;
	width: 50px;
	padding: 60px 5px;
}

#divoperator input[type="button"] {
	margin: 10px 0;
}

#selDepartments {
	display: block;
	width: 100%;
}

#selEmployees {
	display: block;
	width: 100%;
	height: 200px;
}

#selSelectedEmployees {
	display: block;
	width: 100%;
	height: 225px;
}
</style>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function employee(employeeid, employeename) {
		this.employeeid = employeeid;
		this.employeename = employeename;
	}
	function department(departmentid, departmentname, employees) {
		this.departmentid = departmentid;
		this.departmentname = departmentname;
		this.employees = employees;
	}

	var selDepartments;
	var selEmployees;
	var selSelectedEmployees;

	/////////////////////////////////////////
	function showEmployees() {
		createXMLHttpRequest();

		var deptid = document.getElementById("selDepartments").value;
		var deptid1 = encodeURI(encodeURI(deptid));
		var url = "SelectEmployeesOfDeptServlet_647?departmentid=" + deptid1
				+ "";
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = callback;
		xmlHttp.send(null);
	}

	function saveEmployees() {
		createXMLHttpRequest();
		var options = document.getElementById("selSelectedEmployees").options;
		for ( var i = 0; i < options.length; i++) {
			var deptid = options[i].value;//username
			var deptid1 = encodeURI(encodeURI(deptid));
			var url = "BookMeetingServlet?Employeeusername=" + deptid1 + "";
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
		}

	}

	function callback() {
		clearEmployees();
		var selEmployees = document.getElementById("selEmployees");
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {

				var elements = xmlHttp.responseXML
						.getElementsByTagName("option");
				for ( var i = 0; i < elements.length; i++) {
					var value = elements[i].getElementsByTagName("value")[0].firstChild.nodeValue;
					var text = elements[i].getElementsByTagName("text")[0].firstChild.nodeValue;
					selEmployees.options.add(new Option(text, value));
				}
			}
		}

	}
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function clearEmployees() {
		document.getElementById("selEmployees").options.length = 0;
	}
	function selectEmployees() {
		var selEmployees = document.getElementById("selEmployees");
		var selSelectedEmployees = document
				.getElementById("selSelectedEmployees");
		for ( var i = 0; i < selEmployees.options.length; i++) {
			if (selEmployees.options[i].selected) {
				var opt = new Option(selEmployees.options[i].text,
						selEmployees.options[i].value);
				opt.selected = true;
				selSelectedEmployees.options.add(opt);
				selEmployees.options.remove(i);
			}
		}
	}

	function deSelectEmployees() {
		var selEmployees = document.getElementById("selEmployees");
		var selSelectedEmployees = document
				.getElementById("selSelectedEmployees");
		for ( var i = 0; i < selSelectedEmployees.options.length; i++) {
			if (selSelectedEmployees.options[i].selected) {
				selEmployees.options.add(new Option(
						selSelectedEmployees.options[i].text,
						selSelectedEmployees.options[i].value));
				selSelectedEmployees.options.remove(i);
			}
		}
		setSelected();
	}

	function checkSelectnull() {
		var selEmployees = document.getElementById("selEmployees");
		var selSelectedEmployees = document
				.getElementById("selSelectedEmployees");
		if (selSelectedEmployees.options.length == 0) {
			alert("不可为空 ");
			document.getElementById('book_button').disabled = false;
		}

	}

	function setSelected() {
		var selSelectedEmployees = document
				.getElementById("selSelectedEmployees");
		for ( var i = 0; i < selSelectedEmployees.options.length; i++) {
			selSelectedEmployees.options[i].selected = true;
		}
	}

	function refreshRooms() {
		createXMLHttpRequest();
		var starttime = document.getElementById("starttime").value;
		var endtime = document.getElementById("endtime").value;

		var url = "RefreshRoomsServlet?starttime=" + escape(starttime)
				+ "&endtime=" + escape(endtime);
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = refresh;
		xmlHttp.send(null);
	}

	function refresh() {
		clearMeetingRooms();
		var roomid = document.getElementById("roomid");
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {

				var elements = xmlHttp.responseXML
						.getElementsByTagName("option");
				for ( var i = 0; i < elements.length; i++) {
					var value = elements[i].getElementsByTagName("value")[0].firstChild.nodeValue;
					var text = elements[i].getElementsByTagName("text")[0].firstChild.nodeValue;
					roomid.options.add(new Option(text, value), i + 1);
				}
			}
		}

	}

	function clearMeetingRooms() {
		document.getElementById("roomid").options.length = 1;
	}

	////////////////////////
	function getRemark() {
		var message = document.getElementById("roomremark").value;
		document.getElementById("roomremark_value").value = message;
	}
	//使用ajax方法访问，验证账户名是否存在
	function checktime(val, target) {
		//validateMessage.html("");
		checknull(val, target);
		//var target1 = target;
		//target1 += "_mes";
		//document.getElementById(target1).className = 1;
		//finalcheck();
		if (document.getElementById("endtime_mes").className == 1) {
			$.ajax({
				type : "POST",
				url : "TimeCheckServlet",
				data : {
					start : $("#starttime").val(),
					end : $("#endtime").val(),
					deptid : $("#deptid").val()

				},
				success : function(message) {
					var validateMessage = $("#checktime");
					var data = JSON.parse(message);
					if (data.flag) {
						if ($("#starttime").val() == "") {
							validateMessage.html("");
							return;
						}
						validateMessage.html(data.msg);
						validateMessage.css({
							color : "green"
						});
					} else {
						validateMessage.html("<font name=error>" + data.msg
								+ "</font>");
						validateMessage.css({
							color : "red"
						});
					}
					finalcheck();
				}
			});
		}

	}

	function checknull(val, target) {
		var target1 = target;
		target += "_mes";
		document.getElementById(target).className = 1;
		if (val == "") {
			document.getElementById(target).innerHTML = "<font name=error color=red>输入不能为空</font>";
			return 0;
		} else {
			document.getElementById(target).innerHTML = "";
			finalcheck();
			return 1;
		}

	}

	function LimitTextArea(field) {
		maxlimit = 200;
		if (field.value.length > maxlimit) {
			field.value = field.value.substring(0, maxlimit);
			alert("字数不得多于200！");
		}
	}

	function finalcheck() {
		var i = 0;
		var all = document.getElementsByClassName(0);
		if (all.length != 0) {
			document.getElementById('book_button').disabled = true;
			return;
		}
		var error = document.getElementsByName('error');
		if (error.length != 0) {
			document.getElementById('book_button').disabled = true;
			return;
		}
		document.getElementById('book_button').disabled = false;
	}
	
	function aaa(){
		var all = document.getElementsByClassName(1);
		if(all.length != 0){
			document.getElementById("meetingname_mes").className = 0;
			document.getElementById("meetingname_mes").innerHTML = "";
			document.getElementById("meetingparticipatenumber_mes").className = 0;
			document.getElementById("meetingparticipatenumber_mes").innerHTML = "";
			document.getElementById("starttime_mes").className = 0;
			document.getElementById("starttime_mes").innerHTML = "";
			document.getElementById("endtime_mes").className = 0;
			document.getElementById("endtime_mes").innerHTML = "";
			document.getElementById("deptid_mes").innerHTML = "";
			document.getElementById("checktime").innerHTML = "";
		}
		document.getElementById('book_button').disabled = true;	
	}
</script>
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>会议预定 > 预定会议</h2>
		</div>
		<form class="fm" name="form1" 
			action="BookMeetingServlet?user=${requestScope.user}" method="post">
			<div class="kv-item clearfix">
				<label>提示信息：</label>
				<div class="kv-item-content">
					<font color="red">${requestScope.msg}</font>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>会议名称：</label>
				<div class="kv-item-content">
					<input type="text" id="meetingname" name="meetingname"
						maxlength="20" onchange="checknull(this.value,this.id)" />
					<div id="meetingname_mes" class=0></div>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>预计参加人数：</label>
				<div class="kv-item-content">
					<input type="text" id="meetingparticipatenumber"
						name="meetingpnumber" onchange="checknull(this.value,this.id)" />
					<div id="meetingparticipatenumber_mes" class=0></div>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>预计开始时间：</label>
				<div class="kv-item-content  time-select-wrap">
					<div class="time-select">
						<input type="text" id="starttime" name="starttime"
							onClick="WdatePicker({maxDate:'#F{$dp.$D(\'endtime\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							onchange="checktime(this.value,this.id)"><i
							class="date-icon"></i>
					</div>
					<div id="starttime_mes" class=0></div>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>预计结束时间：</label>
				<div class="kv-item-content  time-select-wrap">
					<div class="time-select">
						<input type="text" id="endtime" name="endtime"
							onClick="WdatePicker({minDate:'#F{$dp.$D(\'starttime\')}' , dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							onchange="checktime(this.value,this.id)"><i
							class="date-icon"></i>
					</div>
					<div id="endtime_mes" class=0></div>
				</div>
			</div>
			<div class="kv-item clearfix">
				<label><font color="red">*</font>会议室名称：</label>
				<div class="kv-item-content">
					<div class="">
						<select class="" id="deptid" name="meetingroomid"
							onchange="checktime(this.value,this.id)">
							<c:forEach var="meetingroom"
								items="${requestScope.meetingroomsList}">
								<c:if test="${meetingroom.roomnumber== param.deptid}">
									<option value="${meetingroom.roomname}" selected>${meetingroom.roomname}(可容纳${meetingroom.roommax}人)</option>
								</c:if>
								<c:if test="${meetingroom.roomnumber!= param.deptid}">
									<option value="${meetingroom.roomname}">${meetingroom.roomname}(可容纳${meetingroom.roommax}人)</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div id="checktime"></div>
					<div id="deptid_mes" ></div>
				</div>
			</div>

			<div class="kv-item clearfix">
				<label>会议说明：</label>
				<div class="kv-item-content">
					<textarea id="description" name="meetingillustrate"
						placeholder="不多于200字" oninput="LimitTextArea(this)" rows="5"></textarea>
				</div>
			</div>

			<div class="kv-item clearfix">
				<label><font color="red">*</font>选择参会人员：</label>
				<div class="kv-item-content">
					<div id="divfrom" name=meetingrname>
						<select id="selDepartments" name="deptid"
							onclick="showEmployees()">
							<c:forEach var="department"
								items="${requestScope.departmentsList}">
								<c:if test="${department.departmentid== param.deptid}">
									<option value="${department.departmentname}" selected>${department.departmentname}</option>
								</c:if>
								<c:if test="${department.departmentid!= param.deptid}">
									<option value="${department.departmentname}">${department.departmentname}</option>
								</c:if>
							</c:forEach>
						</select> <select id="selEmployees" multiple="true">
						</select>
					</div>
					<div id="divoperator">
						<input type="button" class="clickbutton" value="&gt;"
							onclick="selectEmployees()" /> <input type="button"
							class="clickbutton" value="&lt;" onclick="deSelectEmployees()" />
					</div>
					<div id="divto">
						<select id="selSelectedEmployees" name="selSelectedEmployees"
							multiple="true"">
						</select>
					</div>
				</div>
			</div>
			<div class="button">
				<input id="book_button" type="submit"
					class="sapar-btn sapar-btn-recom" value="预定会议" disabled="disabled" />
				<input type="reset" class="sapar-btn sapar-btn-recom" value="重置" onclick="aaa()"/>
			</div>
		</form>
	</div>
	</div>
</body>
</html>